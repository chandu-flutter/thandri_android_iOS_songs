import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:thandri_sannidhi/about.dart';
import 'package:thandri_sannidhi/policy.dart';
import 'package:thandri_sannidhi/testimony.dart';
import 'package:thandri_sannidhi/website.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl(String url) async {
      final Uri uri = Uri(scheme: "https", host: url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw "Cannot launch url";
      }
    }

    return Drawer(
//      backgroundColor: const Color.fromARGB(255, 54, 1, 63),
      backgroundColor: Color.fromARGB(255, 1, 41, 63),
      elevation: 0,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 1, 41, 63),
            ),
            child: Center(
              child: Column(
                children: [
                  Image(
                    image: AssetImage('images/logo.png'),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.church,
              size: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: const Text(
              "About Us ",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AboutScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.public,
              size: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: const Text(
              "Website",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Website();
                  },
                ),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.money,
          //     size: 20,
          //     color: Color.fromARGB(255, 255, 255, 255),
          //   ),
          //   title: const Text(
          //     "Offering",
          //     style: TextStyle(color: Colors.white, fontSize: 16),
          //   ),
          //   // onTap: () {
          //   //   Navigator.push(
          //   //     context,
          //   //     MaterialPageRoute(
          //   //       builder: (context) {
          //   //         return PolicyScreen();
          //   //       },
          //   //     ),
          //   //   );
          //   // },
          // ),
          ListTile(
            leading: const Icon(
              Icons.policy,
              size: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: const Text(
              "Privacy policy ",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PolicyScreen();
                  },
                ),
              );
            },
          ),

          Lottie.asset("animations/sw_le.json"),
        ],
      ),
    );
  }
}
