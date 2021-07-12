import 'package:flutter/material.dart';

class BuildDecryptButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ElevatedButton(
            key: Key('decrypt'),
            child: Text('Decrypt', style: TextStyle(fontSize: 20.0)),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )
              )
              ),
            onPressed: () {}),
        TextButton(
            child: Text('Decrypt the file', style: TextStyle(fontSize: 20.0)),
            onPressed: () {}),
      ],
    ));
  }
}
