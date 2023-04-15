// ignore_for_file: file_names, avoid_print
import 'dart:io';
import 'package:flutter/material.dart';

import '../Pages/Scan.dart';
import '../Pages/Translation.dart';
import '../Pages/Transcriptor.dart';
//import 'package:flutter/services.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: ListView(
        padding: const EdgeInsets.only(top: 0, left: 0),
        children: <Widget>[
          const Image(image: AssetImage('assets/images/backgroundNavBar.png')),
          ListTile(
            title: RichText(
          text: const TextSpan(
              children: [
                TextSpan(
                  text: "BRAILLE",
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color(0xFF2BB4FF)
              ),
                ),
                
              TextSpan(
                  text: " ⠨⠃⠨⠗⠨⠁⠨⠊⠨⠇⠨⠇⠨⠑",
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'DM_sans',
              fontSize: 22,
              color: Colors.black
              ),
                ),
              ]
            ),
          ),
            onTap: () => print("Transcriptor"),
          ),
          const SizedBox(
            height: 20,
           ),
          ListTile(
            leading: const Icon(Icons.format_align_left, color: Color(0xFF2BB4FF), size: 35,),
            title: const Text("Transcriptor", style: TextStyle(color: Colors.black, fontFamily: 'DM_Sans',fontSize: 20, fontWeight: FontWeight.bold),),
            onTap: () => const Transcriptor(),
          ),
          const SizedBox(
            height: 20,
           ),
          ListTile(
            leading: const Icon(Icons.change_circle, color: Color(0xFF2BB4FF), size: 35,),
            title: const Text("Translation", style: TextStyle(color: Colors.black, fontFamily: 'DM_Sans',fontSize: 20, fontWeight: FontWeight.bold),),
            onTap: () => const Translation(),
          ),
          const SizedBox(
            height: 20,
           ),
          ListTile(
            leading: const Icon(Icons.document_scanner_outlined, color: Color(0xFF2BB4FF), size: 35,),
            title: const Text("Scan", style: TextStyle(color: Colors.black, fontFamily: 'DM_Sans',fontSize: 20, fontWeight: FontWeight.bold),),
            onTap: () =>  const Scan(),
          ),
          const Divider(
            height: 30,
            endIndent: 25,
            indent: 10,
            thickness: 2,
            color: Colors.black,
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Color(0xFF2BB4FF), size: 35,),
            title: const Text("Settings", style: TextStyle(color: Colors.black, fontFamily: 'DM_Sans',fontSize: 20, fontWeight: FontWeight.bold),),
            onTap: () => print("Settings"),
          ),
          const SizedBox(
            height: 20,
           ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Color(0xFF2BB4FF), size: 35,),
            title: const Text("Exit", style: TextStyle(color: Colors.black, fontFamily: 'DM_Sans',fontSize: 20, fontWeight: FontWeight.bold),),
            onTap: () => exitDialog(context),
            //SystemNavigator.pop(), //Exit Application
            //exit(0),
          ),
        ],
      ),
    );
  }
}

// Fonction of show dialog "exit" :
Future<void> exitDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("Are you sure ?"),
        content: const Text("Do you want to exit from the app ?"),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF2BB4FF),
            ),
            child: const Text('EXIT'),
            onPressed: () {
              exit(0);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ],
      );
    },
  );
}
