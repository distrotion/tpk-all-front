// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';

import '../page1.dart';
import '../page100.dart';
import 'P9999TESTvar.dart';

class P9999TESTmain extends StatefulWidget {
  const P9999TESTmain({super.key});

  @override
  State<P9999TESTmain> createState() => _P9999TESTmainState();
}

class _P9999TESTmainState extends State<P9999TESTmain> {
  @override
  Widget build(BuildContext context) {
    return P9999TESTmainBody();
  }
}

class P9999TESTmainBody extends StatefulWidget {
  const P9999TESTmainBody({super.key});

  @override
  State<P9999TESTmainBody> createState() => _P9999TESTmainBodyState();
}

class _P9999TESTmainBodyState extends State<P9999TESTmainBody> {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
