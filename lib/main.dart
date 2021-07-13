import 'package:encryptionapp/presentation/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'build_encrypt_button.dart';
import 'build_decrypt_button.dart';
import 'enter_password.dart';

void main() => runApp(NinjaCard()); // Moved Scaffold to class NinjaCard

class NinjaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(0,236, 240, 228),
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
            width: 400.0,

            child: Form(
              child: Column(children: [
                EnterPassword(),
                BuildEncryptButton(), // Moved to another class for each
                BuildDecryptButton(),               
              ]),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          // Moved FloatingActionButton to bottom right
          onPressed: () {},
          label: const Text('Add File'), // Added Custom Text
          icon: const Icon(MyFlutterApp.fileexplorericon), // Added Custom Icon
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}
