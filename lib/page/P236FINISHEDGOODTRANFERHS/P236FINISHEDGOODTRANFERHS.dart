// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';

import '../../bloc/BlocEvent/P231-01-P221FINISHEDGOODTRANFERget.dart';
import '../../bloc/BlocEvent/P236-01-P236FINISHEDGOODTRANFERHSget.dart';
import '../../bloc/BlocEvent/P301-02-P301QMMASTERgetINSP_SPEC.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/CheckboxC.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/ComInputTextTan.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
import '../../widget/newtable/FINISHEDGOODTRANFERHStable.dart';
import '../../widget/newtable/INSP_SPECtable.dart';
import '../../widget/newtable/PLANINGSUBtable.dart';
import '../../widget/newtable/PLANINGtable.dart';
import '../../widget/newtable/FINISHEDGOODTRANFERtable.dart';
import '../../widget/newtable/QMMAASTERtable.dart';
import '../../widget/table/PROGRESSMAIN.dart';

import '../page1.dart';
import '../page202.dart';
import '../page204.dart';
import 'P236FINISHEDGOODTRANFERHSVAR.dart';

late BuildContext P236FINISHEDGOODTRANFERHScontext;

class P236FINISHEDGOODTRANFERHS extends StatefulWidget {
  P236FINISHEDGOODTRANFERHS({
    super.key,
    this.data,
  });
  List<P236FINISHEDGOODTRANFERHSgetclass>? data;

  @override
  State<P236FINISHEDGOODTRANFERHS> createState() =>
      _P236FINISHEDGOODTRANFERHSState();
}

class _P236FINISHEDGOODTRANFERHSState extends State<P236FINISHEDGOODTRANFERHS> {
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    // P236FINISHEDGOODTRANFERHSVAR.formattedDate = DateFormat('dd-MM-yy').format(now);
    P236FINISHEDGOODTRANFERHSVAR.day = DateFormat('dd').format(now);
    P236FINISHEDGOODTRANFERHSVAR.month = DateFormat('MM').format(now);
    P236FINISHEDGOODTRANFERHSVAR.year = DateFormat('yyyy').format(now);

    P236FINISHEDGOODTRANFERHSVAR.day_next = DateFormat('dd').format(now);
    P236FINISHEDGOODTRANFERHSVAR.month_next = DateFormat('MM').format(now);
    P236FINISHEDGOODTRANFERHSVAR.year_next = DateFormat('yyyy').format(now);

    // P236FINISHEDGOODTRANFERHSVAR.day = "05";
    // P236FINISHEDGOODTRANFERHSVAR.month = "03";
    // P236FINISHEDGOODTRANFERHSVAR.year = "2025";
    // P236FINISHEDGOODTRANFERHSVAR.day_next = "05";
    // P236FINISHEDGOODTRANFERHSVAR.month_next = "04";
    // P236FINISHEDGOODTRANFERHSVAR.year_next = "2025";

    P236FINISHEDGOODTRANFERHSVAR.iscontrol = true;
    P236FINISHEDGOODTRANFERHSVAR.SEARCH = '';
    P236FINISHEDGOODTRANFERHSVAR.holding = 999;
    context
        .read<P236FINISHEDGOODTRANFERHSget_Bloc>()
        .add(P236FINISHEDGOODTRANFERHSget_GET());
  }

  @override
  Widget build(BuildContext context) {
    P236FINISHEDGOODTRANFERHScontext = context;
    List<P236FINISHEDGOODTRANFERHSgetclass> _datain = widget.data ?? [];
    List<P236FINISHEDGOODTRANFERHSgetclass> _datasearch = [];

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
                              .ChangePage_nodrower('', Page204());
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
                        P236FINISHEDGOODTRANFERHSVAR.day = day;
                        P236FINISHEDGOODTRANFERHSVAR.month = month;
                        P236FINISHEDGOODTRANFERHSVAR.year = year;

                        setState(() {});
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
                          "วันที่ : ${P236FINISHEDGOODTRANFERHSVAR.day}-${P236FINISHEDGOODTRANFERHSVAR.month}-${P236FINISHEDGOODTRANFERHSVAR.year}",
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
                        P236FINISHEDGOODTRANFERHSVAR.day_next = day;
                        P236FINISHEDGOODTRANFERHSVAR.month_next = month;
                        P236FINISHEDGOODTRANFERHSVAR.year_next = year;

                        setState(() {});
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
                          "ถึงวันที่ : ${P236FINISHEDGOODTRANFERHSVAR.day_next}-${P236FINISHEDGOODTRANFERHSVAR.month_next}-${P236FINISHEDGOODTRANFERHSVAR.year_next}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  FINISHEDGOODTRANFERHStable(),
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
                                  P236FINISHEDGOODTRANFERHSVAR.PROCESS_ORDER =
                                      _datain[i].PROCESS_ORDER;
                                  P236FINISHEDGOODTRANFERHSVAR.MATERIAL =
                                      _datain[i].MATERIAL;

                                  P236FINISHEDGOODTRANFERHSVAR.UOM =
                                      _datain[i].UOM;
                                  P236FINISHEDGOODTRANFERHSVAR.GOOD =
                                      _datain[i].GOOD;
                                  P236FINISHEDGOODTRANFERHSVAR.NOGOOD =
                                      _datain[i].NOGOOD;
                                  _POPUPCREATEUSERSW(context);
                                },
                                onHover: (v) {
                                  //
                                  // print(v.toString() + ":" + i.toString());
                                  setState(() {
                                    P236FINISHEDGOODTRANFERHSVAR.holding = i;
                                  });
                                },
                                child: FINISHEDGOODTRANFERHSitem(
                                  Wid01: CheckBoxC(
                                    getChbox: (p0) {
                                      setState(() {
                                        _datain[i].check = p0;
                                      });
                                    },
                                    value: _datain[i].check,
                                  ),
                                  holding:
                                      P236FINISHEDGOODTRANFERHSVAR.holding == i,
                                  text01: _datain[i].PROCESS_ORDER,
                                  text02: _datain[i].MATERIAL,
                                  text03: _datain[i].MATERIAL_TEXT,
                                  text04: _datain[i].PROD_SUP_DESC,
                                  text05: _datain[i].BATCH,
                                  text06: _datain[i].GOOD,
                                  text07: _datain[i].NOGOOD,
                                  text08: "",
                                  text09: "",
                                  text10: "-",
                                  text11: "-",
                                  text12: "-",
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
        child: Container(
          height: 300,
          width: 800,
          color: Colors.white,
          child: Material(child: _DATAGETSET()),
        ),
      );
    },
  );
}

// class _DATAGETSETbloc extends StatelessWidget {
//   const _DATAGETSETbloc({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (_) => P236FINISHEDGOODTRANFERHSgetsub_Bloc(),
//         child: BlocBuilder<P236FINISHEDGOODTRANFERHSgetsub_Bloc,
//             List<P236FINISHEDGOODTRANFERHSgetsubclass>>(
//           builder: (context, data) {
//             return _DATAGETSET(
//               data: data,
//             );
//           },
//         ));
//   }
// }

class _DATAGETSET extends StatefulWidget {
  _DATAGETSET({
    super.key,
  });

  @override
  State<_DATAGETSET> createState() => __DATAGETSETState();
}

class __DATAGETSETState extends State<_DATAGETSET> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          if (P236FINISHEDGOODTRANFERHSVAR.Page == 0) ...[
            // if (_datasearch
            //     .any((item) => item.PLANT == 'noxrust'))
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                child: Text("DATA TO STORE"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("GOOD"),
                  ),
                  ComInputText(
                    height: 40,
                    width: 200,
                    isContr: P236FINISHEDGOODTRANFERHSVAR.iscontrol,
                    fnContr: (input) {
                      setState(() {
                        P236FINISHEDGOODTRANFERHSVAR.iscontrol = input;
                      });
                    },
                    sValue: P236FINISHEDGOODTRANFERHSVAR.GOOD,
                    returnfunc: (String s) {
                      setState(() {
                        P236FINISHEDGOODTRANFERHSVAR.GOOD = s;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(P236FINISHEDGOODTRANFERHSVAR.UNIT),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("NO GOOD"),
                  ),
                  ComInputText(
                    height: 40,
                    width: 200,
                    isContr: P236FINISHEDGOODTRANFERHSVAR.iscontrol,
                    fnContr: (input) {
                      setState(() {
                        P236FINISHEDGOODTRANFERHSVAR.iscontrol = input;
                      });
                    },
                    sValue: P236FINISHEDGOODTRANFERHSVAR.NOGOOD,
                    returnfunc: (String s) {
                      setState(() {
                        P236FINISHEDGOODTRANFERHSVAR.NOGOOD = s;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(P236FINISHEDGOODTRANFERHSVAR.UNIT),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: InkWell(
                onTap: () {
                  //
                  // DateTime calendaset = DateTime.now();
                  // Map<String, String> dataset = {
                  //   "PSTNG_DATE":
                  //       // "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                  //       "${P236FINISHEDGOODTRANFERHSVAR.day_next}.${P236FINISHEDGOODTRANFERHSVAR.month_next}.${P236FINISHEDGOODTRANFERHSVAR.year_next}",
                  //   "DOC_DATE":
                  //       // "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                  //       "${P236FINISHEDGOODTRANFERHSVAR.day_next}.${P236FINISHEDGOODTRANFERHSVAR.month_next}.${P236FINISHEDGOODTRANFERHSVAR.year_next}",
                  //   "REF_DOC_NO":
                  //       P236FINISHEDGOODTRANFERHSVAR.FGPOSTDATA.PROCESS_ORDER,
                  //   "HEADER_TXT": "USER DATA",
                  //   "MATERIAL":
                  //       P236FINISHEDGOODTRANFERHSVAR.FGPOSTDATA.MATERIAL,
                  //   "PLANT": "1000",
                  //   "STGE_LOC":
                  //       P236FINISHEDGOODTRANFERHSVAR.FGPOSTDATA.STGE_LOC,
                  //   "BATCH": P236FINISHEDGOODTRANFERHSVAR.FGPOSTDATA.BATCH,
                  //   "MOVE_TYPE": "101",
                  //   "STCK_TYPE": "",
                  //   "ENTRY_QNT": P236FINISHEDGOODTRANFERHSVAR.FINALSEND,
                  //   "ENTRY_UOM": P236FINISHEDGOODTRANFERHSVAR.FGPOSTDATA.UOM,
                  //   "ORDERID":
                  //       P236FINISHEDGOODTRANFERHSVAR.FGPOSTDATA.PROCESS_ORDER,
                  //   "EXPIRYDATE": "",
                  //   "PROD_DATE":
                  //       // "${calendaset.day}.${calendaset.month}.${calendaset.year}",
                  //       "${P236FINISHEDGOODTRANFERHSVAR.day_next}.${P236FINISHEDGOODTRANFERHSVAR.month_next}.${P236FINISHEDGOODTRANFERHSVAR.year_next}",
                  //   "TEMPLATE": ""
                  // };

                  // // print(dataset);

                  // FreeLoading(context);
                  // Dio()
                  //     .post(
                  //   "${server2}03iPPGETDATACHEM/SETI003DATA",
                  //   data: dataset,
                  // )
                  //     .then((v) {
                  //   //
                  //   // Navigator.pop(P236FINISHEDGOODTRANFERHScontext);
                  //   // Navigator.pop(context);
                  //   Navigator.pop(context);
                  //   P236FINISHEDGOODTRANFERHSVAR.Page = 1;
                  //   setState(() {});
                  //   print(v.data);
                  // });
                  FreeLoading(context);
                  if (ConverstStr(P236FINISHEDGOODTRANFERHSVAR.GOOD) != '0') {
                    Map<String, String> dataset = {
                      "PROCESSORDER":
                          P236FINISHEDGOODTRANFERHSVAR.PROCESS_ORDER,
                      "POSTINGDATE": "01.04.2025",
                      "MATERIAL": P236FINISHEDGOODTRANFERHSVAR.MATERIAL,
                      "QUANTITY":
                          (ConverstStr(P236FINISHEDGOODTRANFERHSVAR.GOOD)),
                      "UNIT": P236FINISHEDGOODTRANFERHSVAR.UOM,
                      "QUANTITYSTATUS": "GOOD"
                    };

                    Dio()
                        .post(
                      "${server2}10GETDATAFROMJOBBINGAQC/POSTTOSTORE",
                      data: dataset,
                    )
                        .then((v) {
                      //
                      // Navigator.pop(P236FINISHEDGOODTRANFERHScontext);
                      // Navigator.pop(context);

                      print(v.data);
                    });
                  }
                  Timer(Duration(seconds: 3), () {
                    if (ConverstStr(P236FINISHEDGOODTRANFERHSVAR.NOGOOD) !=
                        '0') {
                      Map<String, String> dataset = {
                        "PROCESSORDER":
                            P236FINISHEDGOODTRANFERHSVAR.PROCESS_ORDER,
                        "POSTINGDATE": "01.04.2025",
                        "MATERIAL": P236FINISHEDGOODTRANFERHSVAR.MATERIAL,
                        "QUANTITY":
                            (ConverstStr(P236FINISHEDGOODTRANFERHSVAR.NOGOOD)),
                        "UNIT": P236FINISHEDGOODTRANFERHSVAR.UOM,
                        "QUANTITYSTATUS": "NG"
                      };

                      Dio()
                          .post(
                        "${server2}10GETDATAFROMJOBBINGAQC/POSTTOSTORE",
                        data: dataset,
                      )
                          .then((v) {
                        print(v.data);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                    } else {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  });
                },
                child: Container(
                  width: 400,
                  height: 100,
                  color: Colors.blue,
                  child: Center(
                    child: Text("POST TO STORE"),
                  ),
                ),
              ),
            ),
          ] else ...[
            QrImageView(
              data: '1234567890',
              version: QrVersions.auto,
              size: 200.0,
            ),
            Text("QRCODE REMAIN")
          ]
        ],
      ),
    );
  }
}

// //P236FINISHEDGOODTRANFERHSgetsubclass