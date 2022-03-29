// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NotificationUI extends StatelessWidget {
  static const name = 'NotificationUI';
  const NotificationUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text('Notification'),
        ),
        body: Container(),
      ),
    );
  }
}
