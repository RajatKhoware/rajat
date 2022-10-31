// import 'dart:io';

// import 'package:flutter_tts/flutter_tts.dart';

// class SpeakOut {
//   late FlutterTts flutterTts;
//   SpeakOut() {
//     this.flutterTts = FlutterTts();
//   }

//   Future _speak() async {
//     var result = await flutterTts.speak("Hello World");
//     // if (result == 1) setState(() => ttsState = TtsState.playing);
//   }

//   Future _stop() async {
//     var result = await flutterTts.stop();
//     // if (result == 1) setState(() => ttsState = TtsState.stopped);
//   }

//   Future speakSettings() async {
//     List<dynamic> languages = await flutterTts.getLanguages;

//     await flutterTts.setLanguage("en-US");

//     await flutterTts.setSpeechRate(1.0);

//     await flutterTts.setVolume(1.0);

//     await flutterTts.setPitch(1.0);

//     await flutterTts.isLanguageAvailable("en-US");

// // iOS and Web only
//     await flutterTts.pause();

// // iOS, macOS, and Android only
//     await flutterTts.synthesizeToFile(
//         "Hello World", Platform.isAndroid ? "tts.wav" : "tts.caf");

//     await flutterTts.setVoice({"name": "Karen", "locale": "en-AU"});

// // iOS only
//     await flutterTts.setSharedInstance(true);

// // Android only
//     await flutterTts.setSilence(2);

//     await flutterTts.getEngines;

//     await flutterTts.getDefaultVoice;

//     await flutterTts.isLanguageInstalled("en-AU");

//     await flutterTts.areLanguagesInstalled(["en-AU", "en-US"]);

//     await flutterTts.setQueueMode(1);

//     await flutterTts.getMaxSpeechInputLength;
//   }
// }
