import 'package:encryptionapp/filename.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:encryptionapp/presentation/my_flutter_app_icons.dart';
import 'build_encrypt_button.dart';
import 'build_decrypt_button.dart';
import 'enter_password.dart';

void main() => runApp(NinjaCard()); // Moved Scaffold to class NinjaCard

class NinjaCard extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  String _fileName = "File Not Selected";
  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _fileName = file.name;
      });
      print(file.name);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 234, 223),
        appBar: AppBar(
          title: Text(
            'AES Encryption and Decryption',
           style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          // backgroundColor: Colors.grey[850],
          backgroundColor: Color.fromARGB(255, 199, 191, 179),
          elevation: 0.0,
        ),
        body: Center(
          child: Container(
            // padding: EdgeInsets.all(16.0),
            height: 550.0,
            width: 400.0,

            child: Form(
              child: Column(children: [
                FileName(_fileName),
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
