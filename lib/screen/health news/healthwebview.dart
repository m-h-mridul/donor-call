// ignore_for_file: use_key_in_widget_constructors, prefer_collection_literals

import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:blood_donation_collage/design/media_query.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  static const name = 'webview';
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  WebViewController? flutterWebviewPlugin;

  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuerypage.init(context);
    return WillPopScope(
      onWillPop: () async {
        WebViewController? controllertwo = await _controller.future;
        if (await controllertwo.canGoBack()) {
          await controllertwo.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: WebView(
        initialUrl: 'https://www.prothomalo.com/life/health',
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        onWebViewCreated: (WebViewController webcontroller) {
          _controller.complete(webcontroller);
          flutterWebviewPlugin = webcontroller;
        },
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        gestureRecognizers: Set()
          ..add(
            Factory<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer(),
            ),
          ),
        onPageStarted: (url) async {
          WebViewController? controllertwo = await _controller.future;
          controllertwo.runJavascriptReturningResult(
              "document.getElementsByTagName('header')[0].style.display = 'none'");
          controllertwo.runJavascriptReturningResult(
              "document.getElementsByTagName('footer')[0].style.display = 'none'");
          //  print('\n\n\n' + url.toString() + '\n\n');
          // if (url.toString() != 'https://www.prothomalo.com/life/health') {
          //   Get.to(() => NewWebViewExample(url.toString()));
          // }
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) async {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ),
    );
  }
}

JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        // ignore: deprecated_member_use
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      });
}
