// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';

import '../../bloc/BlocEvent/P402-01-P402UDGRget.dart';
import '../../bloc/BlocEvent/P402-02-P402UDGRINSP_SPEC.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/ComInputTextTan.dart';
import '../../widget/common/ErrorPopup.dart';
import '../../widget/common/Error_NO_Popup.dart';
import '../../widget/common/Safty.dart';
import '../../widget/common/popup.dart';
import '../../widget/newtable/INSP_SPECtable.dart';
import '../../widget/newtable/UDGRTABLE.dart';

import '../../widget/table/PROGRESSMAIN.dart';

import '../page202.dart';
import '../page204.dart';
import 'P402UDGRVAR.dart';

late BuildContext P402UDGRMAINcontext;
late BuildContext P402UDGRMAINcontextpop1;

class P402UDGRMAIN extends StatefulWidget {
  P402UDGRMAIN({
    super.key,
    this.data,
  });
  List<P402UDGRgetclass>? data;

  @override
  State<P402UDGRMAIN> createState() => _P402UDGRMAINState();
}

class _P402UDGRMAINState extends State<P402UDGRMAIN> {
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    var nowback = DateTime.now().subtract(const Duration(days: 3));
    // var nownow = DateTime.now().subtract(const Duration(days: 0));
    // P402UDGRVAR.formattedDate = DateFormat('dd-MM-yy').format(now);

    // P402UDGRVAR.dayback = DateFormat('dd').format(now);
    // P402UDGRVAR.monthback = DateFormat('MM').format(now);
    // P402UDGRVAR.yearback = DateFormat('yyyy').format(now);

    // P402UDGRVAR.daynow = DateFormat('dd').format(now);
    // P402UDGRVAR.monthnow = DateFormat('MM').format(now);
    // P402UDGRVAR.yearnow = DateFormat('yyyy').format(now);

    P402UDGRVAR.day = DateFormat('dd').format(nowback);
    P402UDGRVAR.month = DateFormat('MM').format(nowback);
    P402UDGRVAR.year = DateFormat('yyyy').format(nowback);

    P402UDGRVAR.day_next = DateFormat('dd').format(now);
    P402UDGRVAR.month_next = DateFormat('MM').format(now);
    P402UDGRVAR.year_next = DateFormat('yyyy').format(now);

    // P402UDGRVAR.day_next = "05";
    // P402UDGRVAR.month_next = "04";
    // P402UDGRVAR.year_next = "2025";

    P402UDGRVAR.PLANT = QUERYDATASET.PLANT;
    P402UDGRVAR.LOT_ORI = QUERYDATASET.LOT_ORI;

    P402UDGRVAR.iscontrol = true;
    P402UDGRVAR.SEARCH = '';
    P402UDGRVAR.holding = 999;
    context.read<P402UDGRget_Bloc>().add(P402UDGRget_GET());
  }

  @override
  Widget build(BuildContext context) {
    P402UDGRMAINcontext = context;
    List<P402UDGRgetclass> _datain = widget.data ?? [];
    List<P402UDGRgetclass> _datasearch = [];

    // List<P402UDGRgetclass> _data_exp = [];

    // for (int i = 0; i < _datain.length; i++) {
    //   if (_datain[i].PROCESS_ORDER.contains(P402UDGRVAR.SEARCH) ||
    //       _datain[i].MATERIAL.contains(P402UDGRVAR.SEARCH) ||
    //       _datain[i].MAT_DESC.contains(P402UDGRVAR.SEARCH) ||
    //       _datain[i].OLD_MAT.contains(P402UDGRVAR.SEARCH) ||
    //       _datain[i].BATCH.contains(P402UDGRVAR.SEARCH)) {
    //     _data_exp.add(_datain[i]);
    //   }
    // }
    if (P402UDGRVAR.FILTER == 'ALL') {
      _datasearch = _datain;
    } else if (P402UDGRVAR.FILTER == 'NOUD') {
      // _datasearch = _datain;
      for (var i = 0; i < _datain.length; i++) {
        if (_datain[i].INSP_LOT_STATUS.contains("UD") == false) {
          _datasearch.add(_datain[i]);
        }
      }
    } else {
      for (var i = 0; i < _datain.length; i++) {
        if (_datain[i].INSP_LOT_STATUS.contains("UD") == true) {
          _datasearch.add(_datain[i]);
        }
      }
    }

    List<P402UDGRgetclass> _data_exp = [];

    for (int i = 0; i < _datasearch.length; i++) {
      if (_datasearch[i].PROCESS_ORDER.contains(P402UDGRVAR.SEARCH) ||
          _datasearch[i].MATERIAL.contains(P402UDGRVAR.SEARCH) ||
          _datasearch[i].MAT_DESC.contains(P402UDGRVAR.SEARCH) ||
          _datasearch[i].OLD_MAT.contains(P402UDGRVAR.SEARCH) ||
          _datasearch[i].INSP_LOT_STATUS.contains(P402UDGRVAR.SEARCH) ||
          _datasearch[i].NOGOOD.contains(P402UDGRVAR.SEARCH) ||
          _datasearch[i].GOOD.contains(P402UDGRVAR.SEARCH) ||
          _datasearch[i].SAPSTATUS.contains(P402UDGRVAR.SEARCH) ||
          _datasearch[i].BATCH.contains(P402UDGRVAR.SEARCH)) {
        _data_exp.add(_datasearch[i]);
      }
    }

    print("----------->");

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
                        'Status check of QCFN/UD/AG',
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
                        "Status check of QCFN/UD/AG Table",
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
                        P402UDGRVAR.day = day;
                        P402UDGRVAR.month = month;
                        P402UDGRVAR.year = year;

                        setState(() {});
                        context.read<P402UDGRget_Bloc>().add(P402UDGRget_GET());
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
                          "วันที่ : ${P402UDGRVAR.day}-${P402UDGRVAR.month}-${P402UDGRVAR.year}",
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
                        P402UDGRVAR.day_next = day;
                        P402UDGRVAR.month_next = month;
                        P402UDGRVAR.year_next = year;

                        setState(() {});
                        context.read<P402UDGRget_Bloc>().add(P402UDGRget_GET());
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
                          "ถึงวันที่ : ${P402UDGRVAR.day_next}-${P402UDGRVAR.month_next}-${P402UDGRVAR.year_next}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    // width: 900,
                    decoration: BoxDecoration(
                      // color: Colors.blue.shade900,
                      border: Border(
                        top: BorderSide(),
                        left: BorderSide(),
                        right: BorderSide(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          children: [
                            ComInputText(
                              height: 40,
                              width: 500,
                              isContr: P402UDGRVAR.iscontrol,
                              fnContr: (input) {
                                setState(() {
                                  P402UDGRVAR.iscontrol = input;
                                });
                              },
                              sPlaceholder: "search",
                              sValue: P402UDGRVAR.SEARCH,
                              returnfunc: (String s) {
                                setState(() {
                                  P402UDGRVAR.SEARCH = s;
                                });
                              },
                            ),
                            SizedBox(
                              height: 64,
                              width: 100,
                              child: AdvanceDropDown(
                                imgpath: 'assets/icons/icon-down_4@3x.png',
                                listdropdown: const [
                                  MapEntry("UD", ""),
                                  MapEntry("NO UD", "NOUD"),
                                  MapEntry("ALL", "ALL")
                                ],
                                onChangeinside: (d, k) {
                                  setState(() {
                                    P402UDGRVAR.FILTER = d;
                                  });
                                },
                                value: P402UDGRVAR.FILTER,
                                height: 40,
                                width: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  UDGRTABLEtable(),
                  // if (_datasearch
                  //     .any((item) => item.PLANT == 'noxrust'))
                  SizedBox(
                    height: 500,
                    child: SingleChildScrollView(
                      child: Container(
                        // width: 1100,
                        child: Column(
                          children: [
                            for (int i = 0; i < _data_exp.length; i++) ...[
                              // for (int i = 0; i < 10; i++) ...[
                              InkWell(
                                onTap: () {
                                  //
                                  // if (_data_exp[i]
                                  //             .INSP_LOT_STATUS
                                  //             .contains("UD") ==
                                  //         false &&
                                  //     _data_exp[i]
                                  //             .INSP_LOT_STATUS
                                  //             .contains("CRTD") ==
                                  //         false) {
                                  P402UDGRVAR.pagepop = 0;
                                  P402UDGRVAR.INSP_LOTset =
                                      _data_exp[i].INSP_LOT;
                                  P402UDGRVAR.TO_UR = _data_exp[i].INSP_QTY;

                                  P402UDGRVAR.PROCESS_ORDERset =
                                      _data_exp[i].PROCESS_ORDER;

                                  P402UDGRVAR.TO_ALL = _data_exp[i].INSP_QTY;
                                  P402UDGRVAR.TO_BL = "";
                                  P402UDGRVAR.INSP_SPECdata = [];
                                  P402UDGRVAR.SELECTED_SETdata = [];
                                  P402UDGRVAR.UDCODEdata = [];

                                  P402UDGRVAR.page = 0;

                                  // _QMI003POP(context);
                                  _FORCEGR(context);
                                  // }
                                },
                                onHover: (v) {
                                  //
                                  // print(v.toString() + ":" + i.toString());
                                  setState(() {
                                    P402UDGRVAR.holding = i;
                                  });
                                },
                                child: UDGRTABLEitem(
                                  // holding: P402UDGRVAR.holding == i,
                                  text01: _data_exp[i].MATERIAL,
                                  text02: _data_exp[i].PROCESS_ORDER,
                                  text03: _data_exp[i].MAT_DESC,
                                  text04: _data_exp[i].OLD_MAT,
                                  text05: _data_exp[i].BATCH,
                                  text06: _data_exp[i].INSP_QTY +
                                      ' ' +
                                      _data_exp[i].INSP_UOM,
                                  text07: _data_exp[i].GOOD,
                                  text08: _data_exp[i].NOGOOD,
                                  text09:
                                      //  _data_exp[i].SAPSTATUS,
                                      (_data_exp[i].SAPSTATUS.contains("PCNF")
                                          ? "PCNF"
                                          : _data_exp[i]
                                                  .SAPSTATUS
                                                  .contains("CNF")
                                              ? "CNF"
                                              : ""),
                                  text10:
                                      (_data_exp[i].SAPSTATUS.contains("DLV")
                                          ? "DLV"
                                          : ""),
                                  text11: "",
                                  text12: _data_exp[i].INSP_LOT_STATUS,
                                  text13: "",
                                  Colorsstatus: (_data_exp[i]
                                                  .SAPSTATUS
                                                  .contains("DLV")
                                              ? "DLV"
                                              : "") ==
                                          "DLV"
                                      ? Colors.green
                                      : (_data_exp[i].SAPSTATUS.contains("PCNF")
                                                  ? "PCNF"
                                                  : _data_exp[i]
                                                          .SAPSTATUS
                                                          .contains("CNF")
                                                      ? "CNF"
                                                      : "") ==
                                              "CNF"
                                          ? Colors.yellow.shade500
                                          // : _data_exp[i].BATCH != ''
                                          : _data_exp[i]
                                                  .SAPSTATUS
                                                  .contains("PCNF")
                                              ? Colors.pink.shade300
                                              : Colors.white,
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
        create: (_) => P402UDGRgetINSP_SPEC_Bloc(),
        child: BlocBuilder<P402UDGRgetINSP_SPEC_Bloc,
            P402UDGRgetINSP_SPECclassSET>(
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
  P402UDGRgetINSP_SPECclassSET? datain;
  @override
  State<NEWNEWREQUEST> createState() => _NEWNEWREQUESTState();
}

class _NEWNEWREQUESTState extends State<NEWNEWREQUEST> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<P402UDGRgetINSP_SPEC_Bloc>().add(P402UDGRgetINSP_SPEC_GET());
  }

  @override
  Widget build(BuildContext context) {
    P402UDGRMAINcontextpop1 = context;
    P402UDGRgetINSP_SPECclassSET _datain = widget.datain ??
        P402UDGRgetINSP_SPECclassSET(
          INSP_SPEC: [],
          SELECTED_SET: [],
          UDCODE: [],
        );

//INSP_LOT

    if (P402UDGRVAR.INSP_SPECdata.length == 0) {
      for (var i = 0; i < _datain.INSP_SPEC.length; i++) {
        //
        if (P402UDGRVAR.INSP_LOTset == _datain.INSP_SPEC[i].INSP_LOT) {
          P402UDGRVAR.INSP_SPECdata.add(PINSP_SPECHSclass(
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

              SingleChildScrollView(
                child: Container(
                  // width: 1100,
                  // height: 500,
                  child: Wrap(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ComInputText(
                              isEnabled: false,
                              height: 40,
                              width: 300,
                              isContr: P402UDGRVAR.iscontrol,
                              fnContr: (input) {
                                setState(() {
                                  P402UDGRVAR.iscontrol = input;
                                });
                              },
                              sValue: P402UDGRVAR.TO_ALL,
                              returnfunc: (String s) {
                                P402UDGRVAR.TO_ALL = s;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ComInputText(
                              sLabel: "GOOD",
                              height: 40,
                              width: 300,
                              isContr: P402UDGRVAR.iscontrol,
                              fnContr: (input) {
                                setState(() {
                                  P402UDGRVAR.iscontrol = input;
                                });
                              },
                              sValue: P402UDGRVAR.TO_UR,
                              returnfunc: (String s) {
                                P402UDGRVAR.TO_UR = s;
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
                              isContr: P402UDGRVAR.iscontrol,
                              fnContr: (input) {
                                setState(() {
                                  P402UDGRVAR.iscontrol = input;
                                });
                              },
                              sValue: P402UDGRVAR.TO_BL,
                              returnfunc: (String s) {
                                P402UDGRVAR.TO_BL = s;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int i = 0; i < _datain.UDCODE.length; i++) ...[
                              if (double.parse(
                                      ConverstStr(P402UDGRVAR.TO_ALL)) ==
                                  double.parse(
                                      ConverstStr(P402UDGRVAR.TO_BL))) ...[
                                if (_datain.UDCODE[i].CODE == 'R1' ||
                                    _datain.UDCODE[i].CODE == 'R2') ...[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        if (double.parse(ConverstStr(
                                                P402UDGRVAR.TO_ALL)) ==
                                            (double.parse(ConverstStr(
                                                    P402UDGRVAR.TO_UR))) +
                                                (double.parse(ConverstStr(
                                                    P402UDGRVAR.TO_BL)))) {
                                          Map<String, Map<String, String>>
                                              output = {
                                            "UD": {
                                              "INSPLOT":
                                                  P402UDGRVAR.INSP_LOTset,
                                              "UD_SELECTED_SET": "",
                                              "UD_PLANT": "",
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                              "TO_UR": "",
                                              "TO_BLOCKED": "",
                                              "TO_RETURN": ""
                                            },
                                            "UDTEMPSAVE": {
                                              "GOOD": P402UDGRVAR.TO_UR,
                                              "NGOOD": P402UDGRVAR.TO_BL,
                                              "PROCESS_ORDER":
                                                  P402UDGRVAR.PROCESS_ORDERset,
                                              "CODE_TEXT":
                                                  _datain.UDCODE[i].CODE_TEXT,
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                            }
                                          };

                                          Dio()
                                              .post(
                                            "${server2}QMINCOMING/UDSAVEQC",
                                            // "${'http://127.0.0.1:14094/'}QMINCOMING/UDSAVEQC",
                                            data: output,
                                          )
                                              .then((v) {
                                            Navigator.pop(context);
                                            P402UDGRMAINcontext.read<
                                                    P402UDGRget_Bloc>()
                                                .add(P402UDGRget_GET());
                                            //
                                            print(v.data);
                                            if (v.data.length > 0) {
                                              if (v.data[0]['TYPE'] != null) {
                                                if (v.data[0]['TYPE']
                                                            .toString() ==
                                                        'E' ||
                                                    v.data[0]['TYPE']
                                                            .toString() ==
                                                        'A') {
                                                  showErrorPopup(
                                                      P402UDGRMAINcontext,
                                                      v.data.toString());
                                                } else {
                                                  showGoodPopup(
                                                      P402UDGRMAINcontext,
                                                      v.data.toString());
                                                }
                                              }
                                            }
                                          });
                                        } else {
                                          //
                                          WORNINGpop(
                                              context,
                                              ["", "QTY is not same"],
                                              120,
                                              200);
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
                              ] else ...[
                                if (_datain.UDCODE[i].CODE == 'A1' &&
                                    double.parse(
                                            ConverstStr(P402UDGRVAR.TO_ALL)) ==
                                        double.parse(ConverstStr(
                                            P402UDGRVAR.TO_UR))) ...[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        if (double.parse(ConverstStr(
                                                P402UDGRVAR.TO_ALL)) ==
                                            (double.parse(ConverstStr(
                                                    P402UDGRVAR.TO_UR))) +
                                                (double.parse(ConverstStr(
                                                    P402UDGRVAR.TO_BL)))) {
                                          Map<String, Map<String, String>>
                                              output = {
                                            "UD": {
                                              "INSPLOT":
                                                  P402UDGRVAR.INSP_LOTset,
                                              "UD_SELECTED_SET": "",
                                              "UD_PLANT": "",
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                              "TO_UR": "",
                                              "TO_BLOCKED": "",
                                              "TO_RETURN": ""
                                            },
                                            "UDTEMPSAVE": {
                                              "GOOD": P402UDGRVAR.TO_UR,
                                              "NGOOD": P402UDGRVAR.TO_BL,
                                              "PROCESS_ORDER":
                                                  P402UDGRVAR.PROCESS_ORDERset,
                                              "CODE_TEXT":
                                                  _datain.UDCODE[i].CODE_TEXT,
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                            }
                                          };

                                          Dio()
                                              .post(
                                            "${server2}QMINCOMING/UDSAVEQC",
                                            // "${'http://127.0.0.1:14094/'}QMINCOMING/UDSAVEQC",
                                            data: output,
                                          )
                                              .then((v) {
                                            Navigator.pop(context);
                                            P402UDGRMAINcontext.read<
                                                    P402UDGRget_Bloc>()
                                                .add(P402UDGRget_GET());
                                            //

                                            print(v.data);
                                            if (v.data.length > 0) {
                                              if (v.data[0]['TYPE'] != null) {
                                                if (v.data[0]['TYPE']
                                                            .toString() ==
                                                        'E' ||
                                                    v.data[0]['TYPE']
                                                            .toString() ==
                                                        'A') {
                                                  showErrorPopup(
                                                      P402UDGRMAINcontext,
                                                      v.data.toString());
                                                } else {
                                                  showGoodPopup(
                                                      P402UDGRMAINcontext,
                                                      v.data.toString());
                                                }
                                              }
                                            }
                                          });
                                        } else {
                                          //
                                          WORNINGpop(
                                              context,
                                              ["", "QTY is not same"],
                                              120,
                                              200);
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
                                if (_datain.UDCODE[i].CODE == 'A5' &&
                                    (double.parse(ConverstStr(
                                                P402UDGRVAR.TO_ALL)) !=
                                            double.parse(ConverstStr(
                                                P402UDGRVAR.TO_UR)) ||
                                        (double.parse(ConverstStr(
                                                P402UDGRVAR.TO_ALL)) !=
                                            double.parse(ConverstStr(
                                                P402UDGRVAR.TO_BL))))) ...[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        if (double.parse(ConverstStr(
                                                P402UDGRVAR.TO_ALL)) ==
                                            (double.parse(ConverstStr(
                                                    P402UDGRVAR.TO_UR))) +
                                                (double.parse(ConverstStr(
                                                    P402UDGRVAR.TO_BL)))) {
                                          Map<String, Map<String, String>>
                                              output = {
                                            "UD": {
                                              "INSPLOT":
                                                  P402UDGRVAR.INSP_LOTset,
                                              "UD_SELECTED_SET": "",
                                              "UD_PLANT": "",
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                              "TO_UR": "",
                                              "TO_BLOCKED": "",
                                              "TO_RETURN": ""
                                            },
                                            "UDTEMPSAVE": {
                                              "GOOD": P402UDGRVAR.TO_UR,
                                              "NGOOD": P402UDGRVAR.TO_BL,
                                              "PROCESS_ORDER":
                                                  P402UDGRVAR.PROCESS_ORDERset,
                                              "CODE_TEXT":
                                                  _datain.UDCODE[i].CODE_TEXT,
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                            }
                                          };

                                          Dio()
                                              .post(
                                            "${server2}QMINCOMING/UDSAVEQC",
                                            // "${'http://127.0.0.1:14094/'}QMINCOMING/UDSAVEQC",
                                            data: output,
                                          )
                                              .then((v) {
                                            Navigator.pop(context);
                                            P402UDGRMAINcontext.read<
                                                    P402UDGRget_Bloc>()
                                                .add(P402UDGRget_GET());
                                            //
                                            // print(v.data);
                                            if (v.data.length > 0) {
                                              if (v.data[0]['TYPE'] != null) {
                                                if (v.data[0]['TYPE']
                                                            .toString() ==
                                                        'E' ||
                                                    v.data[0]['TYPE']
                                                            .toString() ==
                                                        'A') {
                                                  showErrorPopup(
                                                      P402UDGRMAINcontext,
                                                      v.data.toString());
                                                } else {
                                                  showGoodPopup(
                                                      P402UDGRMAINcontext,
                                                      v.data.toString());
                                                }
                                              }
                                            }
                                          });
                                        } else {
                                          //
                                          WORNINGpop(
                                              context,
                                              ["", "QTY is not same"],
                                              120,
                                              200);
                                        }
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 400,
                                        color: Colors.yellowAccent,
                                        child: Center(
                                          child: Text(
                                            _datain.UDCODE[i].CODE_TEXT,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                if (_datain.UDCODE[i].CODE == 'R2' &&
                                    (double.parse(
                                            ConverstStr(P402UDGRVAR.TO_ALL)) !=
                                        double.parse(ConverstStr(
                                            P402UDGRVAR.TO_UR)))) ...[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        if (double.parse(ConverstStr(
                                                P402UDGRVAR.TO_ALL)) ==
                                            (double.parse(ConverstStr(
                                                    P402UDGRVAR.TO_UR))) +
                                                (double.parse(ConverstStr(
                                                    P402UDGRVAR.TO_BL)))) {
                                          Map<String, Map<String, String>>
                                              output = {
                                            "UD": {
                                              "INSPLOT":
                                                  P402UDGRVAR.INSP_LOTset,
                                              "UD_SELECTED_SET": "",
                                              "UD_PLANT": "",
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                              "TO_UR": "",
                                              "TO_BLOCKED": "",
                                              "TO_RETURN": ""
                                            },
                                            "UDTEMPSAVE": {
                                              "GOOD": P402UDGRVAR.TO_UR,
                                              "NGOOD": P402UDGRVAR.TO_BL,
                                              "PROCESS_ORDER":
                                                  P402UDGRVAR.PROCESS_ORDERset,
                                              "CODE_TEXT":
                                                  _datain.UDCODE[i].CODE_TEXT,
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                            }
                                          };

                                          Dio()
                                              .post(
                                            "${server2}QMINCOMING/UDSAVEQC",
                                            // "${'http://127.0.0.1:14094/'}QMINCOMING/UDSAVEQC",
                                            data: output,
                                          )
                                              .then((v) {
                                            Navigator.pop(context);
                                            P402UDGRMAINcontext.read<
                                                    P402UDGRget_Bloc>()
                                                .add(P402UDGRget_GET());
                                            //
                                            print(v.data);
                                            if (v.data.length > 0) {
                                              if (v.data[0]['TYPE'] != null) {
                                                if (v.data[0]['TYPE']
                                                            .toString() ==
                                                        'E' ||
                                                    v.data[0]['TYPE']
                                                            .toString() ==
                                                        'A') {
                                                  showErrorPopup(
                                                      P402UDGRMAINcontext,
                                                      v.data.toString());
                                                } else {
                                                  showGoodPopup(
                                                      P402UDGRMAINcontext,
                                                      v.data.toString());
                                                }
                                              }
                                            }
                                          });
                                        } else {
                                          //
                                          WORNINGpop(
                                              context,
                                              ["", "QTY is not same"],
                                              120,
                                              200);
                                        }
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 400,
                                        color: Colors.orange,
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
                                    (double.parse(
                                            ConverstStr(P402UDGRVAR.TO_ALL)) !=
                                        double.parse(ConverstStr(
                                            P402UDGRVAR.TO_UR)))) ...[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        if (double.parse(ConverstStr(
                                                P402UDGRVAR.TO_ALL)) ==
                                            (double.parse(ConverstStr(
                                                    P402UDGRVAR.TO_UR))) +
                                                (double.parse(ConverstStr(
                                                    P402UDGRVAR.TO_BL)))) {
                                          Map<String, Map<String, String>>
                                              output = {
                                            "UD": {
                                              "INSPLOT":
                                                  P402UDGRVAR.INSP_LOTset,
                                              "UD_SELECTED_SET": "",
                                              "UD_PLANT": "",
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                              "TO_UR": "",
                                              "TO_BLOCKED": "",
                                              "TO_RETURN": ""
                                            },
                                            "UDTEMPSAVE": {
                                              "GOOD": P402UDGRVAR.TO_UR,
                                              "NGOOD": P402UDGRVAR.TO_BL,
                                              "PROCESS_ORDER":
                                                  P402UDGRVAR.PROCESS_ORDERset,
                                              "CODE_TEXT":
                                                  _datain.UDCODE[i].CODE_TEXT,
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                            }
                                          };

                                          Dio()
                                              .post(
                                            "${server2}QMINCOMING/UDSAVEQC",
                                            // "${'http://127.0.0.1:14094/'}QMINCOMING/UDSAVEQC",
                                            data: output,
                                          )
                                              .then((v) {
                                            Navigator.pop(context);
                                            P402UDGRMAINcontext.read<
                                                    P402UDGRget_Bloc>()
                                                .add(P402UDGRget_GET());
                                            //
                                            print(v.data);
                                            if (v.data.length > 0) {
                                              if (v.data[0]['TYPE'] != null) {
                                                if (v.data[0]['TYPE']
                                                            .toString() ==
                                                        'E' ||
                                                    v.data[0]['TYPE']
                                                            .toString() ==
                                                        'A') {
                                                  showErrorPopup(
                                                      P402UDGRMAINcontext,
                                                      v.data.toString());
                                                } else {
                                                  showGoodPopup(
                                                      P402UDGRMAINcontext,
                                                      v.data.toString());
                                                }
                                              }
                                            }
                                          });
                                        } else {
                                          //
                                          WORNINGpop(
                                              context,
                                              ["", "QTY is not same"],
                                              120,
                                              200);
                                        }
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 400,
                                        color: Colors.yellowAccent,
                                        child: Center(
                                          child: Text(
                                            _datain.UDCODE[i].CODE_TEXT,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ]
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //
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
            if (P402UDGRVAR.pagepopapp == 0) ...[
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
                                i < P402UDGRVAR.SELECTED_SETdata.length;
                                i++) ...[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    //

                                    P402UDGRVAR.INSP_SPECdata[P402UDGRVAR.iDATA]
                                            .DATAAP =
                                        P402UDGRVAR.SELECTED_SETdata[i].CODE;
                                    P402UDGRVAR.INSP_SPECdata[P402UDGRVAR.iDATA]
                                            .DATAAP_TEXT =
                                        P402UDGRVAR
                                            .SELECTED_SETdata[i].CODE_TEXT;

                                    P402UDGRVAR.INSP_SPECdata[P402UDGRVAR.iDATA]
                                            .CODEG =
                                        P402UDGRVAR
                                            .SELECTED_SETdata[i].CODEGROUP;

                                    P402UDGRVAR.INSP_SPECdata[P402UDGRVAR.iDATA]
                                            .VALUATION =
                                        P402UDGRVAR
                                            .SELECTED_SETdata[i].VALUATION;

                                    P402UDGRMAINcontextpop1.read<
                                            P402UDGRgetINSP_SPEC_Bloc>()
                                        .add(P402UDGRgetINSP_SPEC_GET());

                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 200,
                                    color: P402UDGRVAR.SELECTED_SETdata[i]
                                                .VALUATION ==
                                            'A'
                                        ? Colors.green
                                        : Colors.red,
                                    child: Center(
                                      child: Text(
                                        P402UDGRVAR
                                            .SELECTED_SETdata[i].CODE_TEXT,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ] else if (P402UDGRVAR.pagepopapp == 1) ...[
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
                  isContr: P402UDGRVAR.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      P402UDGRVAR.iscontrol = input;
                    });
                  },
                  sValue: P402UDGRVAR.DATASUM,
                  returnfunc: (String s) {
                    P402UDGRVAR.DATASUM = s;
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  //
                  // P402UDGRVAR.pagepop = 1;
                  // setState(() {});
                  P402UDGRVAR.INSP_SPECdata[P402UDGRVAR.iDATA].DATASUM =
                      P402UDGRVAR.DATASUM;
                  P402UDGRVAR.INSP_SPECdata[P402UDGRVAR.iDATA].DATASUM_TEXT =
                      "VALUE";

                  P402UDGRMAINcontextpop1.read<P402UDGRgetINSP_SPEC_Bloc>()
                      .add(P402UDGRgetINSP_SPEC_GET());
                  Navigator.pop(context);
                  // P402UDGRVAR.INSP_SPECdata[ P402UDGRVAR.iDATA ].DATAAP_TEXT
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

void _QCFN(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: QCFNWD(),
      );
    },
  );
}

class QCFNWD extends StatefulWidget {
  const QCFNWD({super.key});

  @override
  State<QCFNWD> createState() => _QCFNWDState();
}

class _QCFNWDState extends State<QCFNWD> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 600,
      child: Center(
        child: SizedBox(
          child: InkWell(
            onTap: () {
              // print(P402UDGRVAR.PROCESS_ORDERset);
              Dio().post(
                "${server2}10GETDATAFROMJOBBINGAQC/QCFN",
                // "${'http://127.0.0.1:14094/'}10GETDATAFROMJOBBINGAQC/QCFN",
                data: {
                  "BAPI_NAME": "ZFMPP_QCFN_IN",
                  "ORDERID": P402UDGRVAR.PROCESS_ORDERset,
                  "PERNR_ID": USERDATA.ID
                },
              ).then((v) {
                Navigator.pop(context);

                if (v.data['ExportParameter'] != null) {
                  if (v.data['ExportParameter']['INACT_NEW'].toString() ==
                      'E') {
                    P402UDGRVAR.page = 1;
                    showErrorPopup(P402UDGRMAINcontext, v.data.toString());
                    P402UDGRMAINcontextpop1.read<P402UDGRgetINSP_SPEC_Bloc>()
                        .add(P402UDGRgetINSP_SPEC_GET());
                  } else {
                    P402UDGRVAR.page = 1;
                    showGoodPopup(P402UDGRMAINcontext, v.data.toString());
                    P402UDGRMAINcontextpop1.read<P402UDGRgetINSP_SPEC_Bloc>()
                        .add(P402UDGRgetINSP_SPEC_GET());
                  }
                } else {
                  P402UDGRVAR.page = 1;
                  showErrorPopup(P402UDGRMAINcontext, v.data.toString());
                  P402UDGRMAINcontextpop1.read<P402UDGRgetINSP_SPEC_Bloc>()
                      .add(P402UDGRgetINSP_SPEC_GET());
                }

                //
                print(v.data);
              });
            },
            child: Container(
              width: 400,
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text("QCFN"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _FORCEGR(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: _FORCEGRset(),
      );
    },
  );
}

class _FORCEGRset extends StatefulWidget {
  const _FORCEGRset({super.key});

  @override
  State<_FORCEGRset> createState() => __FORCEGRsetState();
}

class __FORCEGRsetState extends State<_FORCEGRset> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 600,
      child: Center(
        child: SizedBox(
          child: InkWell(
            onTap: () {
              // print(P401QCFNVAR.PROCESS_ORDERset);
              Dio().post(
                "${server2}10GETDATAFROMJOBBINGAQC/AUTOSTORE",
                // "${'http://127.0.0.1:14094/'}10GETDATAFROMJOBBINGAQC/QCFN",
                data: {
                  "HEADER": {
                    "PLANT": P402UDGRVAR.PLANT,
                    // "ORD_ST_DATE_FR":
                    //     "${P402UDGRVAR.dayback}.${P402UDGRVAR.monthback}.${P402UDGRVAR.yearback}",
                    // "ORD_ST_DATE_TO":
                    //     "${P402UDGRVAR.daynow}.${P402UDGRVAR.monthnow}.${P402UDGRVAR.yearnow}",
                    //day_next
                    "ORD_ST_DATE_FR":
                        "${P402UDGRVAR.day}.${P402UDGRVAR.month}.${P402UDGRVAR.year}",
                    "ORD_ST_DATE_TO":
                        "${P402UDGRVAR.day_next}.${P402UDGRVAR.month_next}.${P402UDGRVAR.year_next}",
                    "ORDER_TYPE": "",
                    "PROD_SUP": ""
                  },
                  "PROC_ORD": [
                    {
                      "PROCESS_ORDER": P402UDGRVAR.PROCESS_ORDERset,
                      "MATERIAL": "",
                      "COMPONENT": ""
                    }
                  ]
                },
              ).then((v) {
                Navigator.pop(context);

                //
                // print(v.data);
              });
            },
            child: Container(
              width: 400,
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text("FORCE GR order ${P402UDGRVAR.PROCESS_ORDERset}"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
