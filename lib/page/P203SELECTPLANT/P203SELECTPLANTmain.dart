// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';

import '../page1.dart';
import '../page100.dart';
import '../page201.dart';
import '../page204.dart';
import 'P203SELECTPLANTvar.dart';

class P203SELECTPLANTmain extends StatefulWidget {
  const P203SELECTPLANTmain({super.key});

  @override
  State<P203SELECTPLANTmain> createState() => _P203SELECTPLANTmainState();
}

class _P203SELECTPLANTmainState extends State<P203SELECTPLANTmain> {
  @override
  Widget build(BuildContext context) {
    return P203SELECTPLANTmainBody();
  }
}

class P203SELECTPLANTmainBody extends StatefulWidget {
  const P203SELECTPLANTmainBody({super.key});

  @override
  State<P203SELECTPLANTmainBody> createState() =>
      _P203SELECTPLANTmainBodyState();
}

class _P203SELECTPLANTmainBodyState extends State<P203SELECTPLANTmainBody> {
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
                          .ChangePage_nodrower('', Page201());
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
                    '${USERDATA.BRANCH} PLANT',
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
                      // MainBodyContext.read<ChangePage_Bloc>()
                      //     .ChangePage_nodrower('', Page201());
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
                    if (USERDATA.BRANCH == 'BP12') ...[
                      for (int s = 0; s < 5; s++) ...[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                P203SELECTPLANTvar.isHoveredList[s] = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                P203SELECTPLANTvar.isHoveredList[s] = false;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    P203SELECTPLANTvar.isHoveredList[s] = false;
                                  });

                                  MainBodyContext.read<ChangePage_Bloc>()
                                      .ChangePage_nodrower('', Page204());
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  height: P203SELECTPLANTvar.isHoveredList[s]
                                      ? 170
                                      : 150,
                                  width: P203SELECTPLANTvar.isHoveredList[s]
                                      ? 170
                                      : 150,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors:
                                          P203SELECTPLANTvar.isHoveredList[s]
                                              ? [
                                                  Colors.greenAccent,
                                                  Colors.lightGreen
                                                ]
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
                                      P203SELECTPLANTvar.NameList[s],
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
                    ] else if (USERDATA.BRANCH == 'GW') ...[
                      for (int s = 5; s < 6; s++) ...[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                P203SELECTPLANTvar.isHoveredList[s] = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                P203SELECTPLANTvar.isHoveredList[s] = false;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    P203SELECTPLANTvar.isHoveredList[s] = false;
                                  });

                                  MainBodyContext.read<ChangePage_Bloc>()
                                      .ChangePage_nodrower('', Page204());
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  height: P203SELECTPLANTvar.isHoveredList[s]
                                      ? 170
                                      : 150,
                                  width: P203SELECTPLANTvar.isHoveredList[s]
                                      ? 170
                                      : 150,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors:
                                          P203SELECTPLANTvar.isHoveredList[s]
                                              ? [
                                                  Colors.redAccent,
                                                  Colors.orangeAccent
                                                ]
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
                                      P203SELECTPLANTvar.NameList[s],
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
                    ] else if (USERDATA.BRANCH == 'ESIE1') ...[
                      for (int s = 6; s < 11; s++) ...[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                P203SELECTPLANTvar.isHoveredList[s] = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                P203SELECTPLANTvar.isHoveredList[s] = false;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    P203SELECTPLANTvar.isHoveredList[s] = false;
                                  });
                                  MainBodyContext.read<ChangePage_Bloc>()
                                      .ChangePage_nodrower('', Page204());
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  height: P203SELECTPLANTvar.isHoveredList[s]
                                      ? 170
                                      : 150,
                                  width: P203SELECTPLANTvar.isHoveredList[s]
                                      ? 170
                                      : 150,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors:
                                          P203SELECTPLANTvar.isHoveredList[s]
                                              ? [
                                                  Colors.blueAccent,
                                                  Colors.lightBlue
                                                ]
                                              : [
                                                  Colors.blue,
                                                  const Color.fromARGB(
                                                      255, 0, 85, 150)
                                                ],
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
                                      P203SELECTPLANTvar.NameList[s],
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
                    ]
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
