import 'package:flutter/material.dart';

class EnterPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
          // new TextField(
          //   decoration: new InputDecoration(
          //     labelText: "Enter your password",

              
          //     ),
          //   keyboardType: TextInputType.number,
          // ),
          // Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),)

          Padding(
            padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
            child: TextField(
              style: TextStyle(
                color:Colors.white
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                ),
                labelText: 'Password',
                labelStyle: TextStyle(fontSize: 15,
                color: Colors.white)
            ),
            keyboardType: TextInputType.number,
          ),
          )
          
        ],
    ));
  }
}
