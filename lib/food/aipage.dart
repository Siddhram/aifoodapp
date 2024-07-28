import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:http/http.dart' as http;

/*
Future<void> onSpeechResult(SpeechRecognitionResult result) async{

    // setState(() {
    //   wordspoken = "${result.recognizedWords}";
    //   ttsInput = wordspoken;
    //   confidence = result.confidence;
    // });
    
    final url = Uri.parse('https://jsgemiintegration.onrender.com/gemini');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'prompt': wordspoken});

    try {
      final response = await http.post(url, headers: headers, body: body);

      final data = jsonDecode(response.body);
             if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        setState(() {
          wordspoken = "${result.recognizedWords}";
          ttsInput = data['response'];
          confidence = result.confidence;
        });

      } 
      
    } catch (e) {
      print("error");
    }
    if (!_speechToText.isListening) {
      // ttsInput = ttsInput ;

      startListening(); // Restart listening if it stops automatically
      setState(() {
        // ttsInput = wordspoken;
      });
    }
  }

*/
class AIpage extends StatefulWidget {
  const AIpage({Key? key}) : super(key: key);

  @override
  State<AIpage> createState() => _AIpageState();
}

class _AIpageState extends State<AIpage> {
  FlutterTts flutterTts = FlutterTts();
  Map? currentVoice;
  String ttsInput = "";

  final SpeechToText _speechToText = SpeechToText();
  bool seppChEnable = false;
  String wordspoken = "";
  double confidence = 0;
  bool isListening = false; // Track listening state
  String geminitalk = "";
  @override
  void initState() {
    super.initState();
    initTts();
    initspeech();
  }

  void initTts() async {
    try {
      var voices = await flutterTts.getVoices;
      List<Map> _voices = List<Map>.from(voices);
      _voices =
          _voices.where((_voice) => _voice["name"].contains("en")).toList();
      if (_voices.isNotEmpty) {
        setVoice(_voices.first);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void setVoice(Map voice) {
    flutterTts.setVoice({
      "name": voice["name"],
      "locale": voice["locale"],
    });
    setState(() {
      currentVoice = voice;
    });
  }

  void speak() {
    setState(() {
      String a = geminitalk;
      flutterTts.speak(a);
    });
  }

  void initspeech() async {
    try {
      seppChEnable = await _speechToText.initialize();
      setState(() {});
    } catch (e) {
      print("An error occurred during initialization: $e");
    }
  }

  void startListening() async {
    if (wordspoken.length > 0) {
      setState(() {
        geminitalk = "";
        // wordspoken = "";
      });
    }

    await _speechToText.listen(
      onResult: onSpeechResult,
      // listenFor: Duration.zero, // Listen indefinitely
      // pauseFor: Duration(seconds: 3), // Adjust as needed
    );
    setState(() {
      confidence = 0;
      isListening = true;
    });
  }

  Future<void> gemitext(String result) async {
    final url = Uri.parse('https://jsgemiintegration.onrender.com/gemini');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'prompt': result});

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          geminitalk = data['response'].toString().replaceAll("*", "");
        });
        speak(); // Speak the response from the API
      } else {
        print("Failed to get response from API");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      wordspoken = "${result.recognizedWords}";
      // ttsInput = "wordspoken";
      confidence = result.confidence;
    });
    if (!_speechToText.isListening) {
      // ttsInput = ttsInput ;

      startListening(); // Restart listening if it stops automatically
      setState(() {
        // ttsInput = wordspoken;
      });
    }
  }

  void stopListening() async {
    await _speechToText.stop();
    setState(() {
      isListening = false;
    });
    await gemitext(wordspoken);
    speak();
    setState(() {
      geminitalk = "";
    }); // Speak the recognized text after stopping listening
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Speech to Text'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Text(
                  isListening
                      ? "Listening..."
                      : seppChEnable
                          ? "Tap the microphone to listen..."
                          : "Speech is not available",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'MyCustomFont',
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: Text(
                  wordspoken,
                  style: TextStyle(
                      // fontFamily: 'Gemini',
                      ),
                ),
              ),
            )),
            SizedBox(
              height: 10,
            ),
            if (!isListening && confidence > 0)
              Text(
                "Confidence: ${(confidence * 100).toStringAsFixed(1)}",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (currentVoice != null)
                  Text(
                    "Current Voice: AI",
                    style: TextStyle(fontSize: 18),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Color.fromARGB(255, 63, 163, 246),
                  onPressed: () {
                    if (isListening) {
                      stopListening();
                    } else {
                      startListening();
                    }
                  },
                  tooltip: 'Listen',
                  child: Icon(isListening ? Icons.mic : Icons.mic_off),
                ),
                
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
