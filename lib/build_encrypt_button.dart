import 'package:flutter/material.dart';

class BuildEncryptButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ElevatedButton(
            key: Key('encrypt'),
            child: Text('Encrypt', style: TextStyle(fontSize: 20.0)),
            onPressed: () {}),
        TextButton(
            child: Text('Encrypt the file', style: TextStyle(fontSize: 20.0)),
            onPressed: () {}),
      ],
    ));
  }
}
