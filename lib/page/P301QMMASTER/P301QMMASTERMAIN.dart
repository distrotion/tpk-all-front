// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/BlocEvent/P301-01-P301QMMASTERget.dart';
import '../../bloc/BlocEvent/P301-02-P301QMMASTERgetINSP_SPEC.dart';
import '../../bloc/Cubit/ChangePageEventCUBIT.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/ComInputTextTan.dart';
import '../../widget/qmtable/INSP_SPECtable.dart';
import '../../widget/qmtable/QMMAASTERtable.dart';
import '../../widget/table/PROGRESSMAIN.dart';

import 'P301QMMASTERVAR.dart';

late BuildContext P301QMMASTERMAINcontext;

class P301QMMASTERMAIN extends StatefulWidget {
  P301QMMASTERMAIN({
    super.key,
    this.data,
  });
  List<P301QMMASTERgetclass>? data;

  @override
  State<P301QMMASTERMAIN> createState() => _P301QMMASTERMAINState();
}

class _P301QMMASTERMAINState extends State<P301QMMASTERMAIN> {
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    // P301QMMASTERVAR.formattedDate = DateFormat('dd-MM-yy').format(now);
    // P301QMMASTERVAR.day = DateFormat('dd').format(now);
    // P301QMMASTERVAR.month = DateFormat('MM').format(now);
    // P301QMMASTERVAR.year = DateFormat('yyyy').format(now);
    P301QMMASTERVAR.day = "03";
    P301QMMASTERVAR.month = "03";
    P301QMMASTERVAR.year = "2025";

    P301QMMASTERVAR.iscontrol = true;
    P301QMMASTERVAR.SEARCH = '';
    context.read<P301QMMASTERget_Bloc>().add(P301QMMASTERget_GET());
  }

  @override
  Widget build(BuildContext context) {
    P301QMMASTERMAINcontext = context;
    List<P301QMMASTERgetclass> _datain = widget.data ?? [];
    List<P301QMMASTERgetclass> _datasearch = [];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
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
                        P301QMMASTERVAR.day = day;
                        P301QMMASTERVAR.month = month;
                        P301QMMASTERVAR.year = year;

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
                          "วันที่ : ${P301QMMASTERVAR.day}-${P301QMMASTERVAR.month}-${P301QMMASTERVAR.year}",
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
                                  P301QMMASTERVAR.pagepop = 0;
                                  P301QMMASTERVAR.INSP_LOTset =
                                      _datain[i].INSP_LOT;
                                  P301QMMASTERVAR.INSP_SPECdata = [];
                                  P301QMMASTERVAR.SELECTED_SETdata = [];
                                  P301QMMASTERVAR.UDCODEdata = [];

                                  _QMI003POP(context);
                                },
                                onHover: (v) {
                                  //
                                  // print(v.toString() + ":" + i.toString());
                                },
                                child: QMMAASTERitem(
                                  text01: _datain[i].MATERIAL,
                                  text02: _datain[i].CUST_NAME1,
                                  text03: _datain[i].MAT_DESC,
                                  text04: _datain[i].OLD_MAT,
                                  text05: _datain[i].BATCH,
                                  text06: _datain[i].INSP_LOT,
                                  text07: _datain[i].INSP_QTY +
                                      ' ' +
                                      _datain[i].INSP_UOM,
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
        create: (_) => P301QMMASTERgetINSP_SPEC_Bloc(),
        child: BlocBuilder<P301QMMASTERgetINSP_SPEC_Bloc,
            P301QMMASTERgetINSP_SPECclassSET>(
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
  P301QMMASTERgetINSP_SPECclassSET? datain;
  @override
  State<NEWNEWREQUEST> createState() => _NEWNEWREQUESTState();
}

class _NEWNEWREQUESTState extends State<NEWNEWREQUEST> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<P301QMMASTERgetINSP_SPEC_Bloc>()
        .add(P301QMMASTERgetINSP_SPEC_GET());
  }

  @override
  Widget build(BuildContext context) {
    P301QMMASTERgetINSP_SPECclassSET _datain = widget.datain ??
        P301QMMASTERgetINSP_SPECclassSET(
          INSP_SPEC: [],
          SELECTED_SET: [],
          UDCODE: [],
        );

//INSP_LOT
    if (P301QMMASTERVAR.INSP_SPECdata.length == 0) {
      for (var i = 0; i < _datain.INSP_SPEC.length; i++) {
        //
        if (P301QMMASTERVAR.INSP_LOTset == _datain.INSP_SPEC[i].INSP_LOT) {
          P301QMMASTERVAR.INSP_SPECdata.add(PINSP_SPECclass(
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
            if (P301QMMASTERVAR.pagepop == 0) ...[
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
                                i < P301QMMASTERVAR.INSP_SPECdata.length;
                                i++) ...[
                              // for (int i = 0; i < 10; i++) ...[
                              InkWell(
                                onTap: () {
                                  //
                                  P301QMMASTERVAR.SELECTED_SETdata = [];
                                  // P301QMMASTERVAR.SELECTEDSETsetAC =
                                  //     P301QMMASTERVAR
                                  //         .INSP_SPECdata[i].SLECTEDSET;
                                  P301QMMASTERVAR.SELECTEDSETset =
                                      P301QMMASTERVAR
                                          .INSP_SPECdata[i].SLECTEDSET;
                                  print(
                                      '--->' + P301QMMASTERVAR.SELECTEDSETset);
                                  for (var i = 0;
                                      i < _datain.SELECTED_SET.length;
                                      i++) {
                                    if (_datain.SELECTED_SET[i].SELECTEDSET ==
                                        P301QMMASTERVAR.SELECTEDSETset) {
                                      //     //
                                      print(
                                          _datain.SELECTED_SET[i].SELECTEDSET);
                                      P301QMMASTERVAR.SELECTED_SETdata.add(
                                          SELECTED_SETclass(
                                        CATALOGTYPE:
                                            _datain.SELECTED_SET[i].CATALOGTYPE,
                                        SELECTEDSET_PLANT: _datain
                                            .SELECTED_SET[i].SELECTEDSET_PLANT,
                                        SELECTEDSET:
                                            _datain.SELECTED_SET[i].SELECTEDSET,
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
                                  if (P301QMMASTERVAR.SELECTEDSETset != '') {
                                    P301QMMASTERVAR.pagepopapp = 0;
                                  } else {
                                    P301QMMASTERVAR.pagepopapp = 1;
                                  }

                                  _QMI003POPapp(context);
                                },
                                onHover: (v) {
                                  //
                                  // print(v.toString() + ":" + i.toString());
                                },
                                child: INSP_SPECitem(
                                  text01: P301QMMASTERVAR
                                      .INSP_SPECdata[i].MIC_SHORTTEXT,
                                  text02:
                                      P301QMMASTERVAR.INSP_SPECdata[i].REC_TYPE,
                                  text03: P301QMMASTERVAR.INSP_SPECdata[i].MIC,
                                  text04: "",
                                  text05: "",
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
                onTap: () {
                  //
                  P301QMMASTERVAR.pagepop = 1;
                  setState(() {});
                },
                child: Container(
                  width: 200,
                  height: 60,
                  color: Colors.blue,
                  child: Center(
                    child: Text("Used Decision"),
                  ),
                ),
              ),
            ] else if (P301QMMASTERVAR.pagepop == 1) ...[
              //
              SingleChildScrollView(
                child: Container(
                  // width: 1100,
                  child: Column(
                    children: [
                      for (int i = 0; i < _datain.UDCODE.length; i++) ...[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                        )
                      ]
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  //
                  P301QMMASTERVAR.pagepop = 0;
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
            if (P301QMMASTERVAR.pagepopapp == 0) ...[
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
                                i < P301QMMASTERVAR.SELECTED_SETdata.length;
                                i++) ...[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 80,
                                  width: 200,
                                  color: Colors.blue,
                                  child: Center(
                                    child: Text(
                                      P301QMMASTERVAR
                                          .SELECTED_SETdata[i].CODE_TEXT,
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
            ] else if (P301QMMASTERVAR.pagepopapp == 1) ...[
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
                  isContr: P301QMMASTERVAR.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      P301QMMASTERVAR.iscontrol = input;
                    });
                  },
                  sValue: P301QMMASTERVAR.DATASUM,
                  returnfunc: (String s) {
                    P301QMMASTERVAR.DATASUM = s;
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  //
                  // P301QMMASTERVAR.pagepop = 1;
                  // setState(() {});
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
