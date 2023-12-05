import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:thandri_sannidhi/home.dart';

class TestimonyReceivedScreen extends StatelessWidget {
  final String name;
  TestimonyReceivedScreen({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Thank you $name"),
        backgroundColor: Color.fromARGB(255, 97, 3, 114),
        centerTitle: true,
        elevation: 40,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.home),
            highlightColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 54, 1, 63),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 32, right: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "To God be the Glory  $name",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Thank you for sharing ',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Continue your walk with Jesus',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
