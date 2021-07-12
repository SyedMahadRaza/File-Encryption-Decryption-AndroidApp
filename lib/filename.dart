import 'package:flutter/material.dart';

class FileName extends StatelessWidget {
  final String fileName;
  FileName(this.fileName);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
          child: Text(
            fileName,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ));
  }
}
