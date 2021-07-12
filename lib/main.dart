import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:encryptionapp/presentation/my_flutter_app_icons.dart';
import 'package:flutter/services.dart';
import 'build_encrypt_button.dart';
import 'build_decrypt_button.dart';
import 'enter_password.dart';

void main() => runApp(NinjaCard()); // Moved Scaffold to class NinjaCard

class NinjaCard extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      print(file.name);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          onPressed: () => _openFileExplorer(),
          label: const Text('Add File'), // Added Custom Text
          icon: const Icon(MyFlutterApp.fileexplorericon), // Added Custom Icon
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}
