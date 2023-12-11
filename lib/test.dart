import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:thandri_sannidhi/testimonyReceived.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  //CollectionReference users = FirebaseFirestore.instance.collection("users");
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final testimonyController = TextEditingController();
  final fireStore = FirebaseFirestore.instance.collection("testimony");

  final ImagePicker _picker = ImagePicker();
  List<XFile> _selectedFiles = [];
  FirebaseStorage _storageRef = FirebaseStorage.instance;
  List<String> _arrImageUrls = [];

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Your Mobile Number";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Your Testimony"),
        backgroundColor: const Color.fromARGB(255, 54, 1, 63),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // Lottie.asset("animations/new.json", height: 100),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 28.0, right: 28, top: 35, bottom: 5),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Your Name",
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Color.fromARGB(255, 54, 1, 63),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Your Name";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 28.0, right: 28, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      hintText: "Your Phone Number",
                      prefixIcon: Icon(Icons.phone_android),
                      prefixIconColor: Color.fromARGB(255, 54, 1, 63),
                    ),
                    validator: validatePhone,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 28.0, right: 28, top: 5, bottom: 5),
                  child: TextFormField(
                    maxLines: 15,
                    controller: testimonyController,
                    decoration: const InputDecoration(
                      hintText: "Your Testimony",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Your Testimony";
                      }
                      return null;
                    },
                  ),
                ),
                OutlinedButton(
                    child: Text("Upload Images"),
                    onPressed: () {
                      selectImage();
                    }),
                GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: _selectedFiles.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.file(
                          File(_selectedFiles[index].path),
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      fireStore
                          .doc(nameController.text + "|" + phoneController.text)
                          .set({
                        'name': nameController.text.toString(),
                        'mobile': phoneController.text.toString(),
                        'Testimony': testimonyController.text.toString(),
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return TestimonyReceivedScreen();
                          //name: nameController.text.toString(),
                        }),
                      );
                    }

                    uploadFunction(_selectedFiles);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 54, 1, 63),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: const Size(350, 50),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> selectImage() async {
    if (_selectedFiles != null) {
      _selectedFiles.clear();
    }
    try {
      final List<XFile>? imgs = await _picker.pickMultiImage();
      if (imgs!.isNotEmpty) {
        _selectedFiles.addAll(imgs);
      }
    } catch (e) {
      print(
        "Something went Wrong" + e.toString(),
      );
    }
    setState(() {});
  }

  void uploadFunction(List<XFile> _images) {
    for (int i = 0; i < _images.length; i++) {
      var imageUrl = uploadFile(_images[i]);
      _arrImageUrls.add(
        imageUrl.toString(),
      );
    }
  }

  Future<String> uploadFile(XFile _image) async {
    Reference reference = _storageRef
        .ref()
        .child(nameController.text + "|" + phoneController.text)
        .child(_image.name);
    UploadTask uploadTask = reference.putFile(
      File(_image.path),
    );
    await uploadTask.whenComplete(() {
      print(reference.getDownloadURL());
    });
    return await reference.getDownloadURL();
  }
}
