import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthWebScreen extends StatefulWidget {
  final String requestToken;
  const AuthWebScreen({
    required this.requestToken,
    super.key,
  });

  @override
  State<AuthWebScreen> createState() => _AuthWebScreenState();
}

late WebViewController controller;

class _AuthWebScreenState extends State<AuthWebScreen> {
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          'https://www.themoviedb.org/authenticate/${widget.requestToken}',
        ),
      );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
