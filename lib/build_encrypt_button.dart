import 'package:flutter/material.dart';

class BuildEncryptButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: Column(
          children: [
            ElevatedButton(
                key: Key('encrypt'),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Encrypt', style: TextStyle(fontSize: 30.0)),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ))),
                onPressed: () {}),
          ],
        ));
  }
}
