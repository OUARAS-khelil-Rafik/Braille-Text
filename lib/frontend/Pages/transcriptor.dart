// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Bars/NavBar.dart';
import '../Voice/speech_text_recognizer.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class Transcriptor extends StatefulWidget {
  const Transcriptor({super.key});

  @override
  State<Transcriptor> createState() => _TranscriptorState();
}
class _TranscriptorState extends State<Transcriptor> {

  bool isEnabled = true;

  @override
  void initState() {
    super.initState();
    _checkSpeechAvailability();
  }

  _checkSpeechAvailability() async {
    isEnabled = await SpeechTextRecognizer.initialize();
    setState(() {});
  }

  _recognizedText() async {
    await SpeechTextRecognizer.startListning(speechRecogListner, localeId[index]);
  }

  void speechRecogListner(SpeechRecognitionResult result) {
    print(result.recognizedWords);
    setState(() {
      textFieldController.text = result.recognizedWords;
    });
  }



  int index = 0;
  List <String> localeId = ["auto","ar_SA","en_US","fr_FR"];
  final LanguageList = [
    {"id": "0","name": "Auto (Detect)", "image": "assets/images/flags/Auto.png", "code": "auto"},
    {"id": "1","name": "Arabic (العربية)", "image": "assets/images/flags/AR.png", "code": "ar"},
    {"id": "2","name": "English (Anglais)", "image": "assets/images/flags/US.png", "code": "en"},
    {"id": "3","name": "French (Français)", "image": "assets/images/flags/FR.png", "code": "fr"}
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
    onTap: () {
      setState(() {
        if(item["id"] == "0"){
          index = 0;
        }else{
          if(item["id"] == "1"){
            index = 1;
          }else{
            if(item["id"] == "2"){
              index = 2;
            }else{
              if(item["id"] == "3"){
                index = 3;
              }
            }
          }
        }
      });
    },
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
        drawer: const NavBar(),
        appBar: AppBar(
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
                return Material(
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
                                color: Colors.white.withOpacity(0.1),
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
                                borderRadius: BorderRadius.circular(25),
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
                                          maxLength: 5000,
                                          onChanged: (value) {
                                          },
                                          decoration: const InputDecoration(
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            border: InputBorder.none,
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
                                                icon: !SpeechTextRecognizer.isListning() ? const Icon(Icons.mic) : const Icon(Icons.stop),
                                                onPressed: () async {
                                                  setState(() {
                                                    SpeechTextRecognizer.isListning() ? SpeechTextRecognizer.stopListning : _recognizedText();
                                                    textFieldController.text;
                                                  });
                                                  }
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.paste),
                                                onPressed: () async {
                                                  final data = await Clipboard.getData(Clipboard.kTextPlain);
                                                  if (data != null) {
                                                    textFieldController.text = data.text!;
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      const SnackBar(content: Text('Pasted from clipboard')),
                                                    );
                                                  }
                                                }
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
                                          maxLength: 5000,
                                          onChanged: (value) {
                                            setState(() {
                                              // trigger a rebuild when the text changes
                                            });
                                          },
                                          decoration: const InputDecoration(
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            border: InputBorder.none,
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
                                                icon: const Icon(Icons.cloud_upload),
                                                onPressed: () {
                                                },
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
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            border: InputBorder.none,
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
                                                onPressed: () {
                                                  Clipboard.setData(ClipboardData(text: brailleFieldController.text));
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(content: Text('Copied to clipboard'))
                                                  );
                                                },
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
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            border: InputBorder.none,
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
                                                icon: const Icon(Icons.content_copy),
                                                onPressed: () async {
                                                  Clipboard.setData(ClipboardData(text: textFieldController.text));
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(content: Text('Copied to clipboard'))
                                                  );
                                                }
                                              ),
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
        ),
    );
  }
}