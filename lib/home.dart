import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:thandri_sannidhi/contact.dart';
import 'package:thandri_sannidhi/downloaad.dart';
import 'package:thandri_sannidhi/new.dart';
import 'package:thandri_sannidhi/online_magazine.dart';
import 'package:thandri_sannidhi/prayer_request.dart';
import 'package:thandri_sannidhi/song_lyrics/songbook.dart';
import 'package:thandri_sannidhi/testimony.dart';
import 'package:thandri_sannidhi/website.dart';

import 'live.dart';
import 'prayer_victories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String imageUrl;
  final storage = FirebaseStorage.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageUrl = '';
    getImageUrl();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    OneSignal.initialize("5e3e8968-0e50-4f57-8960-8c0aa731891f");
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  }

  Future<void> getImageUrl() async {
    final ref = storage.ref().child('promise.jpg');

    final url = await ref.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
          icon: const Icon(Icons.menu),
        ),
        backgroundColor: const Color.fromARGB(255, 54, 1, 63),
        title: const Text('Thandri Sannidhi Ministries'),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const Updates();
                //     },
                //   ),
                // );
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.share),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 14,
                    child: Image(
                      image: NetworkImage(imageUrl, scale: 1.0),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const SizedBox(
                            height: 200,
                            width: 340,
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                  Color.fromARGB(255, 54, 1, 63),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      height: 200,
                      width: 340,
                    ),
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SongBookScreen();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.auto_stories,
                    label1: "Song",
                    label2: "Book",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const DownloadScreen();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.description,
                    label1: "Satya",
                    label2: "Darsanam",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PrayerVictories();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.task_alt,
                    label1: "Prayer",
                    label2: "Victories",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PrayerRequestScreen();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.touch_app,
                    label1: "Prayer",
                    label2: "Request",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const YoutubeLive();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.live_tv,
                    label1: "",
                    label2: "Live",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const OnlineMagazineScreen();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.menu_book,
                    label1: "Online",
                    label2: "Magazine",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const TestimonyScreen();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.accessibility_new,
                    label1: "",
                    label2: "Testimony",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const NewScreen();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.person,
                    label1: "New",
                    label2: "Here",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ContactScreen();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.email,
                    label1: "",
                    label2: "Contact",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class Linked extends StatelessWidget {
  IconData icon;
  String label1;
  String label2;
  Linked({
    super.key,
    required this.icon,
    required this.label1,
    required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(4, 4),
          ),
          const BoxShadow(
            color: Colors.white,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label1,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          Icon(
            icon,
            size: 40,
            color: const Color.fromARGB(255, 54, 1, 63),
          ),
          Text(
            label2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
