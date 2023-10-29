import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:pk_skeleton_null_safe/pk_skeleton_null_safe.dart';
//import 'package:shimmer/shimmer.dart';

class ZoomedVideoPlayer extends StatefulWidget {
  final String videoAssetPath;

  ZoomedVideoPlayer({required this.videoAssetPath});

  @override
  _ZoomedVideoPlayerState createState() => _ZoomedVideoPlayerState();
}

class _ZoomedVideoPlayerState extends State<ZoomedVideoPlayer> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/videoforbg.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown before setting the state
        setState(() {});
      });
    _videoController.setLooping(true);
    _videoController.play();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Center(
            child: _videoController.value.isInitialized
                ? Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width *
                  3.0, // Increase the width
              child: AspectRatio(
                aspectRatio: 9 / 20,
                child: Transform.scale(
                  scale: 2.0, // Adjust the scale factor as needed
                  child: VideoPlayer(_videoController),
                ),
              ),
            )
                : CircularProgressIndicator(), // Display a loading indicator while initializing
          ),
          const Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Omegle Match',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontFamily: "merriweather",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'STRANGER VIDEO CHAT',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'Horizon',
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        RotateAnimatedText(
                          '  Connect \nwith people',
                          textStyle: const TextStyle(
                            fontSize: 55.0,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins_Bold',
                          ),
                          duration: const Duration(milliseconds: 800),
                        ),
                        RotateAnimatedText(
                          'Make new \n   friends.',
                          textStyle: const TextStyle(
                            fontSize: 55.0,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins_Bold',
                          ),
                          duration: const Duration(milliseconds: 800),
                        ),
                        RotateAnimatedText(
                          'Have fun!',
                          textStyle: const TextStyle(
                            fontSize: 55.0,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins_Bold',
                          ),
                          duration: const Duration(milliseconds: 800),
                        ),
                      ],
                      repeatForever: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    onTap: () =>
                    {
                      showModalBottomSheet<void>(
                        backgroundColor: Color(0xFF222222),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0))),
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 200,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 20,),
                                const Text('Login to continue',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Poppins'),),
                                const SizedBox(height: 15),
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/CTA3.png', scale: 0.9,),
                                ),
                                const SizedBox(height: 20,),
                                const Text(
                                  'By continuing, you are agreeing to our',
                                  style: TextStyle(color: Colors.grey,
                                      fontFamily: 'Poppins',
                                      fontSize: 15),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet<dynamic>(
                                          backgroundColor: Color(0xFF222222),
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                                height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height,
                                                child: Column(
                                                  children: <Widget>[
                                                    SizedBox(height: 50,),
                                                    Text('Terms and Conditions',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.white,
                                                        fontFamily: 'Poppins',),),
                                                    Text(
                                                      'Cross Connection built the Omegle Match - Live Video Chat app as a Free app. This SERVICE is provided by Cross Connection at no cost and is intended for use as is. This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.\n',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                      //'If you choose to use my Service, then you agree to the collection and use of information in Cross Connection built the Omegle Match - Live Video Chat app as a Free app. This SERVICE is provided by Cross Connection at no cost and is intended for use as is. This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.\n'
                                                    ),
                                                  ],
                                                ));
                                          },);
                                      },
                                      child: Text('Terms & Conditions',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                          decoration: TextDecoration
                                              .underline,
                                          decorationColor: Colors.green,
                                        ),),
                                    ),
                                    Text(' and ', style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Poppins'),),
                                    Text('Privacy Policy',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        decoration: TextDecoration
                                            .underline,
                                        decorationColor: Colors.green,
                                      ),),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    },
                    child: Shimmer(
                      child: Image.asset('assets/CTA2.png', scale: 0.85, width: size.width*1,),)
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }
}




