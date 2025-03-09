// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputTextTan.dart';
import '../../widget/table/PROGRESSMAIN.dart';

import '../page202.dart';
import 'P27PROGRESS2VAR.dart';

late BuildContext P27PROGRESS2MAINcontext;

class P27PROGRESS2MAIN extends StatefulWidget {
  P27PROGRESS2MAIN({
    super.key,
    this.data,
  });
  List<P27PROGRESSGETDATAclass>? data;

  @override
  State<P27PROGRESS2MAIN> createState() => _P27PROGRESS2MAINState();
}

class _P27PROGRESS2MAINState extends State<P27PROGRESS2MAIN> {
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    // P27PROGRESS2VAR.formattedDate = DateFormat('dd-MM-yy').format(now);
    // P27PROGRESS2VAR.day = DateFormat('dd').format(now);
    // P27PROGRESS2VAR.month = DateFormat('MM').format(now);
    // P27PROGRESS2VAR.year = DateFormat('yyyy').format(now);
    P27PROGRESS2VAR.day = "7";
    P27PROGRESS2VAR.month = "02";
    P27PROGRESS2VAR.year = "2025";

    P27PROGRESS2VAR.iscontrol = true;
    P27PROGRESS2VAR.SEARCH = '';
  }

  @override
  Widget build(BuildContext context) {
    P27PROGRESS2MAINcontext = context;
    // List<P27PROGRESSGETDATAclass> _datain = widget.data ?? [];
    List<P27PROGRESSGETDATAclass> _datain = [
      P27PROGRESSGETDATAclass(
          LOT: "240113L1",
          CHMNAME: "PALBOND",
          ORDER: "1010000086",
          MAT: "11000013",
          STATUS: "FINISH",
          PLANT: "Liquid",
          QTY: "1200 L"),
    ];
    List<P27PROGRESSGETDATAclass> _datasearch = [];

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded, size: 30),
              onPressed: () {
                MainBodyContext.read<ChangePage_Bloc>()
                    .ChangePage_nodrower('', Page202());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: const [Colors.blueAccent, Colors.lightBlueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: Text(
                      '${USERDATA.INSMASTER} : ${USERDATA.ACTION}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ComInputTextTan(
                                sPlaceholder: "Search...",
                                isSideIcon: true,
                                height: 40,
                                width: 400,
                                isContr: P27PROGRESS2VAR.iscontrol,
                                fnContr: (input) {
                                  P27PROGRESS2VAR.iscontrol = input;
                                },
                                sValue: P27PROGRESS2VAR.SEARCH,
                                returnfunc: (String s) {
                                  setState(() {
                                    P27PROGRESS2VAR.SEARCH = s;
                                  });
                                },
                              ),
                              MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    P27PROGRESS2VAR.isHoveredClear = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    P27PROGRESS2VAR.isHoveredClear = false;
                                  });
                                },
                                child: InkWell(
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  onTap: () {
                                    setState(() {
                                      P27PROGRESS2VAR.isHoveredClear = false;
                                      P27PROGRESS2VAR.iscontrol = true;
                                      P27PROGRESS2VAR.SEARCH = '';
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: P27PROGRESS2VAR.isHoveredClear
                                            ? Colors.yellowAccent.shade700
                                            : Colors.redAccent.shade700,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ShaderMask(
                                          shaderCallback: (bounds) =>
                                              LinearGradient(
                                            colors: const [
                                              Colors.white,
                                              Colors.red,
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ).createShader(bounds),
                                          child: TweenAnimationBuilder<double>(
                                            tween: Tween<double>(
                                              begin:
                                                  P27PROGRESS2VAR.isHoveredClear
                                                      ? 15
                                                      : 17,
                                              end:
                                                  P27PROGRESS2VAR.isHoveredClear
                                                      ? 17
                                                      : 15,
                                            ),
                                            duration:
                                                Duration(milliseconds: 200),
                                            builder: (context, size, child) {
                                              return TweenAnimationBuilder<
                                                  Color?>(
                                                tween: ColorTween(
                                                  begin: P27PROGRESS2VAR
                                                          .isHoveredClear
                                                      ? Colors
                                                          .redAccent.shade700
                                                      : Colors.yellowAccent
                                                          .shade700,
                                                  end: P27PROGRESS2VAR
                                                          .isHoveredClear
                                                      ? Colors
                                                          .yellowAccent.shade700
                                                      : Colors
                                                          .redAccent.shade700,
                                                ),
                                                duration:
                                                    Duration(milliseconds: 200),
                                                builder:
                                                    (context, color, child) {
                                                  return Text(
                                                    'CLEAR',
                                                    style: TextStyle(
                                                      fontSize: size,
                                                      color: color,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        padding: const EdgeInsets.all(10),
                                      ),
                                      child: const Icon(
                                        Icons.refresh_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Refresh',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: 900,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              border: Border(
                                top: BorderSide(),
                                left: BorderSide(),
                                right: BorderSide(),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "บริษัท ไทยปาร์คเกอร์ไรซิ่ง จำกัด",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 900,
                            decoration: BoxDecoration(
                              // color: Colors.blue.shade900,
                              border: Border(
                                top: BorderSide(),
                                left: BorderSide(),
                                right: BorderSide(),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "ตารางการผลิตต่อวัน",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              DateTime calendaset = DateTime.now();
                              //
                              CalendaSelectDates(context, calendaset,
                                  (day, month, year) {
                                //
                                P27PROGRESS2VAR.day = day;
                                P27PROGRESS2VAR.month = month;
                                P27PROGRESS2VAR.year = year;

                                setState(() {});
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 900,
                              decoration: BoxDecoration(
                                // color: Colors.blue.shade900,
                                border: Border(
                                  top: BorderSide(),
                                  left: BorderSide(),
                                  right: BorderSide(),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "วันที่ : ${P27PROGRESS2VAR.day}-${P27PROGRESS2VAR.month}-${P27PROGRESS2VAR.year}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              PROGRESSMAINtable(),
                              // if (_datasearch
                              //     .any((item) => item.PLANT == 'noxrust'))
                              SingleChildScrollView(
                                child: Container(
                                  width: 1100,
                                  child: Column(
                                    children: [
                                      for (int i = 0;
                                          i < _datain.length;
                                          i++) ...[
                                        InkWell(
                                          onTap: () {},
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 100,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      left: BorderSide(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      _datain[i].ORDER,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 100,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      left: BorderSide(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      _datain[i].MAT,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 400,
                                                child: SizedBox(
                                                  height: 30,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                        '   ${_datain[i].CHMNAME}'),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 100,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      left: BorderSide(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      _datain[i].PLANT,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 100,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      left: BorderSide(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      _datain[i].PLANT,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 100,
                                                child: Container(
                                                  height: 30,
                                                  child: Center(
                                                      child:
                                                          Text(_datain[i].LOT)),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 100,
                                                child: SizedBox(
                                                  height: 30,
                                                  child: Center(
                                                    child: Text(_datain[i].QTY),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 100,
                                                child: Container(
                                                  color: _datain[i].STATUS ==
                                                          'Finished'
                                                      ? Colors.green
                                                      : Colors.white,
                                                  height: 30,
                                                  child: Center(
                                                    child:
                                                        Text(_datain[i].STATUS),
                                                  ),
                                                ),
                                              ),
                                              // Expanded(
                                              //   flex: 100,
                                              //   child: SizedBox(
                                              //     height: 30,
                                              //     child: Center(
                                              //       child: Text(_datain[i].MAT),
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class P27PROGRESSGETDATAclass {
  P27PROGRESSGETDATAclass({
    this.LOT = '',
    this.CHMNAME = '',
    this.QTY = '',
    this.PLANT = '',
    this.ORDER = '',
    this.MAT = '',
    this.STATUS = '',
  });

  String LOT;
  String CHMNAME;
  String QTY;
  String PLANT;
  String ORDER;
  String MAT;
  String STATUS;
}
