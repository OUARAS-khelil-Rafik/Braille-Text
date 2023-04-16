import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechTextRecognizer {
  static SpeechToText speechToText = SpeechToText();

  static initialize() async {
    bool status = await speechToText.initialize();
    print(status);
    return status;
  }

  static startListning(Function(SpeechRecognitionResult) recogFn, localeId) async {
    try {
      await speechToText.listen(
          listenMode: ListenMode.dictation,
          onResult: recogFn,
          localeId: localeId,
          listenFor: const Duration(minutes: 1));
    } catch (e) {
      print(e);
    }
  }


  static void stopListning() async {
    await speechToText.stop();
  }

  static bool isListning() {
    return speechToText.isListening;
  }
}
