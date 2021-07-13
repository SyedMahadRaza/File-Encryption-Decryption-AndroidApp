// import 'package:encryptionapp/filename.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:encryptionapp/presentation/my_flutter_app_icons.dart';
// import 'build_encrypt_button.dart';
// import 'build_decrypt_button.dart';
// import 'enter_password.dart';

void main() => runApp(NinjaCard()); // Moved Scaffold to class NinjaCard

class NinjaCard extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _fileName = "File Not Selected";
  PlatformFile? _fileInfo;
  final int fileLimitation = 2000000;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      if (file.size < fileLimitation) {
        setState(() {
          _fileName = file.name;
          _fileInfo = file;
        });
      } else {
        setState(() {
          _fileName = "File Size Exceeded 2 MB";
          _fileInfo = null;
        });
      }
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
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                    child: Text(
                      _fileName,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: myController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(fontSize: 20.0, color: Colors.black)),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
                    child: ElevatedButton(
                        key: Key('encrypt'),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child:
                              Text('Encrypt', style: TextStyle(fontSize: 30.0)),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ))),
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              _fileInfo?.extension != null) {
                            setState(() {
                              _fileName = myController.text;
                            });
                          }
                        }),
                  ),
                  Container(
                    child: ElevatedButton(
                        key: Key('decrypt'),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child:
                              Text('Decrypt', style: TextStyle(fontSize: 30.0)),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ))),
                        onPressed: () {}),
                  ),
                ],
              ),
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
