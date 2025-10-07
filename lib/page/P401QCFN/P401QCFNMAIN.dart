// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';

import '../../bloc/BlocEvent/P401-01-P401QCFNQCget.dart';
import '../../bloc/BlocEvent/P401-02-P401QCFNQCINSP_SPEC.dart';
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
import '../../widget/newtable/QMMAASTERQCtable.dart';
import '../../widget/table/PROGRESSMAIN.dart';

import '../page202.dart';
import '../page204.dart';
import 'P401QCFNQCVAR.dart';

late BuildContext P401QCFNMAINcontext;
late BuildContext P401QCFNMAINcontextpop1;

class P401QCFNMAIN extends StatefulWidget {
  P401QCFNMAIN({
    super.key,
    this.data,
  });
  List<P401QCFNgetclass>? data;

  @override
  State<P401QCFNMAIN> createState() => _P401QCFNMAINState();
}

class _P401QCFNMAINState extends State<P401QCFNMAIN> {
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    // P401QCFNVAR.formattedDate = DateFormat('dd-MM-yy').format(now);
    P401QCFNVAR.day = DateFormat('dd').format(now);
    P401QCFNVAR.month = DateFormat('MM').format(now);
    P401QCFNVAR.year = DateFormat('yyyy').format(now);

    P401QCFNVAR.day_next = DateFormat('dd').format(now);
    P401QCFNVAR.month_next = DateFormat('MM').format(now);
    P401QCFNVAR.year_next = DateFormat('yyyy').format(now);
    // P401QCFNVAR.day = "01";
    // P401QCFNVAR.month = "07";
    // P401QCFNVAR.year = "2025";

    // P401QCFNVAR.day_next = "02";
    // P401QCFNVAR.month_next = "07";
    // P401QCFNVAR.year_next = "2025";

    // P401QCFNVAR.day_next = "05";
    // P401QCFNVAR.month_next = "04";
    // P401QCFNVAR.year_next = "2025";

    P401QCFNVAR.PLANT = QUERYDATASET.PLANT;
    P401QCFNVAR.LOT_ORI = QUERYDATASET.LOT_ORI;

    P401QCFNVAR.iscontrol = true;
    P401QCFNVAR.SEARCH = '';
    P401QCFNVAR.holding = 999;
    context.read<P401QCFNget_Bloc>().add(P401QCFNget_GET());
  }

  @override
  Widget build(BuildContext context) {
    P401QCFNMAINcontext = context;
    List<P401QCFNgetclass> _datain = widget.data ?? [];
    List<P401QCFNgetclass> _datasearch = [];

    // List<P401QCFNgetclass> _data_exp = [];

    // for (int i = 0; i < _datain.length; i++) {
    //   if (_datain[i].PROCESS_ORDER.contains(P401QCFNVAR.SEARCH) ||
    //       _datain[i].MATERIAL.contains(P401QCFNVAR.SEARCH) ||
    //       _datain[i].MAT_DESC.contains(P401QCFNVAR.SEARCH) ||
    //       _datain[i].OLD_MAT.contains(P401QCFNVAR.SEARCH) ||
    //       _datain[i].BATCH.contains(P401QCFNVAR.SEARCH)) {
    //     _data_exp.add(_datain[i]);
    //   }
    // }
    if (P401QCFNVAR.FILTER == 'ALL') {
      _datasearch = _datain;
    } else {
      // _datasearch = _datain;
      for (var i = 0; i < _datain.length; i++) {
        if (_datain[i].INSP_LOT_STATUS.contains("UD") == false) {
          _datasearch.add(_datain[i]);
        }
      }
    }

    List<P401QCFNgetclass> _data_exp = [];

    for (int i = 0; i < _datasearch.length; i++) {
      if (_datasearch[i].PROCESS_ORDER.contains(P401QCFNVAR.SEARCH) ||
          _datasearch[i].MATERIAL.contains(P401QCFNVAR.SEARCH) ||
          _datasearch[i].MAT_DESC.contains(P401QCFNVAR.SEARCH) ||
          _datasearch[i].OLD_MAT.contains(P401QCFNVAR.SEARCH) ||
          _datasearch[i].INSP_QTY.contains(P401QCFNVAR.SEARCH) ||
          _datasearch[i].INSP_LOT_STATUS.contains(P401QCFNVAR.SEARCH) ||
          _datasearch[i].BATCH.contains(P401QCFNVAR.SEARCH)) {
        _data_exp.add(_datasearch[i]);
      }
    }

    // print("----------->");

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
                        'QCFN',
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
                        "UD Table",
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
                        P401QCFNVAR.day = day;
                        P401QCFNVAR.month = month;
                        P401QCFNVAR.year = year;

                        setState(() {});
                        context.read<P401QCFNget_Bloc>().add(P401QCFNget_GET());
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
                          "วันที่ : ${P401QCFNVAR.day}-${P401QCFNVAR.month}-${P401QCFNVAR.year}",
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
                        P401QCFNVAR.day_next = day;
                        P401QCFNVAR.month_next = month;
                        P401QCFNVAR.year_next = year;

                        setState(() {});
                        context.read<P401QCFNget_Bloc>().add(P401QCFNget_GET());
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
                          "ถึงวันที่ : ${P401QCFNVAR.day_next}-${P401QCFNVAR.month_next}-${P401QCFNVAR.year_next}",
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
                              isContr: P401QCFNVAR.iscontrol,
                              fnContr: (input) {
                                setState(() {
                                  P401QCFNVAR.iscontrol = input;
                                });
                              },
                              sPlaceholder: "search",
                              sValue: P401QCFNVAR.SEARCH,
                              returnfunc: (String s) {
                                setState(() {
                                  P401QCFNVAR.SEARCH = s;
                                });
                              },
                            ),
                            SizedBox(
                              height: 64,
                              width: 100,
                              child: AdvanceDropDown(
                                imgpath: 'assets/icons/icon-down_4@3x.png',
                                listdropdown: const [
                                  MapEntry("NO UD", ""),
                                  MapEntry("ALL", "ALL")
                                ],
                                onChangeinside: (d, k) {
                                  setState(() {
                                    P401QCFNVAR.FILTER = d;
                                  });
                                },
                                value: P401QCFNVAR.FILTER,
                                height: 40,
                                width: 100,
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<P401QCFNget_Bloc>()
                                          .add(P401QCFNget_GET());
                                    },
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  QMMAASTERQCtable(),
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
                                  P401QCFNVAR.pagepop = 0;
                                  P401QCFNVAR.INSP_LOTset =
                                      _data_exp[i].INSP_LOT;
                                  P401QCFNVAR.TO_UR = _data_exp[i].INSP_QTY;

                                  P401QCFNVAR.PROCESS_ORDERset =
                                      _data_exp[i].PROCESS_ORDER;

                                  P401QCFNVAR.TO_ALL = _data_exp[i].INSP_QTY;
                                  P401QCFNVAR.TO_BL = "";
                                  P401QCFNVAR.INSP_SPECdata = [];
                                  P401QCFNVAR.SELECTED_SETdata = [];
                                  P401QCFNVAR.UDCODEdata = [];

                                  P401QCFNVAR.page = 0;

                                  _QMI003POP(context);
                                  // }
                                },
                                onHover: (v) {
                                  //
                                  // print(v.toString() + ":" + i.toString());
                                  setState(() {
                                    P401QCFNVAR.holding = i;
                                  });
                                },
                                child: QMMAASTERQCitem(
                                  holding: P401QCFNVAR.holding == i,
                                  text01: _data_exp[i].MATERIAL,
                                  text02: _data_exp[i].PROCESS_ORDER,
                                  text03: _data_exp[i].MAT_DESC,
                                  text04: _data_exp[i].OLD_MAT,
                                  text05: _data_exp[i].BATCH,
                                  text06: _data_exp[i].INSP_LOT,
                                  text07:
                                      '${_data_exp[i].INSP_QTY} ${_data_exp[i].INSP_UOM}',
                                  text08: _data_exp[i].INSP_LOT_STATUS,
                                  text09: _data_exp[i].STATUSQCFN,
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
        create: (_) => P401QCFNgetINSP_SPEC_Bloc(),
        child: BlocBuilder<P401QCFNgetINSP_SPEC_Bloc,
            P401QCFNgetINSP_SPECclassSET>(
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
  P401QCFNgetINSP_SPECclassSET? datain;
  @override
  State<NEWNEWREQUEST> createState() => _NEWNEWREQUESTState();
}

class _NEWNEWREQUESTState extends State<NEWNEWREQUEST> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<P401QCFNgetINSP_SPEC_Bloc>().add(P401QCFNgetINSP_SPEC_GET());
  }

  @override
  Widget build(BuildContext context) {
    P401QCFNMAINcontextpop1 = context;
    P401QCFNgetINSP_SPECclassSET _datain = widget.datain ??
        P401QCFNgetINSP_SPECclassSET(
          INSP_SPEC: [],
          SELECTED_SET: [],
          UDCODE: [],
        );

//INSP_LOT

    if (P401QCFNVAR.INSP_SPECdata.length == 0) {
      for (var i = 0; i < _datain.INSP_SPEC.length; i++) {
        //
        if (P401QCFNVAR.INSP_LOTset == _datain.INSP_SPEC[i].INSP_LOT) {
          P401QCFNVAR.INSP_SPECdata.add(PINSP_SPECHSclass(
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
      height: 200,
      width: 400,
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
                  child: Text("Quality Control Final"),
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
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: InkWell(
                                onTap: () {
                                  // _QCFN(context);
                                  Dio().post(
                                    "${server2}10GETDATAFROMJOBBINGAQC/QCFN",
                                    // "${'http://127.0.0.1:14094/'}10GETDATAFROMJOBBINGAQC/QCFN",
                                    data: {
                                      "BAPI_NAME": "ZFMPP_QCFN_IN",
                                      "ORDERID": P401QCFNVAR.PROCESS_ORDERset,
                                      "PERNR_ID": USERDATA.ID,
                                    },
                                  ).then((v) {
                                    Navigator.pop(context);

                                    if (v.data['ExportParameter'] != null) {
                                      if (v.data['ExportParameter']['INACT_NEW']
                                              .toString() ==
                                          'E') {
                                        P401QCFNVAR.page = 1;
                                        showErrorPopup(P401QCFNMAINcontext,
                                            v.data.toString());
                                        P401QCFNMAINcontextpop1.read<
                                                P401QCFNgetINSP_SPEC_Bloc>()
                                            .add(P401QCFNgetINSP_SPEC_GET());
                                      } else {
                                        P401QCFNVAR.page = 1;
                                        showGoodPopup(P401QCFNMAINcontext,
                                            v.data.toString());
                                        P401QCFNMAINcontextpop1.read<
                                                P401QCFNgetINSP_SPEC_Bloc>()
                                            .add(P401QCFNgetINSP_SPEC_GET());
                                      }
                                    } else {
                                      P401QCFNVAR.page = 1;
                                      showErrorPopup(P401QCFNMAINcontext,
                                          v.data.toString());
                                      P401QCFNMAINcontextpop1.read<
                                              P401QCFNgetINSP_SPEC_Bloc>()
                                          .add(P401QCFNgetINSP_SPEC_GET());
                                    }
                                    P401QCFNMAINcontext.read<P401QCFNget_Bloc>()
                                        .add(P401QCFNget_GET());

                                    //
                                    // print(v.data);
                                  });
                                },
                                child: Container(
                                  color: Colors.yellow,
                                  height: 50,
                                  width: 100,
                                  child: const Center(
                                    child: Text("QCFN"),
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
            if (P401QCFNVAR.pagepopapp == 0) ...[
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
                                i < P401QCFNVAR.SELECTED_SETdata.length;
                                i++) ...[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    //

                                    P401QCFNVAR.INSP_SPECdata[P401QCFNVAR.iDATA]
                                            .DATAAP =
                                        P401QCFNVAR.SELECTED_SETdata[i].CODE;
                                    P401QCFNVAR.INSP_SPECdata[P401QCFNVAR.iDATA]
                                            .DATAAP_TEXT =
                                        P401QCFNVAR
                                            .SELECTED_SETdata[i].CODE_TEXT;

                                    P401QCFNVAR.INSP_SPECdata[P401QCFNVAR.iDATA]
                                            .CODEG =
                                        P401QCFNVAR
                                            .SELECTED_SETdata[i].CODEGROUP;

                                    P401QCFNVAR.INSP_SPECdata[P401QCFNVAR.iDATA]
                                            .VALUATION =
                                        P401QCFNVAR
                                            .SELECTED_SETdata[i].VALUATION;

                                    P401QCFNMAINcontextpop1.read<
                                            P401QCFNgetINSP_SPEC_Bloc>()
                                        .add(P401QCFNgetINSP_SPEC_GET());

                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 200,
                                    color: P401QCFNVAR.SELECTED_SETdata[i]
                                                .VALUATION ==
                                            'A'
                                        ? Colors.green
                                        : Colors.red,
                                    child: Center(
                                      child: Text(
                                        P401QCFNVAR
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
            ] else if (P401QCFNVAR.pagepopapp == 1) ...[
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
                  isContr: P401QCFNVAR.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      P401QCFNVAR.iscontrol = input;
                    });
                  },
                  sValue: P401QCFNVAR.DATASUM,
                  returnfunc: (String s) {
                    P401QCFNVAR.DATASUM = s;
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  //
                  // P401QCFNVAR.pagepop = 1;
                  // setState(() {});
                  P401QCFNVAR.INSP_SPECdata[P401QCFNVAR.iDATA].DATASUM =
                      P401QCFNVAR.DATASUM;
                  P401QCFNVAR.INSP_SPECdata[P401QCFNVAR.iDATA].DATASUM_TEXT =
                      "VALUE";

                  P401QCFNMAINcontextpop1.read<P401QCFNgetINSP_SPEC_Bloc>()
                      .add(P401QCFNgetINSP_SPEC_GET());
                  Navigator.pop(context);
                  // P401QCFNVAR.INSP_SPECdata[ P401QCFNVAR.iDATA ].DATAAP_TEXT
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
      height: 200,
      width: 600,
      child: Center(
        child: SizedBox(
          child: InkWell(
            onTap: () {
              // print(P401QCFNVAR.PROCESS_ORDERset);
              Dio().post(
                "${server2}10GETDATAFROMJOBBINGAQC/QCFN",
                // "${'http://127.0.0.1:14094/'}10GETDATAFROMJOBBINGAQC/QCFN",
                data: {
                  "BAPI_NAME": "ZFMPP_QCFN_IN",
                  "ORDERID": P401QCFNVAR.PROCESS_ORDERset,
                  "PERNR_ID": USERDATA.ID,
                },
              ).then((v) {
                Navigator.pop(context);

                if (v.data['ExportParameter'] != null) {
                  if (v.data['ExportParameter']['INACT_NEW'].toString() ==
                      'E') {
                    P401QCFNVAR.page = 1;
                    showErrorPopup(P401QCFNMAINcontext, v.data.toString());
                    P401QCFNMAINcontextpop1.read<P401QCFNgetINSP_SPEC_Bloc>()
                        .add(P401QCFNgetINSP_SPEC_GET());
                  } else {
                    P401QCFNVAR.page = 1;
                    showGoodPopup(P401QCFNMAINcontext, v.data.toString());
                    P401QCFNMAINcontextpop1.read<P401QCFNgetINSP_SPEC_Bloc>()
                        .add(P401QCFNgetINSP_SPEC_GET());
                  }
                } else {
                  P401QCFNVAR.page = 1;
                  showErrorPopup(P401QCFNMAINcontext, v.data.toString());
                  P401QCFNMAINcontextpop1.read<P401QCFNgetINSP_SPEC_Bloc>()
                      .add(P401QCFNgetINSP_SPEC_GET());
                }

                //
                // print(v.data);
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
