import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_firebase_dio/app/modules/customer/presenter/customer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _createChatRoom(String roomName) async {
    final user = _auth.currentUser;
    if (user != null) {
      final chatRoomRef = _firestore.collection('chat_rooms').doc(roomName);
      final chatRoomData = {'name': roomName};

      await chatRoomRef.set(chatRoomData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          'Home',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              GestureDetector(
                onTap: () {
                  _createChatRoom('Sala 1');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomerPage(),
                    ),
                  );
                },
                child: const Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        size: 48,
                        color: Colors.deepOrange,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sala 1',
                        style: TextStyle(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _createChatRoom(
                    'Sala 2',
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomerPage(),
                    ),
                  );
                },
                child: const Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 48,
                        color: Colors.deepOrange,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sala 2',
                        style: TextStyle(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _createChatRoom(
                    'Sala 3',
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomerPage(),
                    ),
                  );
                },
                child: const Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        size: 48,
                        color: Colors.deepOrange,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sala 3',
                        style: TextStyle(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _createChatRoom(
                    'Sala 4',
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomerPage(),
                    ),
                  );
                },
                child: const Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mail,
                        size: 48,
                        color: Colors.deepOrange,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sala 4',
                        style: TextStyle(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
