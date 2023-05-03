import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My Dashatar App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int counter = 0;
  List sound = ["Kick.wav", "Ride.wav", "Snare.wav", "Tom.wav"];
  int appBar = 0;
  int scaffold = 0;
  int soundPlaying = 0;
  String kick = "Kick.wav";
  final player = AudioPlayer();
  void main() {
    setState(() {
      Random random = new Random();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Color> a = [Colors.black87, Colors.tealAccent, Colors.redAccent];

    return Scaffold(
      backgroundColor: a[scaffold],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: a[appBar],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("ColoRiot"),
      ),
      body: MaterialButton(
          child: Center(child: Image.asset("images/mydashatar.png")),
          onPressed: () {
            setState(() {
              Random random = new Random();
              appBar = random.nextInt(3);
              scaffold = random.nextInt(3);
              player.play(AssetSource(sound[soundPlaying]));
              soundPlaying = random.nextInt(4);
            });
          }),
    );
  }
}
