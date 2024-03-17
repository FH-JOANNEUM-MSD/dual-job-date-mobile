import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatelessWidget {
  final String title;
  final WebViewController webViewController;

  const WebViewContainer(
      {super.key, required this.title, required this.webViewController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebViewWidget(controller: webViewController),
    );
  }
}
