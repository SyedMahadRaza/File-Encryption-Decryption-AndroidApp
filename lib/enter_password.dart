import 'package:flutter/material.dart';

class EnterPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        // new TextField(
        //   decoration: new InputDecoration(
        //     labelText: "Enter your password",

        //     ),
        //   keyboardType: TextInputType.number,
        // ),
        // Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),)

        Padding(
          padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                labelText: 'Password',
                labelStyle: TextStyle(fontSize: 20.0, color: Colors.black)),
            keyboardType: TextInputType.text,
          ),
        )
      ],
    ));
  }
}
