// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';

import '../page1.dart';

import '../page200.dart';
import '../page201.dart';
import '../page202.dart';
import '../page203.dart';
import '../page211.dart';
import '../page301.dart';
import 'P202SELECTCHEMLISTvar.dart';

class P202SELECTCHEMLISTmain extends StatefulWidget {
  const P202SELECTCHEMLISTmain({super.key});

  @override
  State<P202SELECTCHEMLISTmain> createState() => _P202SELECTCHEMLISTmainState();
}

class _P202SELECTCHEMLISTmainState extends State<P202SELECTCHEMLISTmain> {
  @override
  Widget build(BuildContext context) {
    return P202SELECTCHEMLISTmainBody();
  }
}

class P202SELECTCHEMLISTmainBody extends StatefulWidget {
  const P202SELECTCHEMLISTmainBody({super.key});

  @override
  State<P202SELECTCHEMLISTmainBody> createState() =>
      _P202SELECTCHEMLISTmainBodyState();
}

class _P202SELECTCHEMLISTmainBodyState
    extends State<P202SELECTCHEMLISTmainBody> {
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
                          .ChangePage_nodrower('', Page200());
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
                    'SELECT OPERATION PROGRESS',
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int s = 0; s < 5; s++) ...[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              P202SELECTCHEMLISTvar.isHoveredList[s] = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              P202SELECTCHEMLISTvar.isHoveredList[s] = false;
                            });
                          },
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                P202SELECTCHEMLISTvar.isHoveredList[s] = false;
                              });
                              if (s == 0) {
                                MainBodyContext.read<ChangePage_Bloc>()
                                    .ChangePage_nodrower('', Page301());
                              }

                              if (s == 1) {
                                MainBodyContext.read<ChangePage_Bloc>()
                                    .ChangePage_nodrower('', Page211());
                              }
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              height: P202SELECTCHEMLISTvar.isHoveredList[s]
                                  ? 85
                                  : 80,
                              width: P202SELECTCHEMLISTvar.isHoveredList[s]
                                  ? 420
                                  : 430,
                              decoration: BoxDecoration(
                                color: P202SELECTCHEMLISTvar.isHoveredList[s]
                                    ? Colors.greenAccent
                                    : Colors.green,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  P202SELECTCHEMLISTvar.NameList[s],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
