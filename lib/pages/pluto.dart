import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solar_system_app/models/planet_details.dart';
import 'package:solar_system_app/models/planet_list.dart';
import 'package:solar_system_app/pages/saturn.dart';
import 'package:solar_system_app/pages/spacetravel.dart';
import 'package:solar_system_app/pages/venus.dart';
import 'package:solar_system_app/pages/earth.dart';
import 'package:solar_system_app/pages/jupiter.dart';
import 'package:solar_system_app/pages/mars.dart';
import 'package:solar_system_app/pages/mercury.dart';
import 'package:solar_system_app/pages/neptune.dart';
import 'package:solar_system_app/pages/uranus.dart';

class PlutoPage extends StatelessWidget {
  const PlutoPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: height * 0.15,
            color: Colors.black,
            child: const Text(
              "Solar System App",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  
                fontFamily: 'Google',
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            children: [
              Container(
                padding:const EdgeInsets.only(left: 8),
                  height: height * 0.85,
                  width: width * 0.2,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap:() => Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: true, // set to false
                            pageBuilder: (_, __, ___) => LoadingPage(nextpage: MercuryPage()),
                          ),
                        ),
                        child: PList(name: "Mercury", distance: "0.39au", imagepath: "mercury.png", width: width, height: height,isSelected : false)),
                      GestureDetector(
                        onTap: () =>  Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: true, // set to false
                            pageBuilder: (_, __, ___) => LoadingPage(nextpage: VenusPage()),
                          ),
                        ),
                        child: PList(name: "Venus", distance: "0.72au", imagepath: "venus.png", width: width, height: height,isSelected : false)),
                      GestureDetector(
                        onTap: () =>  Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: true, // set to false
                            pageBuilder: (_, __, ___) => LoadingPage(nextpage: EarthPage()),
                          ),
                        ),
                        child: PList(name: "Earth", distance: "1au", imagepath: "earth.png", width: width, height: height,isSelected : false)),
                      GestureDetector(
                        onTap: () =>  Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: true, // set to false
                            pageBuilder: (_, __, ___) => LoadingPage(nextpage: MarsPage()),
                          ),
                        ),
                        child: PList(name: "Mars", distance: "1.52au", imagepath: "mars.png", width: width, height: height,isSelected : false)),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: true, // set to false
                            pageBuilder: (_, __, ___) => LoadingPage(nextpage: JupiterPage()),
                          ),
                        ),
                        child: PList(name: "Jupiter", distance: "5.2au", imagepath: "jupiter.png", width: width, height: height,isSelected : false)),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: true, // set to false
                            pageBuilder: (_, __, ___) => LoadingPage(nextpage: SaturnPage()),
                          ),
                        ),
                        child: PList(name: "Saturn", distance: "9.54au", imagepath: "saturn.png", width: width, height: height,isSelected : false)),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: true, // set to false
                            pageBuilder: (_, __, ___) => LoadingPage(nextpage: UranusPage()),
                          ),
                        ),
                        child: PList(name: "Uranus", distance: "19.2au", imagepath: "uranus.png", width: width, height: height,isSelected : false)),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: true, // set to false
                            pageBuilder: (_, __, ___) => LoadingPage(nextpage: NeptunePage()),
                          ),
                        ),
                        child: PList(name: "Neptune", distance: "30.06au", imagepath: "neptune.png", width: width, height: height,isSelected : false)),
                     
                        PList(name: "Pluto", distance: "39.5au", imagepath: "pluto.png", width: width, height: height,isSelected : true),
                    ],
                  )),
              Container(
                height: height * 0.8,
                width: width * 0.8,
                color: Colors.black,
                child: Stack(
                  children: [
                    PDetails(name: "Pluto", shortdesc: '''Pluto (minor-planet designation: 134340 Pluto) is a dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune. It was the first and the largest Kuiper belt object to be discovered. NO LONGER REGARDED AS PLANET''', imagepath: "Plutowhole.gif", width: width, height: height, moons: 0,)
                  ],
                )
              )
            ],
          )
        ],
      );  
  }
}