// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';

import '../page1.dart';
import '../page100.dart';
import 'P102SELECTCHEMLISTvar.dart';

class P102SELECTCHEMLISTmain extends StatefulWidget {
  const P102SELECTCHEMLISTmain({super.key});

  @override
  State<P102SELECTCHEMLISTmain> createState() => _P102SELECTCHEMLISTmainState();
}

class _P102SELECTCHEMLISTmainState extends State<P102SELECTCHEMLISTmain> {
  @override
  Widget build(BuildContext context) {
    return P102SELECTCHEMLISTmainBody();
  }
}

class P102SELECTCHEMLISTmainBody extends StatefulWidget {
  const P102SELECTCHEMLISTmainBody({super.key});

  @override
  State<P102SELECTCHEMLISTmainBody> createState() =>
      _P102SELECTCHEMLISTmainBodyState();
}

class _P102SELECTCHEMLISTmainBodyState
    extends State<P102SELECTCHEMLISTmainBody> {
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
                    'SELECT PROGRESS',
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
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            P102SELECTCHEMLISTvar.isHoveredINCOMING = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P102SELECTCHEMLISTvar.isHoveredINCOMING = false;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              P102SELECTCHEMLISTvar.isHoveredINCOMING = false;
                            });
                            USERDATA.ACTION = 'INCOMING';
                            print(USERDATA.ACTION);

                            // MainBodyContext.read<ChangePage_Bloc>()
                            //     .ChangePage_nodrower('', Page42());
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            height: P102SELECTCHEMLISTvar.isHoveredINCOMING
                                ? 55
                                : 50,
                            width: P102SELECTCHEMLISTvar.isHoveredINCOMING
                                ? 420
                                : 430,
                            decoration: BoxDecoration(
                              color: P102SELECTCHEMLISTvar.isHoveredINCOMING
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
                                'INCOMING',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            P102SELECTCHEMLISTvar.isHoveredPLANNING = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P102SELECTCHEMLISTvar.isHoveredPLANNING = false;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              P102SELECTCHEMLISTvar.isHoveredPLANNING = false;
                            });
                            USERDATA.ACTION = 'PLANNING';
                            print(USERDATA.ACTION);

                            // MainBodyContext.read<ChangePage_Bloc>()
                            //     .ChangePage_nodrower('', Page27());
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            height: P102SELECTCHEMLISTvar.isHoveredPLANNING
                                ? 55
                                : 50,
                            width: P102SELECTCHEMLISTvar.isHoveredPLANNING
                                ? 420
                                : 430,
                            decoration: BoxDecoration(
                              color: P102SELECTCHEMLISTvar.isHoveredPLANNING
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
                                'PLANNING',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            P102SELECTCHEMLISTvar.isHoveredSTATUS = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P102SELECTCHEMLISTvar.isHoveredSTATUS = false;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              P102SELECTCHEMLISTvar.isHoveredSTATUS = false;
                            });
                            USERDATA.ACTION = 'STATUS';
                            print(USERDATA.ACTION);

                            // MainBodyContext.read<ChangePage_Bloc>()
                            //     .ChangePage_nodrower('', Page18());
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            height:
                                P102SELECTCHEMLISTvar.isHoveredSTATUS ? 55 : 50,
                            width: P102SELECTCHEMLISTvar.isHoveredSTATUS
                                ? 420
                                : 430,
                            decoration: BoxDecoration(
                              color: P102SELECTCHEMLISTvar.isHoveredSTATUS
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
                                'PRODUCTION STATUS',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            P102SELECTCHEMLISTvar.isHoveredSCADADATA = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P102SELECTCHEMLISTvar.isHoveredSCADADATA = false;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              P102SELECTCHEMLISTvar.isHoveredSCADADATA = false;
                            });
                            USERDATA.ACTION = 'PRODUCTION CONFIRMATION';
                            print(USERDATA.ACTION);

                            // MainBodyContext.read<ChangePage_Bloc>()
                            //     .ChangePage_nodrower('', Page28());
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            height: P102SELECTCHEMLISTvar.isHoveredSCADADATA
                                ? 55
                                : 50,
                            width: P102SELECTCHEMLISTvar.isHoveredSCADADATA
                                ? 420
                                : 430,
                            decoration: BoxDecoration(
                              color: P102SELECTCHEMLISTvar.isHoveredSCADADATA
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
                                'PRODUCTION CONFIRMATION',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            P102SELECTCHEMLISTvar.isHoveredSCADADATA2 = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P102SELECTCHEMLISTvar.isHoveredSCADADATA2 = false;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              P102SELECTCHEMLISTvar.isHoveredSCADADATA2 = false;
                            });
                            USERDATA.ACTION = 'FINISHED GOOD TRANFER';
                            print(USERDATA.ACTION);

                            // MainBodyContext.read<ChangePage_Bloc>()
                            //     .ChangePage_nodrower('', Page29());
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            height: P102SELECTCHEMLISTvar.isHoveredSCADADATA2
                                ? 55
                                : 50,
                            width: P102SELECTCHEMLISTvar.isHoveredSCADADATA2
                                ? 420
                                : 430,
                            decoration: BoxDecoration(
                              color: P102SELECTCHEMLISTvar.isHoveredSCADADATA2
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
                                'FINISHED GOOD TRANFER',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
