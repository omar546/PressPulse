import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String link;
  const WebViewScreen({required this.link ,super.key});




  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(link));
    return Scaffold(
      appBar: AppBar(),
body:  WebViewWidget(controller: controller),
    );
  }
}
