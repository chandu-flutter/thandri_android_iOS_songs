import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final String imageUrl =
      'gs://your-firebase-storage-bucket/image.jpg'; // Replace with your image URL

  Future<void> _loadImage() async {
    final ref = FirebaseStorage.instance.refFromURL(imageUrl);
    final imageBytes = await ref.getData();
    final image = Image.memory(imageBytes!);
    setState(() {
      _image = image;
    });
  }

  late Image _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image from Firebase Storage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image ?? const CircularProgressIndicator(), // Display the image
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _loadImage,
              child: const Text('Load Image'),
            ),
          ],
        ),
      ),
    );
  }
}
