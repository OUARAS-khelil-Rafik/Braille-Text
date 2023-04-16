// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../Bars/NavBar.dart';

class Translation extends StatelessWidget {
  const Translation({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          shadowColor: Colors.grey.shade600,
          toolbarHeight: 70,
          leading: Builder(builder: (context)=> IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: const Icon(Icons.view_stream, color: Color(0xFF2BB4FF), size: 32,))),
          title: RichText(
            text: const TextSpan(
                children: [
                  TextSpan(
                    text: "BRAILLE",
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27,
                color: Color(0xFF2BB4FF),
                ),
                  ),
                  
                TextSpan(
                    text: " ⠨⠃⠨⠗⠨⠁⠨⠊⠨⠇⠨⠇⠨⠑",
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black
                ),
                  ),
                ]
              ),
            ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Scrollbar(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return const Material(
                );
              }),
        ),
    );
  }
}
