// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';

import '../page1.dart';
import '../page100.dart';
import 'P101SELECTBRANCHvar.dart';

class P101SELECTBRANCHmain extends StatefulWidget {
  const P101SELECTBRANCHmain({super.key});

  @override
  State<P101SELECTBRANCHmain> createState() => _P101SELECTBRANCHmainState();
}

class _P101SELECTBRANCHmainState extends State<P101SELECTBRANCHmain> {
  @override
  Widget build(BuildContext context) {
    return P101SELECTBRANCHmainBody();
  }
}

class P101SELECTBRANCHmainBody extends StatefulWidget {
  const P101SELECTBRANCHmainBody({super.key});

  @override
  State<P101SELECTBRANCHmainBody> createState() =>
      _P101SELECTBRANCHmainBodyState();
}

class _P101SELECTBRANCHmainBodyState extends State<P101SELECTBRANCHmainBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      MainBodyContext.read<ChangePage_Bloc>()
                          .ChangePage_nodrower('', Page100());
                    },
                    child: SizedBox(
                      width: 200,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 40,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: const [Colors.blueAccent, Colors.lightBlueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Text(
                    'SELECT BRANCH',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      MainBodyContext.read<ChangePage_Bloc>()
                          .ChangePage_nodrower('', Page1());
                    },
                    child: SizedBox(
                      width: 200,
                      // child: Icon(
                      //   Icons.arrow_back_ios,
                      //   size: 40,
                      //   color: Colors.blue,
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            P101SELECTBRANCHvar.isHoveredBP12 = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P101SELECTBRANCHvar.isHoveredBP12 = false;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                P101SELECTBRANCHvar.isHoveredBP12 = false;
                              });
                              USERDATA.BRANCH = 'BP12';
                              USERDATA.BRANCHNUMBER = BRANCHNUMBER.BP;
                              print(USERDATA.BRANCH);
                              print(USERDATA.BRANCHNUMBER);

                              // MainBodyContext.read<ChangePage_Bloc>()
                              //     .ChangePage_nodrower('', Page10());
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              height:
                                  P101SELECTBRANCHvar.isHoveredBP12 ? 170 : 150,
                              width:
                                  P101SELECTBRANCHvar.isHoveredBP12 ? 170 : 150,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: P101SELECTBRANCHvar.isHoveredBP12
                                      ? [Colors.greenAccent, Colors.lightGreen]
                                      : [Colors.green, Colors.teal],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                border: Border.all(
                                  color: Colors.black87,
                                  width: 2.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(2, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'BP12',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    shadows: const [
                                      Shadow(
                                        blurRadius: 5.0,
                                        color: Colors.black45,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            P101SELECTBRANCHvar.isHoveredGW = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P101SELECTBRANCHvar.isHoveredGW = false;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                P101SELECTBRANCHvar.isHoveredGW = false;
                              });
                              USERDATA.BRANCH = 'GW';
                              USERDATA.BRANCHNUMBER = BRANCHNUMBER.GW;
                              print(USERDATA.BRANCH);
                              print(USERDATA.BRANCHNUMBER);

                              // MainBodyContext.read<ChangePage_Bloc>()
                              //     .ChangePage_nodrower('', Page10());
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              height:
                                  P101SELECTBRANCHvar.isHoveredGW ? 170 : 150,
                              width:
                                  P101SELECTBRANCHvar.isHoveredGW ? 170 : 150,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: P101SELECTBRANCHvar.isHoveredGW
                                      ? [Colors.redAccent, Colors.orangeAccent]
                                      : [Colors.red, Colors.orange],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                border: Border.all(
                                  color: Colors.black87,
                                  width: 2.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(2, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'GW',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    shadows: const [
                                      Shadow(
                                        blurRadius: 5.0,
                                        color: Colors.black45,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            P101SELECTBRANCHvar.isHoveredESIE1 = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P101SELECTBRANCHvar.isHoveredESIE1 = false;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                P101SELECTBRANCHvar.isHoveredESIE1 = false;
                              });
                              USERDATA.BRANCH = 'ESIE1';
                              USERDATA.BRANCHNUMBER = BRANCHNUMBER.ESIE1;
                              print(USERDATA.BRANCH);
                              print(USERDATA.BRANCHNUMBER);

                              // MainBodyContext.read<ChangePage_Bloc>()
                              //     .ChangePage_nodrower('', Page10());
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              height: P101SELECTBRANCHvar.isHoveredESIE1
                                  ? 170
                                  : 150,
                              width: P101SELECTBRANCHvar.isHoveredESIE1
                                  ? 170
                                  : 150,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: P101SELECTBRANCHvar.isHoveredESIE1
                                      ? [
                                          Colors.lightBlueAccent,
                                          Colors.blueAccent
                                        ]
                                      : [Colors.blue, Colors.indigo],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                border: Border.all(
                                  color: Colors.black87,
                                  width: 2.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(2, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'ESIE1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    shadows: const [
                                      Shadow(
                                        blurRadius: 5.0,
                                        color: Colors.black45,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
