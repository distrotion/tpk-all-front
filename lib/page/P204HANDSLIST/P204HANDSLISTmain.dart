// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';

import '../page1.dart';

import '../page200.dart';
import '../page203.dart';
import '../page211.dart';
import '../page301.dart';
import '../page302.dart';
import 'P204HANDSLISTvar.dart';

class P204HANDSLISTmain extends StatefulWidget {
  const P204HANDSLISTmain({super.key});

  @override
  State<P204HANDSLISTmain> createState() => _P204HANDSLISTmainState();
}

class _P204HANDSLISTmainState extends State<P204HANDSLISTmain> {
  @override
  Widget build(BuildContext context) {
    return P204HANDSLISTmainBody();
  }
}

class P204HANDSLISTmainBody extends StatefulWidget {
  const P204HANDSLISTmainBody({super.key});

  @override
  State<P204HANDSLISTmainBody> createState() => _P204HANDSLISTmainBodyState();
}

class _P204HANDSLISTmainBodyState extends State<P204HANDSLISTmainBody> {
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
                          .ChangePage_nodrower('', Page203());
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
                    for (int s = 0; s < 3; s++) ...[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              P204HANDSLISTvar.isHoveredList[s] = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              P204HANDSLISTvar.isHoveredList[s] = false;
                            });
                          },
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                P204HANDSLISTvar.isHoveredList[s] = false;
                              });
                              USERDATA.ACTION = 'INCOMING';
                              print(USERDATA.ACTION);

                              // MainBodyContext.read<ChangePage_Bloc>()
                              //     .ChangePage_nodrower('', Page42());
                              if (s == 0) {
                                MainBodyContext.read<ChangePage_Bloc>()
                                    .ChangePage_nodrower('', Page302());
                              }
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              height:
                                  P204HANDSLISTvar.isHoveredList[s] ? 85 : 80,
                              width:
                                  P204HANDSLISTvar.isHoveredList[s] ? 420 : 430,
                              decoration: BoxDecoration(
                                color: P204HANDSLISTvar.isHoveredList[s]
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
                                  P204HANDSLISTvar.NameList[s],
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
