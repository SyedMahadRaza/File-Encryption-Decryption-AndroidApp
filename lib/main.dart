import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:aes_crypt/aes_crypt.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:encryptionapp/presentation/my_flutter_app_icons.dart';

void main() => runApp(NinjaCard()); // Moved Scaffold to class NinjaCard

class NinjaCard extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  bool _isGranted = true;
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _fileName = "File Not Selected";
  PlatformFile? _fileInfo;
  File? superFile;
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

  Future<Directory> get getExternalVisibleDir async {
    if (await Directory('/storage/emulated/0/MyEncFolder').exists()) {
      final externalDir = Directory('/storage/emulated/0/MyEncFolder');
      return externalDir;
    } else {
      await Directory('/storage/emulated/0/MyEncFolder')
          .create(recursive: true);
      final externalDir = Directory('/storage/emulated/0/MyEncFolder');
      return externalDir;
    }
  }

  requestStoragePermission() async {
    if (!await Permission.storage.isGranted) {
      PermissionStatus result = await Permission.storage.request();
      if (result.isGranted) {
        setState(() {
          _isGranted = true;
        });
      } else {
        setState(() {
          _isGranted = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    requestStoragePermission();

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

              // FileName
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

                  // Password Field
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

                  // Encrypt Button
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
                        onPressed: () async {
                          if (_isGranted) {
                            Directory d = await getExternalVisibleDir;
                            if (_formKey.currentState!.validate() &&
                                _fileInfo?.extension != null) {
                              var crypt = AesCrypt();
                              crypt.setPassword(myController.text);
                              crypt.setOverwriteMode(AesCryptOwMode.on);
                              crypt.encryptFileSync(
                                  _fileInfo!.path, '${d.path}/$_fileName.aes');
                              print("file encrypted successfully");
                            } else {
                              print("file encryption unsuccessful");
                            }
                          } else {
                            print("Permission not granted");
                          }
                        }),
                  ),

                  //Decrypt Button
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
                        onPressed: () async {
                          if (_isGranted) {
                            Directory d = await getExternalVisibleDir;
                            var crypt = AesCrypt();
                            crypt.setPassword(myController.text);
                            crypt.setOverwriteMode(AesCryptOwMode.on);
                            crypt.decryptFileSync('${d.path}/$_fileName');
                            print("file dencrypted successfully");
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),

        // floatingActionButton
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
