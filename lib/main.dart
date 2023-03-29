import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_register/basic_home.dart';
import 'package:login_register/meeting.dart';
import 'package:login_register/SignIn.dart';
//import 'HomePage.dart';
import 'package:login_register/widget/audio.dart';

import 'package:login_register/SignUp.dart';
import 'package:login_register/chatPage.dart';
import 'package:login_register/model/CreateLink.dart';
import 'package:login_register/model/scroll.dart';
import 'package:login_register/start.dart';
import 'package:login_register/widget/basic_home_BOttomNavigate.dart';
import 'package:login_register/widget/cameraopen.dart';
import 'package:login_register/widget/meetingvideojisti.dart';
import 'package:login_register/widget/splach_screen.dart';
import 'package:login_register/widget/settings.dart';
import 'HomePage.dart';
import 'model/Settings.dart';
import 'firebase_options.dart';
// import 'package:flutter_camera_practice/home_page.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
      // initialRoute: "HomePage",
      routes: {
        "splach": (context)=> Splach(),
        "audio": (context)=> SpeechSampleApp(),
        "cameraPage":(context)=> CameraPage(),
        chatPage.id:(context) => chatPage(),
        CreateLink.id:(context) => CreateLink(),
        SignUp.id:(context) => SignUp(),
        HomePage.id:(context) => HomePage(),
       // HomePage.id:(context)=> HomePage(),

      },

    );
  }
}
//#################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22
// speech to text
//#################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22

//
// import 'dart:async';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_recognition_error.dart';
// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:speech_to_text/speech_to_text.dart';
//
// void main() => runApp(SpeechSampleApp());
//
// class SpeechSampleApp extends StatefulWidget {
//   @override
//   _SpeechSampleAppState createState() => _SpeechSampleAppState();
// }
//
// /// An example that demonstrates the basic functionality of the
// /// SpeechToText plugin for using the speech recognition capability
// /// of the underlying platform.
// class _SpeechSampleAppState extends State<SpeechSampleApp> {
//   bool _hasSpeech = false;
//   bool _logEvents = false;
//   bool _onDevice = false;
//   final TextEditingController _pauseForController =
//   TextEditingController(text: '3');
//   final TextEditingController _listenForController =
//   TextEditingController(text: '30');
//   double level = 0.0;
//   double minSoundLevel = 50000;
//   double maxSoundLevel = -50000;
//   String lastWords = '';
//   String lastError = '';
//   String lastStatus = '';
//   String _currentLocaleId = '';
//   List<LocaleName> _localeNames = [];
//   final SpeechToText speech = SpeechToText();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   /// This initializes SpeechToText. That only has to be done
//   /// once per application, though calling it again is harmless
//   /// it also does nothing. The UX of the sample app ensures that
//   /// it can only be called once.
//   Future<void> initSpeechState() async {
//     _logEvent('Initialize');
//     try {
//       var hasSpeech = await speech.initialize(
//         onError: errorListener,
//         onStatus: statusListener,
//         debugLogging: _logEvents,
//       );
//       if (hasSpeech) {
//         // Get the list of languages installed on the supporting platform so they
//         // can be displayed in the UI for selection by the user.
//         _localeNames = await speech.locales();
//
//         var systemLocale = await speech.systemLocale();
//         _currentLocaleId = systemLocale?.localeId ?? '';
//       }
//       if (!mounted) return;
//
//       setState(() {
//         _hasSpeech = hasSpeech;
//       });
//     } catch (e) {
//       setState(() {
//         lastError = 'Speech recognition failed: ${e.toString()}';
//         _hasSpeech = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Speech to Text Example'),
//         ),
//         body: Column(children: [
//           HeaderWidget(),
//           Container(
//             child: Column(
//               children: <Widget>[
//                 InitSpeechWidget(_hasSpeech, initSpeechState),
//                 SpeechControlWidget(_hasSpeech, speech.isListening,
//                     startListening, stopListening, cancelListening),
//                 SessionOptionsWidget(
//                   _currentLocaleId,
//                   _switchLang,
//                   _localeNames,
//                   _logEvents,
//                   _switchLogging,
//                   _pauseForController,
//                   _listenForController,
//                   _onDevice,
//                   _switchOnDevice,
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 4,
//             child: RecognitionResultsWidget(lastWords: lastWords, level: level),
//           ),
//           Expanded(
//             flex: 1,
//             child: ErrorWidget(lastError: lastError),
//           ),
//           SpeechStatusWidget(speech: speech),
//         ]),
//       ),
//     );
//   }
//
//   // This is called each time the users wants to start a new speech
//   // recognition session
//   void startListening() {
//     _logEvent('start listening');
//     lastWords = '';
//     lastError = '';
//     final pauseFor = int.tryParse(_pauseForController.text);
//     final listenFor = int.tryParse(_listenForController.text);
//     // Note that `listenFor` is the maximum, not the minimun, on some
//     // systems recognition will be stopped before this value is reached.
//     // Similarly `pauseFor` is a maximum not a minimum and may be ignored
//     // on some devices.
//     speech.listen(
//       onResult: resultListener,
//       listenFor: Duration(seconds: listenFor ?? 30),
//       pauseFor: Duration(seconds: pauseFor ?? 3),
//       partialResults: true,
//       localeId: _currentLocaleId,
//       onSoundLevelChange: soundLevelListener,
//       cancelOnError: true,
//       listenMode: ListenMode.confirmation,
//       onDevice: _onDevice,
//     );
//     setState(() {});
//   }
//
//   void stopListening() {
//     _logEvent('stop');
//     speech.stop();
//     setState(() {
//       level = 0.0;
//     });
//   }
//
//   void cancelListening() {
//     _logEvent('cancel');
//     speech.cancel();
//     setState(() {
//       level = 0.0;
//     });
//   }
//
//   /// This callback is invoked each time new recognition results are
//   /// available after `listen` is called.
//   void resultListener(SpeechRecognitionResult result) {
//     _logEvent(
//         'Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
//     setState(() {
//       lastWords = '${result.recognizedWords} - ${result.finalResult}';
//     });
//   }
//
//   void soundLevelListener(double level) {
//     minSoundLevel = min(minSoundLevel, level);
//     maxSoundLevel = max(maxSoundLevel, level);
//     // _logEvent('sound level $level: $minSoundLevel - $maxSoundLevel ');
//     setState(() {
//       this.level = level;
//     });
//   }
//
//   void errorListener(SpeechRecognitionError error) {
//     _logEvent(
//         'Received error status: $error, listening: ${speech.isListening}');
//     setState(() {
//       lastError = '${error.errorMsg} - ${error.permanent}';
//     });
//   }
//
//   void statusListener(String status) {
//     _logEvent(
//         'Received listener status: $status, listening: ${speech.isListening}');
//     setState(() {
//       lastStatus = '$status';
//     });
//   }
//
//   void _switchLang(selectedVal) {
//     setState(() {
//       _currentLocaleId = selectedVal;
//     });
//     print(selectedVal);
//   }
//
//   void _logEvent(String eventDescription) {
//     if (_logEvents) {
//       var eventTime = DateTime.now().toIso8601String();
//       print('$eventTime $eventDescription');
//     }
//   }
//
//   void _switchLogging(bool? val) {
//     setState(() {
//       _logEvents = val ?? false;
//     });
//   }
//
//   void _switchOnDevice(bool? val) {
//     setState(() {
//       _onDevice = val ?? false;
//     });
//   }
// }
//
// /// Displays the most recently recognized words and the sound level.
// class RecognitionResultsWidget extends StatelessWidget {
//   const RecognitionResultsWidget({
//     Key? key,
//     required this.lastWords,
//     required this.level,
//   }) : super(key: key);
//
//   final String lastWords;
//   final double level;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Center(
//           child: Text(
//             'Recognized Words',
//             style: TextStyle(fontSize: 22.0),
//           ),
//         ),
//         Expanded(
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 color: Theme.of(context).selectedRowColor,
//                 child: Center(
//                   child: Text(
//                     lastWords,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               Positioned.fill(
//                 bottom: 10,
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     width: 40,
//                     height: 40,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                             blurRadius: .26,
//                             spreadRadius: level * 1.5,
//                             color: Colors.black.withOpacity(.05))
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(50)),
//                     ),
//                     child: IconButton(
//                       icon: Icon(Icons.mic),
//                       onPressed: () => null,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class HeaderWidget extends StatelessWidget {
//   const HeaderWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Speech recognition available',
//         style: TextStyle(fontSize: 22.0),
//       ),
//     );
//   }
// }
//
// /// Display the current error status from the speech
// /// recognizer
// class ErrorWidget extends StatelessWidget {
//   const ErrorWidget({
//     Key? key,
//     required this.lastError,
//   }) : super(key: key);
//
//   final String lastError;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Center(
//           child: Text(
//             'Error Status',
//             style: TextStyle(fontSize: 22.0),
//           ),
//         ),
//         Center(
//           child: Text(lastError),
//         ),
//       ],
//     );
//   }
// }
//
// /// Controls to start and stop speech recognition
// class SpeechControlWidget extends StatelessWidget {
//   const SpeechControlWidget(this.hasSpeech, this.isListening,
//       this.startListening, this.stopListening, this.cancelListening,
//       {Key? key})
//       : super(key: key);
//
//   final bool hasSpeech;
//   final bool isListening;
//   final void Function() startListening;
//   final void Function() stopListening;
//   final void Function() cancelListening;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <Widget>[
//         TextButton(
//           onPressed: !hasSpeech || isListening ? null : startListening,
//           child: Text('Start'),
//         ),
//         TextButton(
//           onPressed: isListening ? stopListening : null,
//           child: Text('Stop'),
//         ),
//         TextButton(
//           onPressed: isListening ? cancelListening : null,
//           child: Text('Cancel'),
//         )
//       ],
//     );
//   }
// }
//
// class SessionOptionsWidget extends StatelessWidget {
//   const SessionOptionsWidget(
//       this.currentLocaleId,
//       this.switchLang,
//       this.localeNames,
//       this.logEvents,
//       this.switchLogging,
//       this.pauseForController,
//       this.listenForController,
//       this.onDevice,
//       this.switchOnDevice,
//       {Key? key})
//       : super(key: key);
//
//   final String currentLocaleId;
//   final void Function(String?) switchLang;
//   final void Function(bool?) switchLogging;
//   final void Function(bool?) switchOnDevice;
//   final TextEditingController pauseForController;
//   final TextEditingController listenForController;
//   final List<LocaleName> localeNames;
//   final bool logEvents;
//   final bool onDevice;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Row(
//             children: [
//               Text('Language: '),
//               DropdownButton<String>(
//                 onChanged: (selectedVal) => switchLang(selectedVal),
//                 value: currentLocaleId,
//                 items: localeNames
//                     .map(
//                       (localeName) => DropdownMenuItem(
//                     value: localeName.localeId,
//                     child: Text(localeName.name),
//                   ),
//                 )
//                     .toList(),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Text('pauseFor: '),
//               Container(
//                   padding: EdgeInsets.only(left: 8),
//                   width: 80,
//                   child: TextFormField(
//                     controller: pauseForController,
//                   )),
//               Container(
//                   padding: EdgeInsets.only(left: 16),
//                   child: Text('listenFor: ')),
//               Container(
//                   padding: EdgeInsets.only(left: 8),
//                   width: 80,
//                   child: TextFormField(
//                     controller: listenForController,
//                   )),
//             ],
//           ),
//           Row(
//             children: [
//               Text('On device: '),
//               Checkbox(
//                 value: onDevice,
//                 onChanged: switchOnDevice,
//               ),
//               Text('Log events: '),
//               Checkbox(
//                 value: logEvents,
//                 onChanged: switchLogging,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class InitSpeechWidget extends StatelessWidget {
//   const InitSpeechWidget(this.hasSpeech, this.initSpeechState, {Key? key})
//       : super(key: key);
//
//   final bool hasSpeech;
//   final Future<void> Function() initSpeechState;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <Widget>[
//         TextButton(
//           onPressed: hasSpeech ? null : initSpeechState,
//           child: Text('Initialize'),
//         ),
//       ],
//     );
//   }
// }
//
// /// Display the current status of the listener
// class SpeechStatusWidget extends StatelessWidget {
//   const SpeechStatusWidget({
//     Key? key,
//     required this.speech,
//   }) : super(key: key);
//
//   final SpeechToText speech;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 20),
//       color: Theme.of(context).backgroundColor,
//       child: Center(
//         child: speech.isListening
//             ? Text(
//           "I'm listening...",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         )
//             : Text(
//           'Not listening',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
//

//#################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22
// text to speech

// import 'dart:async';
// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart' show kIsWeb;
//
// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// enum TtsState { playing, stopped, paused, continued }
//
// class _MyAppState extends State<MyApp> {
//   late FlutterTts flutterTts;
//   String? language;
//   String? engine;
//   double volume = 0.5;
//   double pitch = 1.0;
//   double rate = 0.5;
//   bool isCurrentLanguageInstalled = false;
//
//   String? _newVoiceText;
//   int? _inputLength;
//
//   TtsState ttsState = TtsState.stopped;
//
//   get isPlaying => ttsState == TtsState.playing;
//   get isStopped => ttsState == TtsState.stopped;
//   get isPaused => ttsState == TtsState.paused;
//   get isContinued => ttsState == TtsState.continued;
//
//   bool get isIOS => !kIsWeb && Platform.isIOS;
//   bool get isAndroid => !kIsWeb && Platform.isAndroid;
//   bool get isWindows => !kIsWeb && Platform.isWindows;
//   bool get isWeb => kIsWeb;
//
//   @override
//   initState() {
//     super.initState();
//     initTts();
//   }
//
//   initTts() {
//     flutterTts = FlutterTts();
//
//     _setAwaitOptions();
//
//     if (isAndroid) {
//       _getDefaultEngine();
//       _getDefaultVoice();
//     }
//
//     flutterTts.setStartHandler(() {
//       setState(() {
//         print("Playing");
//         ttsState = TtsState.playing;
//       });
//     });
//
//     if (isAndroid) {
//       flutterTts.setInitHandler(() {
//         setState(() {
//           print("TTS Initialized");
//         });
//       });
//     }
//
//     flutterTts.setCompletionHandler(() {
//       setState(() {
//         print("Complete");
//         ttsState = TtsState.stopped;
//       });
//     });
//
//     flutterTts.setCancelHandler(() {
//       setState(() {
//         print("Cancel");
//         ttsState = TtsState.stopped;
//       });
//     });
//
//     flutterTts.setPauseHandler(() {
//       setState(() {
//         print("Paused");
//         ttsState = TtsState.paused;
//       });
//     });
//
//     flutterTts.setContinueHandler(() {
//       setState(() {
//         print("Continued");
//         ttsState = TtsState.continued;
//       });
//     });
//
//     flutterTts.setErrorHandler((msg) {
//       setState(() {
//         print("error: $msg");
//         ttsState = TtsState.stopped;
//       });
//     });
//   }
//
//   Future<dynamic> _getLanguages() async => await flutterTts.getLanguages;
//
//   Future<dynamic> _getEngines() async => await flutterTts.getEngines;
//
//   Future _getDefaultEngine() async {
//     var engine = await flutterTts.getDefaultEngine;
//     if (engine != null) {
//       print(engine);
//     }
//   }
//
//   Future _getDefaultVoice() async {
//     var voice = await flutterTts.getDefaultVoice;
//     if (voice != null) {
//       print(voice);
//     }
//   }
//
//   Future _speak() async {
//     await flutterTts.setVolume(volume);
//     await flutterTts.setSpeechRate(rate);
//     await flutterTts.setPitch(pitch);
//
//     if (_newVoiceText != null) {
//       if (_newVoiceText!.isNotEmpty) {
//         await flutterTts.speak(_newVoiceText!);
//       }
//     }
//   }
//
//   Future _setAwaitOptions() async {
//     await flutterTts.awaitSpeakCompletion(true);
//   }
//
//   Future _stop() async {
//     var result = await flutterTts.stop();
//     if (result == 1) setState(() => ttsState = TtsState.stopped);
//   }
//
//   Future _pause() async {
//     var result = await flutterTts.pause();
//     if (result == 1) setState(() => ttsState = TtsState.paused);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     flutterTts.stop();
//   }
//
//   List<DropdownMenuItem<String>> getEnginesDropDownMenuItems(dynamic engines) {
//     var items = <DropdownMenuItem<String>>[];
//     for (dynamic type in engines) {
//       items.add(DropdownMenuItem(
//           value: type as String?, child: Text(type as String)));
//     }
//     return items;
//   }
//
//   void changedEnginesDropDownItem(String? selectedEngine) async {
//     await flutterTts.setEngine(selectedEngine!);
//     language = null;
//     setState(() {
//       engine = selectedEngine;
//     });
//   }
//
//   List<DropdownMenuItem<String>> getLanguageDropDownMenuItems(
//       dynamic languages) {
//     var items = <DropdownMenuItem<String>>[];
//     for (dynamic type in languages) {
//       items.add(DropdownMenuItem(
//           value: type as String?, child: Text(type as String)));
//     }
//     return items;
//   }
//
//   void changedLanguageDropDownItem(String? selectedType) {
//     setState(() {
//       language = selectedType;
//       flutterTts.setLanguage(language!);
//       if (isAndroid) {
//         flutterTts
//             .isLanguageInstalled(language!)
//             .then((value) => isCurrentLanguageInstalled = (value as bool));
//       }
//     });
//   }
//
//   void _onChange(String text) {
//     setState(() {
//       _newVoiceText = text;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter TTS'),
//         ),
//         body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               _inputSection(),
//               _btnSection(),
//               _engineSection(),
//               _futureBuilder(),
//               _buildSliders(),
//               if (isAndroid) _getMaxSpeechInputLengthSection(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _engineSection() {
//     if (isAndroid) {
//       return FutureBuilder<dynamic>(
//           future: _getEngines(),
//           builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//             if (snapshot.hasData) {
//               return _enginesDropDownSection(snapshot.data);
//             } else if (snapshot.hasError) {
//               return Text('Error loading engines...');
//             } else
//               return Text('Loading engines...');
//           });
//     } else
//       return Container(width: 0, height: 0);
//   }
//
//   Widget _futureBuilder() => FutureBuilder<dynamic>(
//       future: _getLanguages(),
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         if (snapshot.hasData) {
//           return _languageDropDownSection(snapshot.data);
//         } else if (snapshot.hasError) {
//           return Text('Error loading languages...');
//         } else
//           return Text('Loading Languages...');
//       });
//
//   Widget _inputSection() => Container(
//       alignment: Alignment.topCenter,
//       padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
//       child: TextField(
//         maxLines: 11,
//         minLines: 6,
//         onChanged: (String value) {
//           _onChange(value);
//         },
//       ));
//
//   Widget _btnSection() {
//     return Container(
//       padding: EdgeInsets.only(top: 50.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _buildButtonColumn(Colors.green, Colors.greenAccent, Icons.play_arrow,
//               'PLAY', _speak),
//           _buildButtonColumn(
//               Colors.red, Colors.redAccent, Icons.stop, 'STOP', _stop),
//           _buildButtonColumn(
//               Colors.blue, Colors.blueAccent, Icons.pause, 'PAUSE', _pause),
//         ],
//       ),
//     );
//   }
//
//   Widget _enginesDropDownSection(dynamic engines) => Container(
//     padding: EdgeInsets.only(top: 50.0),
//     child: DropdownButton(
//       value: engine,
//       items: getEnginesDropDownMenuItems(engines),
//       onChanged: changedEnginesDropDownItem,
//     ),
//   );
//
//   Widget _languageDropDownSection(dynamic languages) => Container(
//       padding: EdgeInsets.only(top: 10.0),
//       child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//         DropdownButton(
//           value: language,
//           items: getLanguageDropDownMenuItems(languages),
//           onChanged: changedLanguageDropDownItem,
//         ),
//         Visibility(
//           visible: isAndroid,
//           child: Text("Is installed: $isCurrentLanguageInstalled"),
//         ),
//       ]));
//
//   Column _buildButtonColumn(Color color, Color splashColor, IconData icon,
//       String label, Function func) {
//     return Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//               icon: Icon(icon),
//               color: color,
//               splashColor: splashColor,
//               onPressed: () => func()),
//           Container(
//               margin: const EdgeInsets.only(top: 8.0),
//               child: Text(label,
//                   style: TextStyle(
//                       fontSize: 12.0,
//                       fontWeight: FontWeight.w400,
//                       color: color)))
//         ]);
//   }
//
//   Widget _getMaxSpeechInputLengthSection() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         ElevatedButton(
//           child: Text('Get max speech input length'),
//           onPressed: () async {
//             _inputLength = await flutterTts.getMaxSpeechInputLength;
//             setState(() {});
//           },
//         ),
//         Text("$_inputLength characters"),
//       ],
//     );
//   }
//
//   Widget _buildSliders() {
//     return Column(
//       children: [_volume(), _pitch(), _rate()],
//     );
//   }
//
//   Widget _volume() {
//     return Slider(
//         value: volume,
//         onChanged: (newVolume) {
//           setState(() => volume = newVolume);
//         },
//         min: 0.0,
//         max: 1.0,
//         divisions: 10,
//         label: "Volume: $volume");
//   }
//
//   Widget _pitch() {
//     return Slider(
//       value: pitch,
//       onChanged: (newPitch) {
//         setState(() => pitch = newPitch);
//       },
//       min: 0.5,
//       max: 2.0,
//       divisions: 15,
//       label: "Pitch: $pitch",
//       activeColor: Colors.red,
//     );
//   }
//
//   Widget _rate() {
//     return Slider(
//       value: rate,
//       onChanged: (newRate) {
//         setState(() => rate = newRate);
//       },
//       min: 0.0,
//       max: 1.0,
//       divisions: 10,
//       label: "Rate: $rate",
//       activeColor: Colors.green,
//     );
//   }
// }
