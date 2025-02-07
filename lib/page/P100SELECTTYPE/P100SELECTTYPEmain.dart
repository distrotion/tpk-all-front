// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';

import '../page1.dart';
import '../page101.dart';
import '../page102.dart';
import 'P100SELECTTYPEvar.dart';

class P100SELECTTYPEmain extends StatefulWidget {
  const P100SELECTTYPEmain({super.key});

  @override
  State<P100SELECTTYPEmain> createState() => _P100SELECTTYPEmainState();
}

class _P100SELECTTYPEmainState extends State<P100SELECTTYPEmain> {
  @override
  Widget build(BuildContext context) {
    return P100SELECTTYPEmainBody();
  }
}

class P100SELECTTYPEmainBody extends StatefulWidget {
  const P100SELECTTYPEmainBody({super.key});

  @override
  State<P100SELECTTYPEmainBody> createState() => _P100SELECTTYPEmainBodyState();
}

class _P100SELECTTYPEmainBodyState extends State<P100SELECTTYPEmainBody> {
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
                          .ChangePage_nodrower('', Page1());
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
                    'SELECT MONITOR PROGRESS',
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
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          P100SELECTTYPEvar.isHoveredHAndS = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          P100SELECTTYPEvar.isHoveredHAndS = false;
                        });
                      },
                      child: InkWell(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        onTap: () {
                          setState(() {
                            P100SELECTTYPEvar.isHoveredHAndS = false;
                          });
                          USERDATA.INSMASTER = 'H&S';
                          print(USERDATA.INSMASTER);

                          MainBodyContext.read<ChangePage_Bloc>()
                              .ChangePage_nodrower('', Page101());
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: P100SELECTTYPEvar.isHoveredHAndS
                                  ? Colors.yellowAccent.shade700
                                  : Colors.redAccent.shade700,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: const [
                                    Colors.white,
                                    Colors.red,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds),
                                child: TweenAnimationBuilder<double>(
                                  tween: Tween<double>(
                                    begin: P100SELECTTYPEvar.isHoveredHAndS
                                        ? 200
                                        : 220,
                                    end: P100SELECTTYPEvar.isHoveredHAndS
                                        ? 220
                                        : 200,
                                  ),
                                  duration: Duration(milliseconds: 200),
                                  builder: (context, size, child) {
                                    return TweenAnimationBuilder<Color?>(
                                      tween: ColorTween(
                                        begin: P100SELECTTYPEvar.isHoveredHAndS
                                            ? Colors.redAccent.shade700
                                            : Colors.yellowAccent.shade700,
                                        end: P100SELECTTYPEvar.isHoveredHAndS
                                            ? Colors.yellowAccent.shade700
                                            : Colors.redAccent.shade700,
                                      ),
                                      duration: Duration(milliseconds: 200),
                                      builder: (context, color, child) {
                                        return Icon(
                                          Icons.fireplace_rounded,
                                          size: size,
                                          color: color,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [
                                    Colors.redAccent.shade700,
                                    Colors.yellowAccent.shade700,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(bounds),
                                child: Text(
                                  'HEAT & SURFACE',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          P100SELECTTYPEvar.isHoveredChem = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          P100SELECTTYPEvar.isHoveredChem = false;
                        });
                      },
                      child: InkWell(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        onTap: () {
                          setState(() {
                            P100SELECTTYPEvar.isHoveredChem = false;
                          });
                          USERDATA.INSMASTER = 'CHEMICAL';
                          print(USERDATA.INSMASTER);

                          MainBodyContext.read<ChangePage_Bloc>()
                              .ChangePage_nodrower('', Page102());
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: P100SELECTTYPEvar.isHoveredChem
                                  ? Colors.greenAccent
                                  : Colors.green,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Colors.lightGreenAccent.shade400,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds),
                                child: TweenAnimationBuilder<double>(
                                  tween: Tween<double>(
                                    begin: P100SELECTTYPEvar.isHoveredChem
                                        ? 200
                                        : 220,
                                    end: P100SELECTTYPEvar.isHoveredChem
                                        ? 220
                                        : 200,
                                  ),
                                  duration: Duration(milliseconds: 200),
                                  builder: (context, size, child) {
                                    return TweenAnimationBuilder<Color?>(
                                      tween: ColorTween(
                                        begin: P100SELECTTYPEvar.isHoveredChem
                                            ? Colors.greenAccent
                                            : Colors.green,
                                        end: P100SELECTTYPEvar.isHoveredChem
                                            ? Colors.greenAccent
                                            : Colors.green,
                                      ),
                                      duration: Duration(milliseconds: 200),
                                      builder: (context, color, child) {
                                        return Icon(
                                          Icons.science_rounded,
                                          size: size,
                                          color: color,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Colors.lightGreenAccent.shade400,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(bounds),
                                child: Text(
                                  'CHEMICAL',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
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
