import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:solar_system_app/models/planet_moreinfo.dart';

class PDetails extends StatefulWidget {
  final String name;
  final String shortdesc;
  final String imagepath;
  final double width;
  final double height;
  final int moons;
  final String? moon;
  final String? moon2;
  final String? moon3;

  // final String moons;
  // trajectory info
  const PDetails(
      {Key? key,
      required this.name,
      required this.shortdesc,
      required this.imagepath,
      required this.width,
      required this.height,
      required this.moons,
      this.moon, this.moon2, this.moon3})
      : super(key: key);

  @override
  State<PDetails> createState() => _PDetailsState();
}   

class _PDetailsState extends State<PDetails> 

   with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset(0, 0),
    end: const Offset(0.0, 0.01),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
       duration: Duration(milliseconds: 1200),
                  curve: Curves.easeIn,
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Planet",
              style: TextStyle(
                
                fontFamily: 'Google',
                  color: Colors.orange,
                  fontSize: 20,
                  decoration: TextDecoration.none),
            ),
          ),
          Center(
            child: Text(
              widget.name,
              style: const TextStyle(
                  
                fontFamily: 'Google',
                  decoration: TextDecoration.none,
                  fontSize: 35,
                  color: Colors.white70),
            ),
          ),  
          Container(
            height: widget.width * 0.34,
              child: Stack(children: [
                Container(
                  padding: EdgeInsets.only( left: widget.width*0.23,),
                  child: Transform.rotate(
                    angle: -1.57,
                    child: Image.asset('assets/images/sun.gif', fit: BoxFit.cover,width: widget.width* 0.33,)),
                ),
                Container(
                  height: widget.width* 0.3365,
                  padding: EdgeInsets.only(left: widget.width*0.06),
                  child: Image.asset("assets/images/shadow.jpeg", fit: BoxFit.cover,)
                ),
                SlideTransition(
                  position: _offsetAnimation,
                  child: _moonsinfo(widget.moons, widget.moon, widget.moon2, widget.moon3, widget.width, widget.height)
                ),
                Container(
                height: widget.height*3,
                padding: EdgeInsets.only(top: widget.width * 0.10),
                width: widget.width * 1.5,
                    child: Image.asset('assets/images/' + widget.imagepath, fit: BoxFit.cover,gaplessPlayback: true)),
                    
                Container(
                    margin: EdgeInsets.only(
                    top: widget.height * 0.24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.shortdesc.toUpperCase(),
                        textAlign: TextAlign.center,
                        style:const TextStyle(
                          
                fontFamily: 'Google',
                          wordSpacing: 1,
                            fontSize: 15,
                            color: Colors.white,
                            // backgroundColor: Color.fromRGBO(100, 100, 100, 0.8),
                            decoration: TextDecoration.none),
                            // softWrap: true,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder( 
                              opaque: false,
                              pageBuilder: (_, __, ___) => MoreInfo(width: widget.width, currentpage: widget.name ),
                            ),
                          );
                        },
                        child:const Text("More Info",
                        style: TextStyle(
                          
                fontFamily: 'Google',
                          color: Colors.white,
                          decorationColor: Colors.white,
                          decoration: TextDecoration.underline,
                          fontSize: 17,
                          letterSpacing: 3,
                          backgroundColor: Color.fromRGBO(100, 100, 100, 0.7)
                        ),),
      ),
                      
                    ]),
              ),
            ]),
          ),
        ],
      )),
    );
  }
}

_moonsinfo(int num, String? name, String? name2, String? name3, double width, double height){
  if(num == 1){
  String ogname = name!.split(".")[0];
    return Container(
              padding: EdgeInsets.only(left: width* 0.06, top:width* 0.11),
                  child: Column(
                    children: [
                      Text(ogname.toUpperCase(),
                      style:const TextStyle(
                        
                fontFamily: 'Google',
                        fontSize: 15,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.none,
                        color: Colors.white,

                      ),),
                      Image.asset('assets/images/' + name, width: width * 0.10,),
                    ],
                  ),
                );
  }
  if(num == 0){
    return Container();
  }
  if(num == 2){
  String ogname = name!.split(".")[0];
  String ogname1 = name2!.split(".")[0];
    return Stack(
      children: [
        Container(
        padding: EdgeInsets.only(left: width* 0.06, top: width *0.08),
          child: Column(
                      children: [
                        Text(ogname.toUpperCase(),
                        style:const TextStyle(
                          
                fontFamily: 'Google',
                          fontSize: 15,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.none,
                          color: Colors.white,
    
                        ),),
                        Image.asset('assets/images/' + name, width: width * 0.10,),
                      ],
                    ),
      ),
          Container(
          padding: EdgeInsets.only(left: width* 0.62, top: width * 0.03),
          child: Column(
                      children: [
                        Text(ogname1.toUpperCase(),
                        style:const TextStyle(
                          
                fontFamily: 'Google',
                          fontSize: 15,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.none,
                          color: Colors.white,
    
                        ),),
                        Image.asset('assets/images/' + name2, width: width * 0.10,),
                      ],
                    ),
          )
      ]
    );
  }
  if(num == 3){
  String ogname = name!.split(".")[0];
  String ogname1 = name2!.split(".")[0];
  String ogname2 = name3!.split(".")[0];
    return Stack(
      children: [
        Container(
        padding: EdgeInsets.only(left: width* 0.06, top: width *0.10),
          child: Column(
                      children: [
                        Text(ogname.toUpperCase(),
                        style:const TextStyle(
                          
                fontFamily: 'Google',
                          fontSize: 15,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.none,
                          color: Colors.white,
    
                        ),),
                        Image.asset('assets/images/' + name, width: width * 0.10,),
                      ],
                    ),
      ),
          Container(
          padding: EdgeInsets.only(left: width* 0.62, top: width * 0.03),
          child: Column(
                      children: [
                        Text(ogname1.toUpperCase(),
                        style:const TextStyle(
                          
                fontFamily: 'Google',
                          fontSize: 15,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.none,
                          color: Colors.white,
    
                        ),),
                        Image.asset('assets/images/' + name2, width: width * 0.10,),
                      ],
                    ),
          ),
        Container(
          padding: EdgeInsets.only(left: width* 0.20, top: width * 0.01),
          child: Column(
                      children: [
                        Text(ogname2.toUpperCase(),
                        style:const TextStyle(
                          fontSize: 15,
                          
                fontFamily: 'Google',
                          letterSpacing: 2,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.none,
                          color: Colors.white,
    
                        ),),
                        Image.asset('assets/images/' + name2, width: width * 0.10,),
                      ],
                    ),
          )
      ]
    );
  }

}

