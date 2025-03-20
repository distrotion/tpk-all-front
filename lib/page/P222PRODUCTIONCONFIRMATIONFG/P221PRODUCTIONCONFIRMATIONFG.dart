// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';

import '../../bloc/BlocEvent/P222-01-P222PRODUCTIONCONFIRMATIONFGget.dart';
import '../../bloc/BlocEvent/P301-02-P301QMMASTERgetINSP_SPEC.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/ComInputTextTan.dart';
import '../../widget/newtable/INSP_SPECtable.dart';
import '../../widget/newtable/PLANINGSUBtable.dart';
import '../../widget/newtable/PLANINGtable.dart';
import '../../widget/newtable/PRODUCTIONCONFIRMATIONtable.dart';
import '../../widget/newtable/QMMAASTERtable.dart';
import '../../widget/table/PROGRESSMAIN.dart';

import '../P310CHEMTANK/P310CHEMTANKVAR.dart';
import '../page202.dart';
import '../page310.dart';
import 'P221PRODUCTIONCONFIRMATIONFGVAR.dart';

late BuildContext P222PRODUCTIONCONFIRMATIONFGcontext;

class P222PRODUCTIONCONFIRMATIONFG extends StatefulWidget {
  P222PRODUCTIONCONFIRMATIONFG({
    super.key,
    this.data,
  });
  List<P222PRODUCTIONCONFIRMATIONFGgetclass>? data;

  @override
  State<P222PRODUCTIONCONFIRMATIONFG> createState() =>
      _P222PRODUCTIONCONFIRMATIONFGState();
}

class _P222PRODUCTIONCONFIRMATIONFGState
    extends State<P222PRODUCTIONCONFIRMATIONFG> {
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    // P222PRODUCTIONCONFIRMATIONFGVAR.formattedDate = DateFormat('dd-MM-yy').format(now);
    P222PRODUCTIONCONFIRMATIONFGVAR.day = DateFormat('dd').format(now);
    P222PRODUCTIONCONFIRMATIONFGVAR.month = DateFormat('MM').format(now);
    P222PRODUCTIONCONFIRMATIONFGVAR.year = DateFormat('yyyy').format(now);

    // P222PRODUCTIONCONFIRMATIONFGVAR.day_next = DateFormat('dd').format(now);
    // P222PRODUCTIONCONFIRMATIONFGVAR.month_next = DateFormat('MM').format(now);
    // P222PRODUCTIONCONFIRMATIONFGVAR.year_next = DateFormat('yyyy').format(now);

    P222PRODUCTIONCONFIRMATIONFGVAR.day_next = "05";
    P222PRODUCTIONCONFIRMATIONFGVAR.month_next = "04";
    P222PRODUCTIONCONFIRMATIONFGVAR.year_next = "2025";

    P222PRODUCTIONCONFIRMATIONFGVAR.iscontrol = true;
    P222PRODUCTIONCONFIRMATIONFGVAR.SEARCH = '';
    P222PRODUCTIONCONFIRMATIONFGVAR.holding = 999;
    context
        .read<P222PRODUCTIONCONFIRMATIONFGget_Bloc>()
        .add(P222PRODUCTIONCONFIRMATIONFGget_GET());
  }

  @override
  Widget build(BuildContext context) {
    P222PRODUCTIONCONFIRMATIONFGcontext = context;
    List<P222PRODUCTIONCONFIRMATIONFGgetclass> _datain = widget.data ?? [];
    List<P222PRODUCTIONCONFIRMATIONFGgetclass> _datasearch = [];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
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
                              .ChangePage_nodrower('', Page202());
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
                        colors: const [
                          Colors.blueAccent,
                          Colors.lightBlueAccent
                        ],
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
                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .ChangePage_nodrower('', Page1());
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    // width: 900,
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
                    // width: 900,
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
                        "PRODUCTION CONFIRMATION TABLE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
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
                        P222PRODUCTIONCONFIRMATIONFGVAR.day = day;
                        P222PRODUCTIONCONFIRMATIONFGVAR.month = month;
                        P222PRODUCTIONCONFIRMATIONFGVAR.year = year;

                        setState(() {});
                        context
                            .read<P222PRODUCTIONCONFIRMATIONFGget_Bloc>()
                            .add(P222PRODUCTIONCONFIRMATIONFGget_GET());
                      });
                    },
                    child: Container(
                      height: 30,
                      // width: 900,
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
                          "วันที่ : ${P222PRODUCTIONCONFIRMATIONFGVAR.day}-${P222PRODUCTIONCONFIRMATIONFGVAR.month}-${P222PRODUCTIONCONFIRMATIONFGVAR.year}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
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
                        P222PRODUCTIONCONFIRMATIONFGVAR.day_next = day;
                        P222PRODUCTIONCONFIRMATIONFGVAR.month_next = month;
                        P222PRODUCTIONCONFIRMATIONFGVAR.year_next = year;

                        setState(() {});
                        context
                            .read<P222PRODUCTIONCONFIRMATIONFGget_Bloc>()
                            .add(P222PRODUCTIONCONFIRMATIONFGget_GET());
                      });
                    },
                    child: Container(
                      height: 30,
                      // width: 900,
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
                          "ถึงวันที่ : ${P222PRODUCTIONCONFIRMATIONFGVAR.day_next}-${P222PRODUCTIONCONFIRMATIONFGVAR.month_next}-${P222PRODUCTIONCONFIRMATIONFGVAR.year_next}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  PRODUCTIONCONFIRMATIONtable(),
                  // if (_datasearch
                  //     .any((item) => item.PLANT == 'noxrust'))
                  SizedBox(
                    height: 500,
                    child: SingleChildScrollView(
                      child: Container(
                        // width: 1100,
                        child: Column(
                          children: [
                            for (int i = 0; i < _datain.length; i++) ...[
                              // for (int i = 0; i < 10; i++) ...[
                              InkWell(
                                onTap: () {
                                  //
                                  P222PRODUCTIONCONFIRMATIONFGVAR
                                          .PROCESS_ORDERselect =
                                      _datain[i].PROCESS_ORDER;

                                  P310CHEMTANKVAR.PLANT =
                                      _datain[i].PROD_SUP_DESC;
                                  P310CHEMTANKVAR.ORDER =
                                      // _datain[i].PROCESS_ORDER;
                                      _datain[i].LINK_PROC_ORDER;
                                  P222PRODUCTIONCONFIRMATIONFGVAR.datasetsend =
                                      _datain[i];
                                  _POPUPCREATEUSERSW(context);

                                  // print(_datain[i].PROCESS_ORDER);
                                },
                                onHover: (v) {
                                  //
                                  // print(v.toString() + ":" + i.toString());
                                  setState(() {
                                    P222PRODUCTIONCONFIRMATIONFGVAR.holding = i;
                                  });
                                },
                                child: PRODUCTIONCONFIRMATIONitem(
                                  holding:
                                      P222PRODUCTIONCONFIRMATIONFGVAR.holding ==
                                          i,
                                  text01: _datain[i].PROCESS_ORDER,
                                  text02: _datain[i].MATERIAL,
                                  text03: _datain[i].MATERIAL_TEXT,
                                  text04: _datain[i].PROD_SUP_DESC,
                                  text05: _datain[i].PROD_SUP,
                                  text06: _datain[i].BATCH,
                                  text07: (_datain[i].Yield != '')
                                      ? (_datain[i].Yield +
                                          ' ' +
                                          _datain[i].UOM)
                                      : '',
                                  text08: _datain[i].STATUS,
                                  text09: "",
                                  // text09: _datain[i].SYSTEM_STATUS,
                                  //SYSTEM_STATUS
                                  text10: "-",
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _POPUPCREATEUSERSW(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 600,
              width: 800,
              child: Page310(),
            ),
          ),
        ),
      );
    },
  );
}

// void _POPUPCREATEUSERSW(BuildContext contextin) {
//   showDialog(
//     context: contextin,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return Center(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: SingleChildScrollView(
//             child: Container(
//               height: 600,
//               width: 800,
//               color: Colors.white,
//               // child: Page43(),
//               child: _DATAGETSETbloc(),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

// class _DATAGETSETbloc extends StatelessWidget {
//   const _DATAGETSETbloc({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (_) => P222PRODUCTIONCONFIRMATIONFGgetsub_Bloc(),
//         child: BlocBuilder<P222PRODUCTIONCONFIRMATIONFGgetsub_Bloc,
//             List<P222PRODUCTIONCONFIRMATIONFGgetsubclass>>(
//           builder: (context, data) {
//             return _DATAGETSET(
//               data: data,
//             );
//           },
//         ));
//   }
// }

// class _DATAGETSET extends StatefulWidget {
//   _DATAGETSET({
//     super.key,
//     this.data,
//   });
//   List<P222PRODUCTIONCONFIRMATIONFGgetsubclass>? data;

//   @override
//   State<_DATAGETSET> createState() => __DATAGETSETState();
// }

// class __DATAGETSETState extends State<_DATAGETSET> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     context
//         .read<P222PRODUCTIONCONFIRMATIONFGgetsub_Bloc>()
//         .add(P222PRODUCTIONCONFIRMATIONFGgetsub_GET());
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<P222PRODUCTIONCONFIRMATIONFGgetsubclass> _data = widget.data ?? [];
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         children: [
//           PLANINGSUBtable(),
//           // if (_datasearch
//           //     .any((item) => item.PLANT == 'noxrust'))
//           SizedBox(
//             height: 500,
//             child: SingleChildScrollView(
//               child: Container(
//                 // width: 1100,
//                 child: Column(
//                   children: [
//                     for (int i = 0; i < _data.length; i++) ...[
//                       // for (int i = 0; i < 10; i++) ...[
//                       PLANINGSUBitem(
//                         text01: _data[i].ITEM,
//                         text02: _data[i].MATERIAL_TEXT,
//                         text03: _data[i].REQ_QTY,
//                         text04: _data[i].BATCH,
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// //P222PRODUCTIONCONFIRMATIONFGgetsubclass