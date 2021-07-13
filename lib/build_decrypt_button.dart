import 'package:flutter/material.dart';

class BuildDecryptButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5.0),
        child: Column(
          children: [
            ElevatedButton(
                key: Key('decrypt'),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Decrypt', style: TextStyle(fontSize: 30.0)),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ))),
                onPressed: () {}),
          ],
        ));
  }
}
