import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fader/flutter_fader.dart';

class IntroPage extends StatefulWidget {
  var nextpage;
  IntroPage({ Key? key, required this.nextpage}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  FaderController faderController = new FaderController();

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Fader(
         controller: faderController,
        duration: const Duration(milliseconds: 50),
        child: Container(
          height: 1080,
          width: 1920,
          child: Image.asset("assets/images/download.jpg", fit: BoxFit.fill,),
        ),
      ),
    );
  }

  startTime() async{
    faderController.fadeOut();
    var duration = Duration(milliseconds: 1400);
    return Timer(duration, route);
  }

  route(){
    Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: true, // set to false
                            pageBuilder: (_, __, ___) => widget.nextpage,
                          ),
                        );
  }
}