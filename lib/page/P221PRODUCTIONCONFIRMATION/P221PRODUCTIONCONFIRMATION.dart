// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';

import '../../bloc/BlocEvent/P221-01-P221PRODUCTIONCONFIRMATIONget.dart';
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
import 'P221PRODUCTIONCONFIRMATIONVAR.dart';

late BuildContext P221PRODUCTIONCONFIRMATIONcontext;

class P221PRODUCTIONCONFIRMATION extends StatefulWidget {
  P221PRODUCTIONCONFIRMATION({
    super.key,
    this.data,
  });
  List<P221PRODUCTIONCONFIRMATIONgetclass>? data;

  @override
  State<P221PRODUCTIONCONFIRMATION> createState() =>
      _P221PRODUCTIONCONFIRMATIONState();
}

class _P221PRODUCTIONCONFIRMATIONState
    extends State<P221PRODUCTIONCONFIRMATION> {
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    // P221PRODUCTIONCONFIRMATIONVAR.formattedDate = DateFormat('dd-MM-yy').format(now);
    P221PRODUCTIONCONFIRMATIONVAR.day = DateFormat('dd').format(now);
    P221PRODUCTIONCONFIRMATIONVAR.month = DateFormat('MM').format(now);
    P221PRODUCTIONCONFIRMATIONVAR.year = DateFormat('yyyy').format(now);

    // P221PRODUCTIONCONFIRMATIONVAR.day_next = DateFormat('dd').format(now);
    // P221PRODUCTIONCONFIRMATIONVAR.month_next = DateFormat('MM').format(now);
    // P221PRODUCTIONCONFIRMATIONVAR.year_next = DateFormat('yyyy').format(now);

    P221PRODUCTIONCONFIRMATIONVAR.day_next = "05";
    P221PRODUCTIONCONFIRMATIONVAR.month_next = "04";
    P221PRODUCTIONCONFIRMATIONVAR.year_next = "2025";

    P221PRODUCTIONCONFIRMATIONVAR.iscontrol = true;
    P221PRODUCTIONCONFIRMATIONVAR.SEARCH = '';
    P221PRODUCTIONCONFIRMATIONVAR.holding = 999;
    context
        .read<P221PRODUCTIONCONFIRMATIONget_Bloc>()
        .add(P221PRODUCTIONCONFIRMATIONget_GET());
  }

  @override
  Widget build(BuildContext context) {
    P221PRODUCTIONCONFIRMATIONcontext = context;
    List<P221PRODUCTIONCONFIRMATIONgetclass> _datain = widget.data ?? [];
    List<P221PRODUCTIONCONFIRMATIONgetclass> _datasearch = [];

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
                        P221PRODUCTIONCONFIRMATIONVAR.day = day;
                        P221PRODUCTIONCONFIRMATIONVAR.month = month;
                        P221PRODUCTIONCONFIRMATIONVAR.year = year;

                        setState(() {});
                        context
                            .read<P221PRODUCTIONCONFIRMATIONget_Bloc>()
                            .add(P221PRODUCTIONCONFIRMATIONget_GET());
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
                          "วันที่ : ${P221PRODUCTIONCONFIRMATIONVAR.day}-${P221PRODUCTIONCONFIRMATIONVAR.month}-${P221PRODUCTIONCONFIRMATIONVAR.year}",
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
                        P221PRODUCTIONCONFIRMATIONVAR.day_next = day;
                        P221PRODUCTIONCONFIRMATIONVAR.month_next = month;
                        P221PRODUCTIONCONFIRMATIONVAR.year_next = year;

                        setState(() {});
                        context
                            .read<P221PRODUCTIONCONFIRMATIONget_Bloc>()
                            .add(P221PRODUCTIONCONFIRMATIONget_GET());
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
                          "ถึงวันที่ : ${P221PRODUCTIONCONFIRMATIONVAR.day_next}-${P221PRODUCTIONCONFIRMATIONVAR.month_next}-${P221PRODUCTIONCONFIRMATIONVAR.year_next}",
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
                                  P221PRODUCTIONCONFIRMATIONVAR
                                          .PROCESS_ORDERselect =
                                      _datain[i].PROCESS_ORDER;

                                  P310CHEMTANKVAR.PLANT =
                                      _datain[i].PROD_SUP_DESC;
                                  P310CHEMTANKVAR.ORDER =
                                      // _datain[i].PROCESS_ORDER;
                                      _datain[i].LINK_PROC_ORDER;
                                  P221PRODUCTIONCONFIRMATIONVAR.datasetsend =
                                      _datain[i];
                                  _POPUPCREATEUSERSW(context);

                                  // print(_datain[i].PROCESS_ORDER);
                                },
                                onHover: (v) {
                                  //
                                  // print(v.toString() + ":" + i.toString());
                                  setState(() {
                                    P221PRODUCTIONCONFIRMATIONVAR.holding = i;
                                  });
                                },
                                child: PRODUCTIONCONFIRMATIONitem(
                                  holding:
                                      P221PRODUCTIONCONFIRMATIONVAR.holding ==
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
                                  text09: "-",
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
//         create: (_) => P221PRODUCTIONCONFIRMATIONgetsub_Bloc(),
//         child: BlocBuilder<P221PRODUCTIONCONFIRMATIONgetsub_Bloc,
//             List<P221PRODUCTIONCONFIRMATIONgetsubclass>>(
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
//   List<P221PRODUCTIONCONFIRMATIONgetsubclass>? data;

//   @override
//   State<_DATAGETSET> createState() => __DATAGETSETState();
// }

// class __DATAGETSETState extends State<_DATAGETSET> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     context
//         .read<P221PRODUCTIONCONFIRMATIONgetsub_Bloc>()
//         .add(P221PRODUCTIONCONFIRMATIONgetsub_GET());
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<P221PRODUCTIONCONFIRMATIONgetsubclass> _data = widget.data ?? [];
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

// //P221PRODUCTIONCONFIRMATIONgetsubclass