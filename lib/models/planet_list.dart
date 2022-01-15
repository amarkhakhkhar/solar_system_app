import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';


class PList extends StatefulWidget {
  final String name;
  final String distance;
  final String imagepath;
  final num width;
  final num height;
  final bool isSelected;
  const PList({ Key? key ,required this.name, required this.distance,required this.imagepath, required this.width, required this.height, required this.isSelected}) : super(key: key);

  @override
  State<PList> createState() => _PListState();
}

class _PListState extends State<PList> {

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: Duration(milliseconds: 1200),
                  curve: Curves.easeIn,
      child: Container(
                        margin:const EdgeInsets.only(bottom: 8),
                        width: widget.width* 0.2,
                        child: 
                        Row(
                          children: [
                            Stack(
                              children: <Widget>[
                                Container(
                                  child: Image.asset('assets/images/' + widget.imagepath), height: widget.height * 0.8 / 12, width: 50,),
                                widget.isSelected ? 
                                const Icon(
                                  Icons.circle_rounded,
                                  size: 20,
                                  color: Colors.white,
                                ) : 
                                const Icon(
                                  Icons.circle_outlined,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ],
                                ),
                          const SizedBox(width: 6,),
                          Column(
                            children:[
                              Text(
                                widget.name,
                                textAlign: TextAlign.start,
                              style:TextStyle(
                                decoration: TextDecoration.none,
                                
                fontFamily: 'Google',
                                color: Colors.white,
                                fontSize:widget.isSelected? 18 : 13
                              ),
                              ),
                              Text(
                                widget.distance,
                              textAlign: TextAlign.start,
                              style:TextStyle(
                                decoration: TextDecoration.none,
                                
                fontFamily: 'Google',
                                color: widget.isSelected ? Colors.white60 : Colors.white24,
                                fontSize: widget.isSelected ? 12 : 8,
                              ),)
                            ],
                          )
                          ],
                        ),
                      ),
    );
  }
}