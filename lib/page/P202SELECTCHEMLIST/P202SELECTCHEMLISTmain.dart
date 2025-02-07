// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';

import '../page1.dart';

import '../page200.dart';
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
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            P202SELECTCHEMLISTvar.QM1003 = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P202SELECTCHEMLISTvar.QM1003 = false;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              P202SELECTCHEMLISTvar.QM1003 = false;
                            });
                            USERDATA.ACTION = 'INCOMING';
                            print(USERDATA.ACTION);

                            // MainBodyContext.read<ChangePage_Bloc>()
                            //     .ChangePage_nodrower('', Page42());
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            height: P202SELECTCHEMLISTvar.QM1003 ? 75 : 70,
                            width: P202SELECTCHEMLISTvar.QM1003 ? 420 : 430,
                            decoration: BoxDecoration(
                              color: P202SELECTCHEMLISTvar.QM1003
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
                                'QM-1003:Inbound interface result recoding for incoming inspection lot with inspection point',
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
                            P202SELECTCHEMLISTvar.isHoveredPLANNING = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P202SELECTCHEMLISTvar.isHoveredPLANNING = false;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              P202SELECTCHEMLISTvar.isHoveredPLANNING = false;
                            });
                            USERDATA.ACTION = 'PLANNING';
                            print(USERDATA.ACTION);

                            // MainBodyContext.read<ChangePage_Bloc>()
                            //     .ChangePage_nodrower('', Page27());
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            height: P202SELECTCHEMLISTvar.isHoveredPLANNING
                                ? 75
                                : 70,
                            width: P202SELECTCHEMLISTvar.isHoveredPLANNING
                                ? 420
                                : 430,
                            decoration: BoxDecoration(
                              color: P202SELECTCHEMLISTvar.isHoveredPLANNING
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
                                'QM-I004:Inbound Interface Usage Decision for Incoming Inspection lot and Final Inspection Lot',
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
                            P202SELECTCHEMLISTvar.isHoveredSTATUS = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P202SELECTCHEMLISTvar.isHoveredSTATUS = false;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              P202SELECTCHEMLISTvar.isHoveredSTATUS = false;
                            });
                            USERDATA.ACTION = 'STATUS';
                            print(USERDATA.ACTION);

                            // MainBodyContext.read<ChangePage_Bloc>()
                            //     .ChangePage_nodrower('', Page18());
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            height:
                                P202SELECTCHEMLISTvar.isHoveredSTATUS ? 75 : 70,
                            width: P202SELECTCHEMLISTvar.isHoveredSTATUS
                                ? 420
                                : 430,
                            decoration: BoxDecoration(
                              color: P202SELECTCHEMLISTvar.isHoveredSTATUS
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
                                'PP-I001:Outbound Interface SAP to Automation',
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
                            P202SELECTCHEMLISTvar.isHoveredSCADADATA = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P202SELECTCHEMLISTvar.isHoveredSCADADATA = false;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              P202SELECTCHEMLISTvar.isHoveredSCADADATA = false;
                            });
                            USERDATA.ACTION = 'PRODUCTION CONFIRMATION';
                            print(USERDATA.ACTION);

                            // MainBodyContext.read<ChangePage_Bloc>()
                            //     .ChangePage_nodrower('', Page28());
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            height: P202SELECTCHEMLISTvar.isHoveredSCADADATA
                                ? 55
                                : 50,
                            width: P202SELECTCHEMLISTvar.isHoveredSCADADATA
                                ? 420
                                : 430,
                            decoration: BoxDecoration(
                              color: P202SELECTCHEMLISTvar.isHoveredSCADADATA
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
                                'PP-I005:Inbound interface confirmation',
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
                            P202SELECTCHEMLISTvar.isHoveredSCADADATA2 = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P202SELECTCHEMLISTvar.isHoveredSCADADATA2 = false;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              P202SELECTCHEMLISTvar.isHoveredSCADADATA2 = false;
                            });
                            USERDATA.ACTION = 'FINISHED GOOD TRANFER';
                            print(USERDATA.ACTION);

                            // MainBodyContext.read<ChangePage_Bloc>()
                            //     .ChangePage_nodrower('', Page29());
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            height: P202SELECTCHEMLISTvar.isHoveredSCADADATA2
                                ? 55
                                : 50,
                            width: P202SELECTCHEMLISTvar.isHoveredSCADADATA2
                                ? 420
                                : 430,
                            decoration: BoxDecoration(
                              color: P202SELECTCHEMLISTvar.isHoveredSCADADATA2
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
                                'PP-I003:Inbound Interface Post Goods Receipt',
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
