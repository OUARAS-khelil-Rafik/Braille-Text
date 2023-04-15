// ignore_for_file: file_names
import '../Bars/NavBar.dart';
import 'Scan.dart';
import 'Translation.dart';
import 'package:flutter/material.dart';
import 'Transcriptor.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}
class _MainPagesState extends State<MainPages> {
  int index = 0;
  final pages = [
    const Transcriptor(),
    const Translation(),
    const Scan(),
  ];
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
      body: pages[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 70,
          indicatorColor: Colors.grey.withOpacity(0.3),
          labelTextStyle: MaterialStateProperty.all(
          const TextStyle(
          color: Colors.black,
          fontFamily: 'DM_Sans',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          )
        )),
        child: NavigationBar(
          animationDuration: const Duration(milliseconds: 30),
          selectedIndex: index,
          onDestinationSelected: (int newIndex) {
            setState(() {
              index = newIndex;
            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.format_align_center_rounded, color: Color(0xFF2BB4FF), size: 30,),
              icon: Icon(Icons.format_align_left_sharp, size: 30,),
              label: 'Transcriptor',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.drag_indicator, color: Color(0xFF2BB4FF), size: 35,),
              icon: Icon(Icons.drag_indicator_outlined, size: 35,),
              label: 'Translation',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.document_scanner, color: Color(0xFF2BB4FF), size: 30,),
              icon: Icon(Icons.document_scanner_outlined, size: 30,),
              label: 'Scan',
            ),
          ],
        ),
      ),
    );
  }
}
