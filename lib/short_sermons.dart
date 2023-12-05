import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ShortSermons extends StatelessWidget {
  final String youtubePlaylistUrl =
      'https://www.youtube.com/playlist?list=PLDb1p7boCQFG8OFYE4IkDXvtHv0QaCe2S';

  const ShortSermons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(youtubePlaylistUrl)),
        ),
      ),
    );
  }
}
