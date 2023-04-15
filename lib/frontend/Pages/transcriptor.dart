// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';

class Transcriptor extends StatefulWidget {
  const Transcriptor({super.key});

  @override
  State<Transcriptor> createState() => _TranscriptorState();
}
class _TranscriptorState extends State<Transcriptor> {
  String SourceLanguageList = 'auto';
  String SourceBrailleList = '1';
  final LanguageList = [
    {"name": "Auto (Detect)", "image": "assets/images/flags/Auto.png", "code": "auto"},
    {"name": "Arabic (العربية)", "image": "assets/images/flags/AR.png", "code": "ar"},
    {"name": "English (Anglais)", "image": "assets/images/flags/US.png", "code": "en"},
    {"name": "French (Français)", "image": "assets/images/flags/FR.png", "code": "fr"}
  ];
  final BrailleList = [
    {"name": "Grade 01", "image": "assets/images/flags/BRL.png", "code": "1"},
    {"name": "Grade 02", "image": "assets/images/flags/BRL.png", "code": "2"}
  ];
  String? value1;
  String? value2;
  bool isShowingLanguageDropdown = true;
  final TextEditingController textFieldController = TextEditingController();
  final TextEditingController brailleFieldController = TextEditingController();
  DropdownMenuItem<String> buildMenuItem1(Map<String, String> item) => 
  DropdownMenuItem(
    alignment: AlignmentDirectional.center,
    value: item["name"],
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
              item["image"]!,
              width: 20,
            ),
        const SizedBox(width: 5),
        Text(
              item["name"]!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
      ],
    ),
  );
  DropdownMenuItem<String> buildMenuItem2(Map<String, String> item) => 
  DropdownMenuItem(
    alignment: AlignmentDirectional.center,
    value: item["name"],
    child:Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
              item["image"]!,
              width: 23,
            ),
        const SizedBox(width: 5),
        Text(
              item["name"]!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Material(
                color: Colors.grey.shade100,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          isShowingLanguageDropdown
                          ?Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              //border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                alignment: AlignmentDirectional.center,
                                hint: const Text("Black", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                value: value1,
                                icon: const Visibility (visible:false, child: Icon(Icons.arrow_downward)),
                                dropdownColor: Colors.white.withOpacity(0.9),
                                isExpanded: true,
                                items: LanguageList.map(buildMenuItem1).toList(),
                                onChanged: ((value1) {
                                  setState(() {
                                    this.value1 = value1; 
                                  });
                                }),
                              ),
                            ),
                          ):Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              //border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                alignment: AlignmentDirectional.center,
                                hint: const Text("Braille", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                value: value2,
                                icon: const Visibility (visible:false, child: Icon(Icons.arrow_downward)),
                                dropdownColor: Colors.white.withOpacity(0.9),
                                items: BrailleList.map(buildMenuItem2).toList(),
                                onChanged: ((value2) {
                                  setState(() {
                                    this.value2 = value2; 
                                  });
                                })),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              //border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: IconButton(
                              onPressed: (() {
                                setState(() {
                                  isShowingLanguageDropdown = !isShowingLanguageDropdown;
                                });
                              }),
                              icon: const Icon(Icons.multiple_stop, color: Color(0xFF2BB4FF), size: 35,),
                            )
                          ),
                          isShowingLanguageDropdown ?
                          Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              //border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                alignment: AlignmentDirectional.center,
                                hint: const Text("Braille", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                value: value2,
                                icon: const Visibility (visible:false, child: Icon(Icons.arrow_downward)),
                                dropdownColor: Colors.white.withOpacity(0.9),
                                //isExpanded: true,
                                items: BrailleList.map(buildMenuItem2).toList(),
                                onChanged: ((value2) {
                                  setState(() {
                                    this.value2 = value2; 
                                  });
                                })),
                            ),
                          ):
                          Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              //border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                alignment: AlignmentDirectional.center,
                                hint: const Text("Black", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                value: value1,
                                icon: const Visibility (visible:false, child: Icon(Icons.arrow_downward)),
                                dropdownColor: Colors.white.withOpacity(0.9),
                                isExpanded: true,
                                items: LanguageList.map(buildMenuItem1).toList(),
                                onChanged: ((value1) {
                                  setState(() {
                                    this.value1 = value1; 
                                  });
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  isShowingLanguageDropdown ? Container(
                            alignment: Alignment.center,
                            width: 370,
                            height: null,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              //border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: Column(
                                    children: [
                                      TextField(
                                        style: const TextStyle(
                                          fontFamily: "DM_sans",
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.justify,
                                        textCapitalization: TextCapitalization.sentences,
                                        controller: textFieldController,
                                        minLines: 5,
                                        maxLines: null,
                                        onChanged: (value) {
                                          setState(() {
                                            // trigger a rebuild when the text changes
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          labelText: "Black",
                                          labelStyle: TextStyle(
                                            fontFamily: "DM_sans",
                                            fontSize: 20,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          hintText: "Enter your text...",
                                          hintStyle: TextStyle(
                                            fontFamily: "DM_sans",
                                            fontSize: 25,
                                            color: Color(0xFF2BB4FF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          /*border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),*/
                                        ),
                                      ),
                                     // adjust the position as needed
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Visibility(
                                              visible: textFieldController.text.isNotEmpty,
                                              child: IconButton(
                                                icon: const Icon(Icons.clear),
                                                onPressed: () {
                                                  setState(() {
                                                    textFieldController.clear();
                                                    brailleFieldController.clear();
                                                  });
                                                },
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.cloud_upload),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                      ],
                                  ),
                            ): Container(
                            alignment: Alignment.center,
                            width: 370,
                            height: null,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              //border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: Column(
                                    children: [
                                      TextField(
                                        style: const TextStyle(
                                          fontFamily: "DM_sans",
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        textCapitalization: TextCapitalization.sentences,
                                        controller: brailleFieldController,
                                        minLines: 5,
                                        maxLines: null,
                                        onChanged: (value) {
                                          setState(() {
                                            // trigger a rebuild when the text changes
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          labelText: "Braille",
                                          labelStyle: TextStyle(
                                            fontFamily: "DM_sans",
                                            fontSize: 20,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          hintText: "Enter your braille...",
                                          hintStyle: TextStyle(
                                            fontFamily: "DM_sans",
                                            fontSize: 25,
                                            color: Color(0xFF2BB4FF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          /*border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),*/
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Visibility(
                                              visible: brailleFieldController.text.isNotEmpty,
                                              child: IconButton(
                                                icon: const Icon(Icons.clear),
                                                onPressed: () {
                                                  setState(() {
                                                    textFieldController.clear();
                                                    brailleFieldController.clear();
                                                  });
                                                },
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.copy),
                                              onPressed: () {},
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.keyboard_rounded),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                            ),
                    const SizedBox(
                      height: 40,
                    ),
                    if(textFieldController.text.isNotEmpty || brailleFieldController.text.isNotEmpty) isShowingLanguageDropdown ? Container(
                            alignment: Alignment.center,
                            width: 370,
                            height: null,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              //border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: Column(
                                    children: [
                                      TextField(
                                        style: const TextStyle(
                                          fontFamily: "DM_sans",
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        readOnly: true,
                                        textCapitalization: TextCapitalization.sentences,
                                        controller: brailleFieldController,
                                        minLines: 5,
                                        maxLines: null,
                                        onChanged: (value) {
                                          setState(() {
                                            // trigger a rebuild when the text changes
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          labelText: "Braille",
                                          labelStyle: TextStyle(
                                            fontFamily: "DM_sans",
                                            fontSize: 20,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          hintText: "Transcriptor to braille...",
                                          hintStyle: TextStyle(
                                            fontFamily: "DM_sans",
                                            fontSize: 25,
                                            color: Color(0xFF2BB4FF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          /*border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),*/
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.copy),
                                              onPressed: () {},
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.cloud_download),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                            ):Container(
                            alignment: Alignment.center,
                            width: 370,
                            height: null,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              //border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: Column(
                                    children: [
                                      TextField(
                                        style: const TextStyle(
                                          fontFamily: "DM_sans",
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        readOnly: true,
                                        textCapitalization: TextCapitalization.sentences,
                                        controller: textFieldController,
                                        minLines: 5,
                                        maxLines: null,
                                        onChanged: (value) {
                                          setState(() {
                                            // trigger a rebuild when the text changes
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          labelText: "Black",
                                          labelStyle: TextStyle(
                                            fontFamily: "DM_sans",
                                            fontSize: 20,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          hintText: "Transcriptor to text...",
                                          hintStyle: TextStyle(
                                            fontFamily: "DM_sans",
                                            fontSize: 25,
                                            color: Color(0xFF2BB4FF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          /*border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),*/
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              icon: const Icon(Icons.cloud_download),
                                              onPressed: () {},
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                            )
                  ],
                ),  
      );}),
      ),);
  }
}