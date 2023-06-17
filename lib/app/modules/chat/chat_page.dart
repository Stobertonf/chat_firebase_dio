import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:chat_firebase_dio/app/modules/chat/chat_message.dart';
import 'package:chat_firebase_dio/app/modules/chat/text_composer.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  User? _currentUser;
  bool _isLoading = false;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          _currentUser = user;
        });
      }
    });
  }

  Future<User?> _getUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user == null) {
      UserCredential credential = await auth.signInAnonymously();
      user = credential.user;
    }

    return user;
  }

  void _sendMessage({
    required BuildContext context,
    required String? text,
    required File? imgFile,
  }) async {
    final User? user = await _getUser();

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Não foi possível fazer o login. Tente novamente!',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    String photoUrl = user.photoURL ?? '';

    Map<String, dynamic> data = {
      "uid": user.uid,
      "senderName": user.displayName,
      "senderPhotoUrl": photoUrl,
      "time": Timestamp.now(),
    };

    if (imgFile != null) {
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child(user.uid + DateTime.now().millisecondsSinceEpoch.toString())
          .putFile(File(imgFile.path));

      setState(() {
        _isLoading = true;
      });

      task.then((TaskSnapshot taskSnapshot) async {
        String url = await taskSnapshot.ref.getDownloadURL();
        data['imgUrl'] = url;

        setState(() {
          _isLoading = false;
        });

        FirebaseFirestore.instance.collection('messages').add(data);
      });

      return;
    }

    data['text'] = text;

    FirebaseFirestore.instance.collection('messages').add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          _currentUser != null
              ? 'Olá, ${_currentUser!.displayName}'
              : 'Chat App',
        ),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          if (_currentUser != null)
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                googleSignIn.signOut();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Você saiu com sucesso!'),
                  ),
                );
              },
            ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy('time')
                  .snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    if (!snapshot.hasData || snapshot.data == null) {
                      return const Center(
                        child: Text('Nenhum dado disponível.'),
                      );
                    }

                    List<QueryDocumentSnapshot> documents =
                        snapshot.data!.docs.reversed.toList();

                    return ListView.builder(
                      itemCount: documents.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return ChatMessage(
                          documents[index].data() as Map<String, dynamic>,
                          (documents[index].data()
                                  as Map<String, dynamic>?)?['uid'] ==
                              _currentUser?.uid,
                        );
                      },
                    );
                }
              },
            ),
          ),
          if (_isLoading) const LinearProgressIndicator(),
          TextComposer(
            onSendMessage: (
              BuildContext context,
              String? text,
              File? imgFile,
            ) {
              _sendMessage(
                context: context,
                text: text,
                imgFile: imgFile,
              );
            },
          ),
        ],
      ),
    );
  }
}
