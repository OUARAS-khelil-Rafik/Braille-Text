// ignore_for_file: file_names

import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class Translation extends StatelessWidget {
  const Translation({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return const Material(
              );
            }),
      ),);
  }
}
