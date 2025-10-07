import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/global.dart';
import '../../page/P236FINISHEDGOODTRANFERHS/P236FINISHEDGOODTRANFERHS.dart';
import '../../page/P236FINISHEDGOODTRANFERHS/P236FINISHEDGOODTRANFERHSVAR.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
//-------------------------------------------------

abstract class P236FINISHEDGOODTRANFERHSget_Event {}

class P236FINISHEDGOODTRANFERHSget_GET
    extends P236FINISHEDGOODTRANFERHSget_Event {}

class P236FINISHEDGOODTRANFERHSget_GET2
    extends P236FINISHEDGOODTRANFERHSget_Event {}

class P236FINISHEDGOODTRANFERHSget_GET3
    extends P236FINISHEDGOODTRANFERHSget_Event {}

class P236FINISHEDGOODTRANFERHSget_FLUSH
    extends P236FINISHEDGOODTRANFERHSget_Event {}

class P236FINISHEDGOODTRANFERHSget_Bloc extends Bloc<
    P236FINISHEDGOODTRANFERHSget_Event,
    List<P236FINISHEDGOODTRANFERHSgetclass>> {
  P236FINISHEDGOODTRANFERHSget_Bloc() : super([]) {
    on<P236FINISHEDGOODTRANFERHSget_GET>((event, emit) {
      return _P236FINISHEDGOODTRANFERHSget_GET([], emit);
    });

    on<P236FINISHEDGOODTRANFERHSget_GET2>((event, emit) {
      return _P236FINISHEDGOODTRANFERHSget_GET2([], emit);
    });
    on<P236FINISHEDGOODTRANFERHSget_GET3>((event, emit) {
      return _P236FINISHEDGOODTRANFERHSget_GET3([], emit);
    });
    on<P236FINISHEDGOODTRANFERHSget_FLUSH>((event, emit) {
      return _P236FINISHEDGOODTRANFERHSget_FLUSH([], emit);
    });
  }

  Future<void> _P236FINISHEDGOODTRANFERHSget_GET(
      List<P236FINISHEDGOODTRANFERHSgetclass> toAdd,
      Emitter<List<P236FINISHEDGOODTRANFERHSgetclass>> emit) async {
    // FreeLoadingTan(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
    List<P236FINISHEDGOODTRANFERHSgetclass> output = [];
    //-------------------------------------------------------------------------------------
    FreeLoading(P236FINISHEDGOODTRANFERHScontext);
    final response = await Dio().post(
      "${server2}10GETDATAFROMJOBBINGAQC/GETDATA",
      data: {
        "HEADER": {
          "PLANT": QUERYDATASET.PLANT,
          "ORD_ST_DATE_FR":
              "${P236FINISHEDGOODTRANFERHSVAR.day}.${P236FINISHEDGOODTRANFERHSVAR.month}.${P236FINISHEDGOODTRANFERHSVAR.year}",
          "ORD_ST_DATE_TO":
              "${P236FINISHEDGOODTRANFERHSVAR.day_next}.${P236FINISHEDGOODTRANFERHSVAR.month_next}.${P236FINISHEDGOODTRANFERHSVAR.year_next}",
          "ORDER_TYPE": "",
          "PROD_SUP": ""
        },
        "PROC_ORD": [
          {"PROCESS_ORDER": "", "MATERIAL": ""}
        ]
      },
    );
    var input = [];
    // Navigator.pop(P19PROGRESSMAINcontext);
    if (response.statusCode == 200) {
      // print(response.statusCode);
      // print(response.data);
      var databuff = response.data;

      if (databuff['HEADER_INFO'].length > 0) {
        for (var i = 0; i < databuff['HEADER_INFO'].length; i++) {
          if (databuff['HEADER_INFO'][i]['LINK_PROC_ORDER'].toString() != '') {
            P236FINISHEDGOODTRANFERHSgetclass buffer =
                P236FINISHEDGOODTRANFERHSgetclass();

            buffer = (P236FINISHEDGOODTRANFERHSgetclass(
              PROCESS_ORDER:
                  databuff['HEADER_INFO'][i]['PROCESS_ORDER'].toString(),
              ORDER_TYPE: databuff['HEADER_INFO'][i]['ORDER_TYPE'].toString(),
              ORDER_TYPE_DESC:
                  databuff['HEADER_INFO'][i]['ORDER_TYPE_DESC'].toString(),
              PLANT: databuff['HEADER_INFO'][i]['PLANT'].toString(),
              MATERIAL: databuff['HEADER_INFO'][i]['MATERIAL'].toString(),
              MATERIAL_TEXT:
                  databuff['HEADER_INFO'][i]['MATERIAL_TEXT'].toString(),
              TOTAL_QTY: databuff['HEADER_INFO'][i]['TOTAL_QTY'].toString(),
              UOM: databuff['HEADER_INFO'][i]['UOM'].toString(),
              PROD_SUP: databuff['HEADER_INFO'][i]['PROD_SUP'].toString(),
              PROD_SUP_DESC:
                  databuff['HEADER_INFO'][i]['PROD_SUP_DESC'].toString(),
              BASIC_START_DATE:
                  databuff['HEADER_INFO'][i]['BASIC_START_DATE'].toString(),
              BASIC_FINISH_DATE:
                  databuff['HEADER_INFO'][i]['BASIC_FINISH_DATE'].toString(),
              ORDER_SEQ_NO:
                  databuff['HEADER_INFO'][i]['ORDER_SEQ_NO'].toString(),
              BATCH: databuff['HEADER_INFO'][i]['BATCH'].toString(),
              STGE_LOC: databuff['HEADER_INFO'][i]['STGE_LOC'].toString(),
              INSP_LOT: databuff['HEADER_INFO'][i]['INSP_LOT'].toString(),
              SYSTEM_STATUS:
                  databuff['HEADER_INFO'][i]['SYSTEM_STATUS'].toString(),
              OLD_MATERIAL:
                  databuff['HEADER_INFO'][i]['OLD_MATERIAL'].toString(),
            ));

            final response3 = await Dio().post(
              "${server2}10GETDATAFROMJOBBINGAQC/GETDATAGOODNOGOOD",
              data: {
                "PROCESS_ORDER": '00' + ConverstStr(buffer.PROCESS_ORDER),
              },
            );
            if (response3.statusCode == 200) {
              print(response3.statusCode);

              var databuffs = response3.data;
              // input = databuff;
              if (databuffs.length > 0) {
                buffer.GOOD = databuffs[0]['GOOD'].toString();
                buffer.NOGOOD = databuffs[0]['NOGOOD'].toString();
              }

              //   // Navigator.pop(P26PROGRESSMAINcontext);

              //   emit(output);
            }

            output.add(buffer);
          }
        }

        // Navigator.pop(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
        Navigator.pop(P236FINISHEDGOODTRANFERHScontext);
      } else {
        print("where is my server");
        Navigator.pop(P236FINISHEDGOODTRANFERHScontext);
      }
    }

    emit(output);
  }

  Future<void> _P236FINISHEDGOODTRANFERHSget_GET2(
      List<P236FINISHEDGOODTRANFERHSgetclass> toAdd,
      Emitter<List<P236FINISHEDGOODTRANFERHSgetclass>> emit) async {
    List<P236FINISHEDGOODTRANFERHSgetclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P236FINISHEDGOODTRANFERHSgetclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P236FINISHEDGOODTRANFERHSget_GET3(
      List<P236FINISHEDGOODTRANFERHSgetclass> toAdd,
      Emitter<List<P236FINISHEDGOODTRANFERHSgetclass>> emit) async {
    List<P236FINISHEDGOODTRANFERHSgetclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P236FINISHEDGOODTRANFERHSgetclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P236FINISHEDGOODTRANFERHSget_FLUSH(
      List<P236FINISHEDGOODTRANFERHSgetclass> toAdd,
      Emitter<List<P236FINISHEDGOODTRANFERHSgetclass>> emit) async {
    List<P236FINISHEDGOODTRANFERHSgetclass> output = [];
    emit(output);
  }
}

class P236FINISHEDGOODTRANFERHSgetclass {
  P236FINISHEDGOODTRANFERHSgetclass({
    this.PROCESS_ORDER = '',
    this.ORDER_TYPE = '',
    this.ORDER_TYPE_DESC = '',
    this.PLANT = '',
    this.MATERIAL = '',
    this.MATERIAL_TEXT = '',
    this.TOTAL_QTY = '',
    this.UOM = '',
    this.PROD_SUP = '',
    this.PROD_SUP_DESC = '',
    this.BASIC_START_DATE = '',
    this.BASIC_FINISH_DATE = '',
    this.ORDER_SEQ_NO = '',
    this.BATCH = '',
    this.STGE_LOC = '',
    this.INSP_LOT = '',
    this.SYSTEM_STATUS = '',
    this.OLD_MATERIAL = '',
    this.check = false,
    this.GOOD = '',
    this.NOGOOD = '',

//
  });

  String PROCESS_ORDER;
  String ORDER_TYPE;
  String ORDER_TYPE_DESC;
  String PLANT;
  String MATERIAL;
  String MATERIAL_TEXT;
  String TOTAL_QTY;
  String UOM;
  String PROD_SUP;
  String PROD_SUP_DESC;
  String BASIC_START_DATE;
  String BASIC_FINISH_DATE;
  String ORDER_SEQ_NO;
  String BATCH;
  String STGE_LOC;
  String INSP_LOT;
  String SYSTEM_STATUS;
  String OLD_MATERIAL;
  bool check;
  String GOOD;
  String NOGOOD;

//
}

String savenull(input) {
  String output = '-';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
