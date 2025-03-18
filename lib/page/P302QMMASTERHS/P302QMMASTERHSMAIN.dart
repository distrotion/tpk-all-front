// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';

import '../../bloc/BlocEvent/P302-01-P302QMMASTERHSget.dart';
import '../../bloc/BlocEvent/P302-02-P302QMMASTERHSgetINSP_SPEC.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/ComInputTextTan.dart';
import '../../widget/common/Safty.dart';
import '../../widget/common/popup.dart';
import '../../widget/newtable/INSP_SPECtable.dart';
import '../../widget/newtable/QMMAASTERtable.dart';
import '../../widget/table/PROGRESSMAIN.dart';

import '../page202.dart';
import '../page204.dart';
import 'P302QMMASTERHSVAR.dart';

late BuildContext P302QMMASTERHSMAINcontext;
late BuildContext P302QMMASTERHSMAINcontextpop1;

class P302QMMASTERHSMAIN extends StatefulWidget {
  P302QMMASTERHSMAIN({
    super.key,
    this.data,
  });
  List<P302QMMASTERHSgetclass>? data;

  @override
  State<P302QMMASTERHSMAIN> createState() => _P302QMMASTERHSMAINState();
}

class _P302QMMASTERHSMAINState extends State<P302QMMASTERHSMAIN> {
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    // P302QMMASTERHSVAR.formattedDate = DateFormat('dd-MM-yy').format(now);
    P302QMMASTERHSVAR.day = DateFormat('dd').format(now);
    P302QMMASTERHSVAR.month = DateFormat('MM').format(now);
    P302QMMASTERHSVAR.year = DateFormat('yyyy').format(now);

    P302QMMASTERHSVAR.day_next = DateFormat('dd').format(now);
    P302QMMASTERHSVAR.month_next = DateFormat('MM').format(now);
    P302QMMASTERHSVAR.year_next = DateFormat('yyyy').format(now);

    // P302QMMASTERHSVAR.day_next = "05";
    // P302QMMASTERHSVAR.month_next = "04";
    // P302QMMASTERHSVAR.year_next = "2025";

    P302QMMASTERHSVAR.PLANT = QUERYDATASET.PLANT;
    P302QMMASTERHSVAR.LOT_ORI = QUERYDATASET.LOT_ORI;

    P302QMMASTERHSVAR.iscontrol = true;
    P302QMMASTERHSVAR.SEARCH = '';
    P302QMMASTERHSVAR.holding = 999;
    context.read<P302QMMASTERHSget_Bloc>().add(P302QMMASTERHSget_GET());
  }

  @override
  Widget build(BuildContext context) {
    P302QMMASTERHSMAINcontext = context;
    List<P302QMMASTERHSgetclass> _datain = widget.data ?? [];
    List<P302QMMASTERHSgetclass> _datasearch = [];

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
                        "Incoming Table",
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
                        P302QMMASTERHSVAR.day = day;
                        P302QMMASTERHSVAR.month = month;
                        P302QMMASTERHSVAR.year = year;

                        setState(() {});
                        context
                            .read<P302QMMASTERHSget_Bloc>()
                            .add(P302QMMASTERHSget_GET());
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
                          "วันที่ : ${P302QMMASTERHSVAR.day}-${P302QMMASTERHSVAR.month}-${P302QMMASTERHSVAR.year}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
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
                        P302QMMASTERHSVAR.day_next = day;
                        P302QMMASTERHSVAR.month_next = month;
                        P302QMMASTERHSVAR.year_next = year;

                        setState(() {});
                        context
                            .read<P302QMMASTERHSget_Bloc>()
                            .add(P302QMMASTERHSget_GET());
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
                          "ถึงวันที่ : ${P302QMMASTERHSVAR.day_next}-${P302QMMASTERHSVAR.month_next}-${P302QMMASTERHSVAR.year_next}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  QMMAASTERtable(),
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
                                  P302QMMASTERHSVAR.pagepop = 0;
                                  P302QMMASTERHSVAR.INSP_LOTset =
                                      _datain[i].INSP_LOT;
                                  P302QMMASTERHSVAR.TO_UR = _datain[i].INSP_QTY;
                                  P302QMMASTERHSVAR.TO_ALL =
                                      _datain[i].INSP_QTY;
                                  P302QMMASTERHSVAR.TO_BL = "";
                                  P302QMMASTERHSVAR.INSP_SPECdata = [];
                                  P302QMMASTERHSVAR.SELECTED_SETdata = [];
                                  P302QMMASTERHSVAR.UDCODEdata = [];

                                  _QMI003POP(context);
                                },
                                onHover: (v) {
                                  //
                                  // print(v.toString() + ":" + i.toString());
                                  setState(() {
                                    P302QMMASTERHSVAR.holding = i;
                                  });
                                },
                                child: QMMAASTERitem(
                                  holding: P302QMMASTERHSVAR.holding == i,
                                  text01: _datain[i].MATERIAL,
                                  text02: _datain[i].CUST_NAME1,
                                  text03: _datain[i].MAT_DESC,
                                  text04: _datain[i].OLD_MAT,
                                  text05: _datain[i].BATCH,
                                  text06: _datain[i].INSP_LOT,
                                  text07: _datain[i].INSP_QTY +
                                      ' ' +
                                      _datain[i].INSP_UOM,
                                  text08: _datain[i].INSP_LOT_STATUS,
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

void _QMI003POP(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: QMI003POPBloc(),
      );
    },
  );
}

class QMI003POPBloc extends StatelessWidget {
  QMI003POPBloc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P302QMMASTERHSgetINSP_SPEC_Bloc(),
        child: BlocBuilder<P302QMMASTERHSgetINSP_SPEC_Bloc,
            P302QMMASTERHSgetINSP_SPECclassSET>(
          builder: (context, data) {
            return NEWNEWREQUEST(
              datain: data,
            );
          },
        ));
  }
}

class NEWNEWREQUEST extends StatefulWidget {
  NEWNEWREQUEST({
    super.key,
    this.datain,
  });
  P302QMMASTERHSgetINSP_SPECclassSET? datain;
  @override
  State<NEWNEWREQUEST> createState() => _NEWNEWREQUESTState();
}

class _NEWNEWREQUESTState extends State<NEWNEWREQUEST> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<P302QMMASTERHSgetINSP_SPEC_Bloc>()
        .add(P302QMMASTERHSgetINSP_SPEC_GET());
  }

  @override
  Widget build(BuildContext context) {
    P302QMMASTERHSMAINcontextpop1 = context;
    P302QMMASTERHSgetINSP_SPECclassSET _datain = widget.datain ??
        P302QMMASTERHSgetINSP_SPECclassSET(
          INSP_SPEC: [],
          SELECTED_SET: [],
          UDCODE: [],
        );

//INSP_LOT
    if (P302QMMASTERHSVAR.INSP_SPECdata.length == 0) {
      for (var i = 0; i < _datain.INSP_SPEC.length; i++) {
        //
        if (P302QMMASTERHSVAR.INSP_LOTset == _datain.INSP_SPEC[i].INSP_LOT) {
          P302QMMASTERHSVAR.INSP_SPECdata.add(PINSP_SPECHSclass(
            INSP_LOT: _datain.INSP_SPEC[i].INSP_LOT,
            NODE: _datain.INSP_SPEC[i].NODE,
            INSP_CHAR: _datain.INSP_SPEC[i].INSP_CHAR,
            INSP_STATUS: _datain.INSP_SPEC[i].INSP_STATUS,
            CONTROL_IND: _datain.INSP_SPEC[i].CONTROL_IND,
            CHAR_TYPE: _datain.INSP_SPEC[i].CHAR_TYPE,
            REC_TYPE: _datain.INSP_SPEC[i].REC_TYPE,
            MIC_PLANT: _datain.INSP_SPEC[i].MIC_PLANT,
            MIC: _datain.INSP_SPEC[i].MIC,
            MIC_VERSION: _datain.INSP_SPEC[i].MIC_VERSION,
            MIC_SHORTTEXT: _datain.INSP_SPEC[i].MIC_SHORTTEXT,
            METHOD_PLANT: _datain.INSP_SPEC[i].METHOD_PLANT,
            METHOD: _datain.INSP_SPEC[i].METHOD,
            METHOD_VERSION: _datain.INSP_SPEC[i].METHOD_VERSION,
            SELECTEDSET_IND: _datain.INSP_SPEC[i].SELECTEDSET_IND,
            CATALOGTYPE: _datain.INSP_SPEC[i].CATALOGTYPE,
            SLECTEDSET: _datain.INSP_SPEC[i].SLECTEDSET,
            SELECTEDSET_PLANT: _datain.INSP_SPEC[i].SELECTEDSET_PLANT,
            DECIMAL: _datain.INSP_SPEC[i].DECIMAL,
            UOM: _datain.INSP_SPEC[i].UOM,
            UPPER: _datain.INSP_SPEC[i].UPPER,
            UPPER_IND: _datain.INSP_SPEC[i].UPPER_IND,
            LOWER: _datain.INSP_SPEC[i].LOWER,
            LOWER_IND: _datain.INSP_SPEC[i].LOWER_IND,
            STUPPER: _datain.INSP_SPEC[i].STUPPER,
            STUPPER_IND: _datain.INSP_SPEC[i].STUPPER_IND,
            STLOWER: _datain.INSP_SPEC[i].STLOWER,
            STLOWER_IND: _datain.INSP_SPEC[i].STLOWER_IND,
          ));
        }
      }
    }
    return Container(
      height: 500,
      width: 800,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                child: Center(
                  child: Text("Quality control management"),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              if (P302QMMASTERHSVAR.pagepop == 0) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        child: Center(
                          child: Text("INSP_SPEC"),
                        ),
                      ),
                      INSP_SPECtable(),
                      // if (_datasearch
                      //     .any((item) => item.PLANT == 'noxrust'))
                      SingleChildScrollView(
                        child: Container(
                          // width: 1100,
                          child: Column(
                            children: [
                              for (int i = 0;
                                  i < P302QMMASTERHSVAR.INSP_SPECdata.length;
                                  i++) ...[
                                // for (int i = 0; i < 10; i++) ...[
                                InkWell(
                                  onTap: () {
                                    //
                                    P302QMMASTERHSVAR.SELECTED_SETdata = [];
                                    // P302QMMASTERHSVAR.SELECTEDSETsetAC =
                                    //     P302QMMASTERHSVAR
                                    //         .INSP_SPECdata[i].SLECTEDSET;
                                    // P302QMMASTERHSVAR.iSELECTEDSETset =
                                    //     _datain.SELECTED_SET[i];
                                    P302QMMASTERHSVAR.SELECTEDSETset =
                                        P302QMMASTERHSVAR
                                            .INSP_SPECdata[i].SLECTEDSET;
                                    // print(
                                    //     '--->' + P302QMMASTERHSVAR.SELECTEDSETset);
                                    for (var i = 0;
                                        i < _datain.SELECTED_SET.length;
                                        i++) {
                                      if (_datain.SELECTED_SET[i].SELECTEDSET ==
                                          P302QMMASTERHSVAR.SELECTEDSETset) {
                                        //     //
                                        print(_datain
                                            .SELECTED_SET[i].SELECTEDSET);
                                        P302QMMASTERHSVAR.SELECTED_SETdata.add(
                                            SELECTED_SETHSclass(
                                          CATALOGTYPE: _datain
                                              .SELECTED_SET[i].CATALOGTYPE,
                                          SELECTEDSET_PLANT: _datain
                                              .SELECTED_SET[i]
                                              .SELECTEDSET_PLANT,
                                          SELECTEDSET: _datain
                                              .SELECTED_SET[i].SELECTEDSET,
                                          SELECTEDSET_DESC: _datain
                                              .SELECTED_SET[i].SELECTEDSET_DESC,
                                          CODEGROUP:
                                              _datain.SELECTED_SET[i].CODEGROUP,
                                          CODE: _datain.SELECTED_SET[i].CODE,
                                          CODE_TEXT:
                                              _datain.SELECTED_SET[i].CODE_TEXT,
                                          VALUATION:
                                              _datain.SELECTED_SET[i].VALUATION,
                                        ));
                                      }
                                      // print(_datain.SELECTED_SET[i].SELECTEDSET);
                                    }
                                    //SLECTEDSET
                                    if (P302QMMASTERHSVAR.SELECTEDSETset !=
                                        '') {
                                      P302QMMASTERHSVAR.pagepopapp = 0;
                                    } else {
                                      P302QMMASTERHSVAR.pagepopapp = 1;
                                    }
                                    P302QMMASTERHSVAR.DATASUM = '';
                                    P302QMMASTERHSVAR.iDATA = i;
                                    P302QMMASTERHSVAR.iINSP_SPECdata =
                                        P302QMMASTERHSVAR.INSP_SPECdata[i];
                                    _QMI003POPapp(context);
                                  },
                                  onHover: (v) {
                                    //
                                    // print(v.toString() + ":" + i.toString());
                                  },
                                  child: INSP_SPECitem(
                                    text01: P302QMMASTERHSVAR
                                        .INSP_SPECdata[i].MIC_SHORTTEXT,
                                    text02: P302QMMASTERHSVAR
                                        .INSP_SPECdata[i].REC_TYPE,
                                    text03:
                                        P302QMMASTERHSVAR.INSP_SPECdata[i].MIC,
                                    text04: P302QMMASTERHSVAR
                                            .INSP_SPECdata[i].DATASUM +
                                        P302QMMASTERHSVAR
                                            .INSP_SPECdata[i].DATAAP_TEXT,
                                    text05: P302QMMASTERHSVAR
                                            .INSP_SPECdata[i].DATASUM_TEXT +
                                        P302QMMASTERHSVAR
                                            .INSP_SPECdata[i].DATAAP,
                                    text06: P302QMMASTERHSVAR
                                        .INSP_SPECdata[i].STATUS,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    P302QMMASTERHSVAR.EVASET = 'OK';
                    //
                    // print("------------------>");
                    List<Map<String, dynamic>> databuff = [];
                    List<Map<String, dynamic>> databuff2 = [];

                    for (var i = 0;
                        i < P302QMMASTERHSVAR.INSP_SPECdata.length;
                        // i < 2;
                        i++) {
                      //
                      if (P302QMMASTERHSVAR.INSP_SPECdata[i].DATASUM == '') {
                        databuff.add({
                          "INSP_LOT": P302QMMASTERHSVAR.INSP_LOTset,
                          "INSPOPER": "10", //
                          "INSPCHAR":
                              P302QMMASTERHSVAR.INSP_SPECdata[i].INSP_CHAR,
                          "INSPSAMPLE": "000001",
                          "CLOSED": "X", //
                          "EVALUATED": "X", //
                          "EVALUATION": P302QMMASTERHSVAR
                              .INSP_SPECdata[i].VALUATION, // A,R
                          "MEAN_VALUE": '', // "",12.123
                          "REMARK": "-",
                          "CODE1": P302QMMASTERHSVAR.INSP_SPECdata[i].DATAAP,
                          "CODE_GRP1": P302QMMASTERHSVAR.INSP_SPECdata[i].CODEG,
                          "ORIGINAL_INPUT": ""
                        });
                        // print(P302QMMASTERHSVAR.INSP_SPECdata[i].VALUATION);
                        if (P302QMMASTERHSVAR.INSP_SPECdata[i].VALUATION !=
                            'A') {
                          P302QMMASTERHSVAR.EVASET = 'NOK';
                        }
                      } else {
                        databuff.add({
                          "INSP_LOT": P302QMMASTERHSVAR.INSP_LOTset,
                          "INSPOPER": "10", //
                          "INSPCHAR":
                              P302QMMASTERHSVAR.INSP_SPECdata[i].INSP_CHAR,
                          "INSPSAMPLE": "000001",
                          "CLOSED": "X", //
                          "EVALUATED": "X", //
                          "EVALUATION": 'A', // A,R
                          "MEAN_VALUE":
                              P302QMMASTERHSVAR.INSP_SPECdata[i].DATASUM, //
                          "REMARK": "-",
                          "CODE1": "",
                          "CODE_GRP1": "",
                          "ORIGINAL_INPUT": ""
                        });
                        // if(P302QMMASTERHSVAR.INSP_SPECdata[i].){

                        databuff2.add({
                          "INSPLOT": P302QMMASTERHSVAR.INSP_LOTset,
                          "INSPOPER": "10",
                          "INSPCHAR":
                              P302QMMASTERHSVAR.INSP_SPECdata[i].INSP_CHAR,
                          "INSPSAMPLE": "000001",
                          "RES_NO": "0001",
                          "RES_VALUE":
                              P302QMMASTERHSVAR.INSP_SPECdata[i].DATASUM,
                          "REMARK": "",
                          "CODE1": " ",
                          "CODE_GRP1": " ",
                          "ORIGINAL_INPUT": " "
                        });
                        //  }
                      }
                    }

                    //     {
//             "INSPLOT": "50000000224",
//             "INSPOPER": "0010",
//             "INSPCHAR": "0020",
//             "INSPSAMPLE": "000001",
//             "RES_NO": "0001",
//             "RES_VALUE": "14.8",
//             "REMARK": "POINT A ",
//             "CODE1": " ",
//             "CODE_GRP1": " ",
//             "ORIGINAL_INPUT": " "
//     },

                    Map<String, dynamic> output = {
                      "INSPLOT": P302QMMASTERHSVAR.INSP_LOTset,
                      "INSPOPER": "10",
                      "INSPPOINT": "000001",
                      "USERC1": "-",
                      "CAT_TYPE": "3",
                      "PSEL_SET": "2100",
                      "SEL_SET": "UD-POINT",
                      "CODE_GRP": "UDCODE",
                      "CODE": "A2", // A2 , R3
                      "T_SAMPLE_RESULTS": databuff,
                      "T_SINGLE_RESULTS": databuff2,
                    };
                    // print(output);
                    await Dio()
                        .post(
                      "${server2}QMINCOMING/SETVALUE",
                      data: output,
                    )
                        .then((v) {
                      //
                      print(v.data);
                      P302QMMASTERHSVAR.pagepop = 1;
                      setState(() {});
                    });

                    // print(output);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      height: 60,
                      color: Colors.blue,
                      child: Center(
                        child: Text("SAVE"),
                      ),
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     //
                //     P302QMMASTERHSVAR.pagepop = 1;
                //     setState(() {});
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Container(
                //       width: 200,
                //       height: 60,
                //       color: Colors.blue,
                //       child: Center(
                //         child: Text("Used Decision"),
                //       ),
                //     ),
                //   ),
                // ),
              ] else if (P302QMMASTERHSVAR.pagepop == 1) ...[
                //
                SingleChildScrollView(
                  child: Container(
                    // width: 1100,
                    height: 500,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ComInputText(
                                isEnabled: false,
                                height: 40,
                                width: 300,
                                isContr: P302QMMASTERHSVAR.iscontrol,
                                fnContr: (input) {
                                  setState(() {
                                    P302QMMASTERHSVAR.iscontrol = input;
                                  });
                                },
                                sValue: P302QMMASTERHSVAR.TO_ALL,
                                returnfunc: (String s) {
                                  P302QMMASTERHSVAR.TO_ALL = s;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ComInputText(
                                sLabel: "GOOD",
                                height: 40,
                                width: 300,
                                isContr: P302QMMASTERHSVAR.iscontrol,
                                fnContr: (input) {
                                  setState(() {
                                    P302QMMASTERHSVAR.iscontrol = input;
                                  });
                                },
                                sValue: P302QMMASTERHSVAR.TO_UR,
                                returnfunc: (String s) {
                                  P302QMMASTERHSVAR.TO_UR = s;
                                  setState(() {});
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ComInputText(
                                sLabel: "NO GOOD",
                                height: 40,
                                width: 300,
                                isContr: P302QMMASTERHSVAR.iscontrol,
                                fnContr: (input) {
                                  setState(() {
                                    P302QMMASTERHSVAR.iscontrol = input;
                                  });
                                },
                                sValue: P302QMMASTERHSVAR.TO_BL,
                                returnfunc: (String s) {
                                  P302QMMASTERHSVAR.TO_BL = s;
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            for (int i = 0; i < _datain.UDCODE.length; i++) ...[
                              if (_datain.UDCODE[i].CODE == 'A1' &&
                                  int.parse(ConverstStr(
                                          P302QMMASTERHSVAR.TO_ALL)) ==
                                      int.parse(ConverstStr(
                                          P302QMMASTERHSVAR.TO_UR)) &&
                                  (P302QMMASTERHSVAR.EVASET == 'OK')) ...[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      if (int.parse(ConverstStr(
                                              P302QMMASTERHSVAR.TO_ALL)) ==
                                          (int.parse(ConverstStr(
                                                  P302QMMASTERHSVAR.TO_UR))) +
                                              (int.parse(ConverstStr(
                                                  P302QMMASTERHSVAR.TO_BL)))) {
                                        Map<String, String> output = {
                                          "INSPLOT":
                                              P302QMMASTERHSVAR.INSP_LOTset,
                                          "UD_SELECTED_SET": "",
                                          "UD_PLANT": "",
                                          "UD_CODE_GROUP":
                                              _datain.UDCODE[i].CODEGROUP,
                                          "UD_CODE": _datain.UDCODE[i].CODE,
                                          "TO_UR": P302QMMASTERHSVAR.TO_UR,
                                          "TO_BLOCKED": P302QMMASTERHSVAR.TO_BL,
                                          "TO_RETURN": ""
                                        };

                                        Dio()
                                            .post(
                                          "${server2}QMINCOMING/UDSAVE",
                                          data: output,
                                        )
                                            .then((v) {
                                          Navigator.pop(context);
                                          P302QMMASTERHSMAINcontext.read<
                                                  P302QMMASTERHSget_Bloc>()
                                              .add(P302QMMASTERHSget_GET());
                                          //
                                          print(v.data);
                                        });
                                      } else {
                                        //
                                        WORNINGpop(context,
                                            ["", "QTY is not same"], 120, 200);
                                      }
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 400,
                                      color: Colors.green,
                                      child: Center(
                                        child: Text(
                                          _datain.UDCODE[i].CODE_TEXT,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              if (_datain.UDCODE[i].CODE == 'A4' &&
                                  int.parse(ConverstStr(
                                          P302QMMASTERHSVAR.TO_ALL)) ==
                                      int.parse(ConverstStr(
                                          P302QMMASTERHSVAR.TO_UR)) &&
                                  (P302QMMASTERHSVAR.EVASET == 'NOK')) ...[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 80,
                                    width: 350,
                                    // color: Colors.yellow,
                                    child: Center(
                                      child: Text(
                                        'Attach "HOLD PRODUCT TAG" \nand Contact customer',
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.yellow,
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      if (int.parse(ConverstStr(
                                              P302QMMASTERHSVAR.TO_ALL)) ==
                                          (int.parse(ConverstStr(
                                                  P302QMMASTERHSVAR.TO_UR))) +
                                              (int.parse(ConverstStr(
                                                  P302QMMASTERHSVAR.TO_BL)))) {
                                        Map<String, String> output = {
                                          "INSPLOT":
                                              P302QMMASTERHSVAR.INSP_LOTset,
                                          "UD_SELECTED_SET": "",
                                          "UD_PLANT": "",
                                          "UD_CODE_GROUP":
                                              _datain.UDCODE[i].CODEGROUP,
                                          "UD_CODE": _datain.UDCODE[i].CODE,
                                          "TO_UR": P302QMMASTERHSVAR.TO_UR,
                                          "TO_BLOCKED": P302QMMASTERHSVAR.TO_BL,
                                          "TO_RETURN": ""
                                        };

                                        Dio()
                                            .post(
                                          "${server2}QMINCOMING/UDSAVE",
                                          data: output,
                                        )
                                            .then((v) {
                                          Navigator.pop(context);
                                          P302QMMASTERHSMAINcontext.read<
                                                  P302QMMASTERHSget_Bloc>()
                                              .add(P302QMMASTERHSget_GET());
                                          //
                                          print(v.data);
                                        });
                                      } else {
                                        //
                                        WORNINGpop(context,
                                            ["", "QTY is not same"], 120, 200);
                                      }
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 400,
                                      color: Colors.blue,
                                      child: Center(
                                        child: Text(
                                          _datain.UDCODE[i].CODE_TEXT,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              if (_datain.UDCODE[i].CODE == 'A6' &&
                                  int.parse(ConverstStr(
                                          P302QMMASTERHSVAR.TO_ALL)) !=
                                      int.parse(ConverstStr(
                                          P302QMMASTERHSVAR.TO_UR)) &&
                                  (int.parse(ConverstStr(
                                          P302QMMASTERHSVAR.TO_ALL)) !=
                                      int.parse(ConverstStr(
                                          P302QMMASTERHSVAR.TO_BL)))) ...[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 80,
                                    width: 350,
                                    // color: Colors.yellow,
                                    child: Center(
                                      child: Text(
                                          'Attach "HOLD PRODUCT TAG" \nand Contact customer'),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.yellow,
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      if (int.parse(ConverstStr(
                                              P302QMMASTERHSVAR.TO_ALL)) ==
                                          (int.parse(ConverstStr(
                                                  P302QMMASTERHSVAR.TO_UR))) +
                                              (int.parse(ConverstStr(
                                                  P302QMMASTERHSVAR.TO_BL)))) {
                                        Map<String, String> output = {
                                          "INSPLOT":
                                              P302QMMASTERHSVAR.INSP_LOTset,
                                          "UD_SELECTED_SET": "",
                                          "UD_PLANT": "",
                                          "UD_CODE_GROUP":
                                              _datain.UDCODE[i].CODEGROUP,
                                          "UD_CODE": _datain.UDCODE[i].CODE,
                                          "TO_UR": P302QMMASTERHSVAR.TO_UR,
                                          "TO_BLOCKED": P302QMMASTERHSVAR.TO_BL,
                                          "TO_RETURN": ""
                                        };

                                        Dio()
                                            .post(
                                          "${server2}QMINCOMING/UDSAVE",
                                          data: output,
                                        )
                                            .then((v) {
                                          Navigator.pop(context);
                                          P302QMMASTERHSMAINcontext.read<
                                                  P302QMMASTERHSget_Bloc>()
                                              .add(P302QMMASTERHSget_GET());
                                          //
                                          print(v.data);
                                        });
                                      } else {
                                        //
                                        WORNINGpop(context,
                                            ["", "QTY is not same"], 120, 200);
                                      }
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 400,
                                      color: Colors.green.shade400,
                                      child: Center(
                                        child: Text(
                                          _datain.UDCODE[i].CODE_TEXT,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              if (_datain.UDCODE[i].CODE == 'R1' &&
                                  int.parse(ConverstStr(
                                          P302QMMASTERHSVAR.TO_ALL)) ==
                                      int.parse(ConverstStr(
                                          P302QMMASTERHSVAR.TO_BL))) ...[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 80,
                                    width: 350,
                                    // color: Colors.yellow,
                                    child: Center(
                                      child: Text(
                                          'Contact Store to return all parts to customer'),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.orange,
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      if (int.parse(ConverstStr(
                                              P302QMMASTERHSVAR.TO_ALL)) ==
                                          (int.parse(ConverstStr(
                                                  P302QMMASTERHSVAR.TO_UR))) +
                                              (int.parse(ConverstStr(
                                                  P302QMMASTERHSVAR.TO_BL)))) {
                                        Map<String, String> output = {
                                          "INSPLOT":
                                              P302QMMASTERHSVAR.INSP_LOTset,
                                          "UD_SELECTED_SET": "",
                                          "UD_PLANT": "",
                                          "UD_CODE_GROUP":
                                              _datain.UDCODE[i].CODEGROUP,
                                          "UD_CODE": _datain.UDCODE[i].CODE,
                                          "TO_UR": P302QMMASTERHSVAR.TO_UR,
                                          "TO_BLOCKED": P302QMMASTERHSVAR.TO_BL,
                                          "TO_RETURN": ""
                                        };

                                        Dio()
                                            .post(
                                          "${server2}QMINCOMING/UDSAVE",
                                          data: output,
                                        )
                                            .then((v) {
                                          Navigator.pop(context);
                                          P302QMMASTERHSMAINcontext.read<
                                                  P302QMMASTERHSget_Bloc>()
                                              .add(P302QMMASTERHSget_GET());
                                          //
                                          print(v.data);
                                        });
                                      } else {
                                        //
                                        WORNINGpop(context,
                                            ["", "QTY is not same"], 120, 200);
                                      }
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 400,
                                      color: Colors.red,
                                      child: Center(
                                        child: Text(
                                          _datain.UDCODE[i].CODE_TEXT,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              //   if (_datain.UDCODE[i].CODE == 'R99' &&
                              //       (int.parse(ConverstStr(
                              //               P302QMMASTERHSVAR.TO_ALL)) ==
                              //           int.parse(ConverstStr(
                              //               P302QMMASTERHSVAR.TO_BL)))) ...[
                              //     Padding(
                              //       padding: const EdgeInsets.all(8.0),
                              //       child: InkWell(
                              //         onTap: () {
                              //           // if (int.parse(ConverstStr(
                              //           //         P302QMMASTERHSVAR.TO_ALL)) ==
                              //           //     (int.parse(ConverstStr(
                              //           //             P302QMMASTERHSVAR.TO_UR))) +
                              //           //         (int.parse(ConverstStr(
                              //           //             P302QMMASTERHSVAR.TO_BL)))) {
                              //           //   Map<String, String> output = {
                              //           //     "INSPLOT":
                              //           //         P302QMMASTERHSVAR.INSP_LOTset,
                              //           //     "UD_SELECTED_SET": "",
                              //           //     "UD_PLANT": "",
                              //           //     "UD_CODE_GROUP":
                              //           //         _datain.UDCODE[i].CODEGROUP,
                              //           //     "UD_CODE": _datain.UDCODE[i].CODE,
                              //           //     "TO_UR": P302QMMASTERHSVAR.TO_UR,
                              //           //     "TO_BLOCKED": P302QMMASTERHSVAR.TO_BL,
                              //           //     "TO_RETURN": ""
                              //           //   };

                              //           //   Dio()
                              //           //       .post(
                              //           //     "${server2}QMINCOMING/UDSAVE",
                              //           //     data: output,
                              //           //   )
                              //           //       .then((v) {
                              //           Navigator.pop(context);
                              //           P302QMMASTERHSMAINcontext.read<
                              //                   P302QMMASTERHSget_Bloc>()
                              //               .add(P302QMMASTERHSget_GET());
                              //           //     //
                              //           //     print(v.data);
                              //           //   });
                              //           // } else {
                              //           //   //
                              //           //   WORNINGpop(context,
                              //           //       ["", "QTY is not same"], 120, 200);
                              //           // }
                              //         },
                              //         child: Container(
                              //           height: 80,
                              //           width: 400,
                              //           color: Colors.orange,
                              //           child: Center(
                              //             child: Text(
                              //               _datain.UDCODE[i].CODE_TEXT,
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                            ]
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                //

                InkWell(
                  onTap: () {
                    //
                    P302QMMASTERHSVAR.pagepop = 0;
                    setState(() {});
                  },
                  child: Container(
                    width: 200,
                    height: 60,
                    color: Colors.blue,
                    child: Center(
                      child: Text("INSP_SPEC"),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

void _QMI003POPapp(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: QMI003POPapp(),
      );
    },
  );
}

class QMI003POPapp extends StatefulWidget {
  const QMI003POPapp({super.key});

  @override
  State<QMI003POPapp> createState() => _QMI003POPappState();
}

class _QMI003POPappState extends State<QMI003POPapp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 600,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const SizedBox(
              child: Center(
                child: Text("Selected set"),
              ),
            ),
            if (P302QMMASTERHSVAR.pagepopapp == 0) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      child: Center(
                        child: Text("Appearance"),
                      ),
                    ),

                    // if (_datasearch
                    //     .any((item) => item.PLANT == 'noxrust'))
                    SingleChildScrollView(
                      child: Container(
                        // width: 1100,
                        child: Column(
                          children: [
                            for (int i = 0;
                                i < P302QMMASTERHSVAR.SELECTED_SETdata.length;
                                i++) ...[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    //

                                    P302QMMASTERHSVAR
                                            .INSP_SPECdata[P302QMMASTERHSVAR.iDATA]
                                            .DATAAP =
                                        P302QMMASTERHSVAR
                                            .SELECTED_SETdata[i].CODE;
                                    P302QMMASTERHSVAR
                                            .INSP_SPECdata[P302QMMASTERHSVAR.iDATA]
                                            .DATAAP_TEXT =
                                        P302QMMASTERHSVAR
                                            .SELECTED_SETdata[i].CODE_TEXT;

                                    P302QMMASTERHSVAR
                                            .INSP_SPECdata[P302QMMASTERHSVAR.iDATA]
                                            .CODEG =
                                        P302QMMASTERHSVAR
                                            .SELECTED_SETdata[i].CODEGROUP;

                                    P302QMMASTERHSVAR
                                            .INSP_SPECdata[P302QMMASTERHSVAR.iDATA]
                                            .VALUATION =
                                        P302QMMASTERHSVAR
                                            .SELECTED_SETdata[i].VALUATION;

                                    P302QMMASTERHSMAINcontextpop1.read<
                                            P302QMMASTERHSgetINSP_SPEC_Bloc>()
                                        .add(P302QMMASTERHSgetINSP_SPEC_GET());

                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 200,
                                    color: P302QMMASTERHSVAR.SELECTED_SETdata[i]
                                                .VALUATION ==
                                            'A'
                                        ? Colors.green
                                        : Colors.red,
                                    child: Center(
                                      child: Text(
                                        P302QMMASTERHSVAR
                                            .SELECTED_SETdata[i].CODE_TEXT,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ] else if (P302QMMASTERHSVAR.pagepopapp == 1) ...[
              //
              const SizedBox(
                child: Center(
                  child: Text("DATA"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ComInputText(
                  height: 40,
                  width: 300,
                  isContr: P302QMMASTERHSVAR.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      P302QMMASTERHSVAR.iscontrol = input;
                    });
                  },
                  sValue: P302QMMASTERHSVAR.DATASUM,
                  returnfunc: (String s) {
                    P302QMMASTERHSVAR.DATASUM = s;
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  //
                  // P302QMMASTERHSVAR.pagepop = 1;
                  // setState(() {});
                  P302QMMASTERHSVAR.INSP_SPECdata[P302QMMASTERHSVAR.iDATA]
                      .DATASUM = P302QMMASTERHSVAR.DATASUM;
                  P302QMMASTERHSVAR.INSP_SPECdata[P302QMMASTERHSVAR.iDATA]
                      .DATASUM_TEXT = "VALUE";

                  P302QMMASTERHSMAINcontextpop1.read<
                          P302QMMASTERHSgetINSP_SPEC_Bloc>()
                      .add(P302QMMASTERHSgetINSP_SPEC_GET());
                  Navigator.pop(context);
                  // P302QMMASTERHSVAR.INSP_SPECdata[ P302QMMASTERHSVAR.iDATA ].DATAAP_TEXT
                },
                child: Container(
                  width: 200,
                  height: 40,
                  color: Colors.blue,
                  child: Center(
                    child: Text("save"),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
