import 'package:flutter/material.dart';

class BuildEncryptButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        
         ElevatedButton(
          // child: Padding( padding: EdgeInsets.all(30),),
          
            key: Key('encrypt'),
            child: Text('Encrypt', 
            
            style: TextStyle(
              fontSize: 20.0,
               
              ),
               
              ),
              
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )
              )
              ),
            onPressed: () {}),
            
        TextButton(
            child: Text('Encrypt the file', style: TextStyle(fontSize: 20.0)),
            onPressed: () {}),
        
      ],
        
    ));
  }
}
