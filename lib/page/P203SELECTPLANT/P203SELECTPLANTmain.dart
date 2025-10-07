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
                      for (int s = 0; s < 15; s++) ...[
                        if ((s == 0 &&
                                USERDATA.LOCATION.contains("BP12-GAS")) ||
                            (s == 1 && USERDATA.LOCATION.contains("BP12-PH")) ||
                            (s == 4 &&
                                USERDATA.LOCATION.contains("BP12-PAL")) ||
                            (s == 3 &&
                                USERDATA.LOCATION.contains("BP12-PAL12")) ||
                            (s == 3 &&
                                USERDATA.LOCATION.contains("BP12-PVD")) ||
                            (s == 2 &&
                                USERDATA.LOCATION.contains("BP12-KNG")) ||
                            (s == 12)) ...[
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
                                      P203SELECTPLANTvar.isHoveredList[s] =
                                          false;
                                    });

                                    if (s == 0) {
                                      BRANCHNUMBER.PLANT1 = '27';
                                      BRANCHNUMBER.PLANT2 = 'BP12GAS';
                                    } else if (s == 1) {
                                      BRANCHNUMBER.PLANT1 = '26';
                                      BRANCHNUMBER.PLANT2 = 'BP12PH';
                                    } else if (s == 2) {
                                      BRANCHNUMBER.PLANT1 = '23';
                                      BRANCHNUMBER.PLANT2 = 'BP12KNG';
                                    } else if (s == 3) {
                                      BRANCHNUMBER.PLANT1 = '22';
                                      BRANCHNUMBER.PLANT2 = 'BP12PVD';
                                    } else if (s == 4) {
                                      BRANCHNUMBER.PLANT1 = '25';
                                      BRANCHNUMBER.PLANT2 = 'BP12PAL';
                                    } else {
                                      BRANCHNUMBER.PLANT1 = '';
                                      BRANCHNUMBER.PLANT2 = '';
                                    }

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
                      ],
                    ] else if (USERDATA.BRANCH == 'GW') ...[
                      for (int s = 5; s < 15; s++) ...[
                        if ((s == 5 && USERDATA.LOCATION.contains("GW-GAS")) ||
                            (s == 13)) ...[
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
                                      P203SELECTPLANTvar.isHoveredList[s] =
                                          false;
                                    });
                                    if (s == 5) {
                                      BRANCHNUMBER.PLANT1 = '31';
                                      BRANCHNUMBER.PLANT2 = 'GWGAS';
                                    } else {
                                      BRANCHNUMBER.PLANT1 = '';
                                      BRANCHNUMBER.PLANT2 = '';
                                    }

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
                      ],
                    ] else if (USERDATA.BRANCH == 'ESIE1') ...[
                      for (int s = 6; s < 15; s++) ...[
                        if ((s == 7 && USERDATA.LOCATION.contains("HES-PH")) ||
                            (s == 6 && USERDATA.LOCATION.contains("HES-GAS")) ||
                            (s == 8 && USERDATA.LOCATION.contains("HES-ISN")) ||
                            (s == 14) ||
                            (s == 10 &&
                                USERDATA.LOCATION.contains("HES-HYD")) ||
                            (s == 11 &&
                                USERDATA.LOCATION.contains("HES-DEL")) ||
                            (s == 9 &&
                                USERDATA.LOCATION.contains("HES-PAL"))) ...[
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
                                      P203SELECTPLANTvar.isHoveredList[s] =
                                          false;
                                    });
                                    if (s == 6) {
                                      BRANCHNUMBER.PLANT1 = '51';
                                      BRANCHNUMBER.PLANT2 = 'HESGAS';
                                    } else if (s == 7) {
                                      BRANCHNUMBER.PLANT1 = '52';
                                      BRANCHNUMBER.PLANT2 = 'HESPH';
                                    } else if (s == 8) {
                                      BRANCHNUMBER.PLANT1 = '54';
                                      BRANCHNUMBER.PLANT2 = 'HESISN';
                                    } else if (s == 9) {
                                      BRANCHNUMBER.PLANT1 = '53';
                                      BRANCHNUMBER.PLANT2 = 'HESHYD';
                                    } else if (s == 10) {
                                      BRANCHNUMBER.PLANT1 = '55';
                                      BRANCHNUMBER.PLANT2 = 'HESPAL';
                                    } else if (s == 11) {
                                      BRANCHNUMBER.PLANT1 = '56';
                                      BRANCHNUMBER.PLANT2 = 'HESDELTA';
                                    } else {
                                      BRANCHNUMBER.PLANT1 = '';
                                      BRANCHNUMBER.PLANT2 = '';
                                    }
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
