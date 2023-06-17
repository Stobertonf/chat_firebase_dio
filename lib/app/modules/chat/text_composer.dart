import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  const TextComposer({
    Key? key,
    required this.onSendMessage,
  }) : super(key: key);

  final Function(BuildContext context, String? text, File? imgFile)
      onSendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final TextEditingController _controller = TextEditingController();
  bool _isComposing = false;

  void _reset() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.photo_camera),
            onPressed: () async {
              final ImagePicker imagePicker = ImagePicker();
              final XFile? image = await imagePicker.pickImage(
                source: ImageSource.camera,
              );
              if (image == null) return;
              final File imgFile = File(image.path);
              widget.onSendMessage(context, null, imgFile);
            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration.collapsed(
                hintText: 'Enviar uma mensagem',
              ),
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                widget.onSendMessage(context, text, null);
                _reset();
              },
            ),
          ),
        ],
      ),
    );
  }
}
