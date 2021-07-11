import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: NinjaCard(),
));

class NinjaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('AES Encryption and Decryption'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Center(
      child: Container(
          // padding: EdgeInsets.all(16.0),
          height: 400.0,
          width:400.0,
         
          child: Form(
            child: Column(
              
              children: buildEncryptButton() + buildDecryptButton() + selectButton()      
            ),
            
          ),
        ),
      ),
      
    );
    
  }



  List<Widget> buildEncryptButton() {
    return <Widget>[
        ElevatedButton(
          key: Key('encrypt'),
          child: Text('Encrypt', style: TextStyle(fontSize: 20.0)),
          onPressed: (){}
        ),
        TextButton(
          child: Text('Encrypt the file', style: TextStyle(fontSize: 20.0)),
          onPressed: (){}
        ),
      ];
  }

  List<Widget> buildDecryptButton() {
    
      return <Widget>[
        ElevatedButton(
          key: Key('decrypt'),
          child: Text('Decrypt', style: TextStyle(fontSize: 20.0)),
          onPressed: (){}
        ),
        TextButton(
          child: Text('Decrypt the file', style: TextStyle(fontSize: 20.0)),
          onPressed: (){}
        ),
        
      ];
    
  }

  List<Widget> selectButton() {
    return <Widget>[
        Positioned(
          right: 0.0,
          bottom: 0.0,
          child: new FloatingActionButton(
            child: const Icon(Icons.camera_alt),
            backgroundColor: Colors.green.shade800,
            onPressed: () {},
          ),
        )
      ];
  }
}