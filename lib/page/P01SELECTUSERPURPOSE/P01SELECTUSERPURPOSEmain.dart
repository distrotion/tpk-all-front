// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../page100.dart';
import '../page200.dart';
import 'P01SELECTUSERPURPOSEvar.dart';

class P01SELECTUSERPURPOSEmain extends StatefulWidget {
  const P01SELECTUSERPURPOSEmain({super.key});

  @override
  State<P01SELECTUSERPURPOSEmain> createState() =>
      _P01SELECTUSERPURPOSEmainState();
}

class _P01SELECTUSERPURPOSEmainState extends State<P01SELECTUSERPURPOSEmain> {
  @override
  Widget build(BuildContext context) {
    return P01SELECTUSERPURPOSEmainBody();
  }
}

class P01SELECTUSERPURPOSEmainBody extends StatefulWidget {
  const P01SELECTUSERPURPOSEmainBody({super.key});

  @override
  State<P01SELECTUSERPURPOSEmainBody> createState() =>
      _P01SELECTUSERPURPOSEmainBodyState();
}

class _P01SELECTUSERPURPOSEmainBodyState
    extends State<P01SELECTUSERPURPOSEmainBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                  'SELECT USER PURPOSE',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
                            P01SELECTUSERPURPOSEvar.isHoveredHAndS = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P01SELECTUSERPURPOSEvar.isHoveredHAndS = false;
                          });
                        },
                        child: InkWell(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          onTap: () {
                            setState(() {
                              P01SELECTUSERPURPOSEvar.isHoveredHAndS = false;
                            });
                            USERDATA.INSMASTER = 'MONITOR';
                            print(USERDATA.INSMASTER);

                            MainBodyContext.read<ChangePage_Bloc>()
                                .ChangePage_nodrower('', Page100());
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: P01SELECTUSERPURPOSEvar.isHoveredHAndS
                                    ? Colors.yellowAccent.shade700
                                    : Colors.blue.shade700,
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
                                      Colors.blue,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ).createShader(bounds),
                                  child: TweenAnimationBuilder<double>(
                                    tween: Tween<double>(
                                      begin:
                                          P01SELECTUSERPURPOSEvar.isHoveredHAndS
                                              ? 200
                                              : 220,
                                      end:
                                          P01SELECTUSERPURPOSEvar.isHoveredHAndS
                                              ? 220
                                              : 200,
                                    ),
                                    duration: Duration(milliseconds: 200),
                                    builder: (context, size, child) {
                                      return TweenAnimationBuilder<Color?>(
                                        tween: ColorTween(
                                          begin: P01SELECTUSERPURPOSEvar
                                                  .isHoveredHAndS
                                              ? Colors.blue.shade700
                                              : Colors.yellowAccent.shade700,
                                          end: P01SELECTUSERPURPOSEvar
                                                  .isHoveredHAndS
                                              ? Colors.yellowAccent.shade700
                                              : Colors.blue.shade700,
                                        ),
                                        duration: Duration(milliseconds: 200),
                                        builder: (context, color, child) {
                                          return Icon(
                                            Icons.monitor,
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
                                      Colors.blue.shade700,
                                      Colors.yellowAccent.shade700,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(bounds),
                                  child: Text(
                                    'MONITOR',
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
                            P01SELECTUSERPURPOSEvar.isHoveredChem = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            P01SELECTUSERPURPOSEvar.isHoveredChem = false;
                          });
                        },
                        child: InkWell(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          onTap: () {
                            setState(() {
                              P01SELECTUSERPURPOSEvar.isHoveredChem = false;
                            });
                            USERDATA.INSMASTER = 'OPERATION';
                            print(USERDATA.INSMASTER);

                            MainBodyContext.read<ChangePage_Bloc>()
                                .ChangePage_nodrower('', Page200());
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: P01SELECTUSERPURPOSEvar.isHoveredChem
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
                                      begin:
                                          P01SELECTUSERPURPOSEvar.isHoveredChem
                                              ? 200
                                              : 220,
                                      end: P01SELECTUSERPURPOSEvar.isHoveredChem
                                          ? 220
                                          : 200,
                                    ),
                                    duration: Duration(milliseconds: 200),
                                    builder: (context, size, child) {
                                      return TweenAnimationBuilder<Color?>(
                                        tween: ColorTween(
                                          begin: P01SELECTUSERPURPOSEvar
                                                  .isHoveredChem
                                              ? Colors.greenAccent
                                              : Colors.green,
                                          end: P01SELECTUSERPURPOSEvar
                                                  .isHoveredChem
                                              ? Colors.greenAccent
                                              : Colors.green,
                                        ),
                                        duration: Duration(milliseconds: 200),
                                        builder: (context, color, child) {
                                          return Icon(
                                            Icons.factory,
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
                                    'OPERATION',
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
      ),
    );
  }
}
