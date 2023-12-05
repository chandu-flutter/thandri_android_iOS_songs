import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ZoomLive extends StatelessWidget {
  final String zoomlive = 'https://zoom.us/';

  const ZoomLive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(zoomlive)),
        ),
      ),
    );
  }
}
