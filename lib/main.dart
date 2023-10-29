import 'package:flutter/material.dart';
import 'package:omegle_match/splash%20screen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: ZoomedVideoPlayer(
        videoAssetPath: 'assets/videoforbg.mp4',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
