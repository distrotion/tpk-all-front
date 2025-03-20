import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/global.dart';
import '../../page/P221PRODUCTIONCONFIRMATIONSM/P221PRODUCTIONCONFIRMATIONSMVAR.dart';
import '../../page/P310CHEMTANK/P310CHEMTANKMAIN.dart';
import '../../page/P310CHEMTANK/P310CHEMTANKVAR.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P310CHEMTANKGETDATA_Event {}

class P310CHEMTANKGETDATA_GET extends P310CHEMTANKGETDATA_Event {}

class P310CHEMTANKGETDATA_GET2 extends P310CHEMTANKGETDATA_Event {}

class P310CHEMTANKGETDATA_GET3 extends P310CHEMTANKGETDATA_Event {}

class P310CHEMTANKGETDATA_FLUSH extends P310CHEMTANKGETDATA_Event {}

class P310CHEMTANKGETDATA_Bloc
    extends Bloc<P310CHEMTANKGETDATA_Event, List<P310CHEMTANKGETDATAclass>> {
  P310CHEMTANKGETDATA_Bloc() : super([]) {
    on<P310CHEMTANKGETDATA_GET>((event, emit) {
      return _P310CHEMTANKGETDATA_GET([], emit);
    });

    on<P310CHEMTANKGETDATA_GET2>((event, emit) {
      return _P310CHEMTANKGETDATA_GET2([], emit);
    });
    on<P310CHEMTANKGETDATA_GET3>((event, emit) {
      return _P310CHEMTANKGETDATA_GET3([], emit);
    });
    on<P310CHEMTANKGETDATA_FLUSH>((event, emit) {
      return _P310CHEMTANKGETDATA_FLUSH([], emit);
    });
  }

  Future<void> _P310CHEMTANKGETDATA_GET(List<P310CHEMTANKGETDATAclass> toAdd,
      Emitter<List<P310CHEMTANKGETDATAclass>> emit) async {
    FreeLoadingTan(P310CHEMTANKMAINcontext);
    List<P310CHEMTANKGETDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    final response = await Dio().post(
      // "${server3}datacentertest/getsoi8order",
      "${server2}datacentertest/getsoi8order-ro",
      //
      data: {
        "PLANT": P310CHEMTANKVAR.PLANT,
        "ORDER": P310CHEMTANKVAR.ORDER.substring(4, 10),
        // "PLANT": "liquid",
        // "ORDER": "227276"
      },
    );
    var input = [];
    if (response.statusCode == 200) {
      print(response.statusCode);
      // print(response.data);
      var databuff = response.data;
      input = databuff;

      List<P310CHEMTANKGETDATAclass> outputdata = input
          .where((dataActual) =>
              dataActual['StrChemical'] != 'END' &&
              dataActual['StrBarcode'] != 'END')
          .map((dataActual) {
        return P310CHEMTANKGETDATAclass(
          ID: savenull(dataActual['ID']),
          TIMESTART: savenull(dataActual['RecordTimeStart']),
          ORDER: savenull(dataActual['NumOrder']),
          TANK: savenull(dataActual['NumTank']),
          NUMMODE: savenull(dataActual['NumMode']),
          CHEMICALNAME: savenull(dataActual['StrChemical']),
          LOT: savenull(dataActual['StrLotNum']),
          BARCODE: savenull(dataActual['StrBarcode']),
          NUMMODEOPER: savenull(dataActual['NumModeOper']),
          STEP: savenull(dataActual['NumStep']),
          SP: savenull(dataActual['NumSp']),
          ACTUAL: savenull(dataActual['NumAct']),
          TEMP: savenull(dataActual['NumTemp']),
          DTDATE: savenull(dataActual['dtDate']),
        );
      }).toList();
      Navigator.pop(P310CHEMTANKMAINcontext);

      output = outputdata;
      emit(output);
    } else {
      print("where is my server");
      output = [];
      emit(output);
    }
  }

  Future<void> _P310CHEMTANKGETDATA_GET2(List<P310CHEMTANKGETDATAclass> toAdd,
      Emitter<List<P310CHEMTANKGETDATAclass>> emit) async {
    List<P310CHEMTANKGETDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P310CHEMTANKGETDATAclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P310CHEMTANKGETDATA_GET3(List<P310CHEMTANKGETDATAclass> toAdd,
      Emitter<List<P310CHEMTANKGETDATAclass>> emit) async {
    List<P310CHEMTANKGETDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P310CHEMTANKGETDATAclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P310CHEMTANKGETDATA_FLUSH(List<P310CHEMTANKGETDATAclass> toAdd,
      Emitter<List<P310CHEMTANKGETDATAclass>> emit) async {
    List<P310CHEMTANKGETDATAclass> output = [];
    emit(output);
  }
}

class P310CHEMTANKGETDATAclass {
  P310CHEMTANKGETDATAclass({
    this.ID = '',
    this.TIMESTART = '',
    this.ORDER = '',
    this.TANK = '',
    this.NUMMODE = '',
    this.CHEMICALNAME = '',
    this.LOT = '',
    this.BARCODE = '',
    this.NUMMODEOPER = '',
    this.STEP = '',
    this.SP = '',
    this.ACTUAL = '',
    this.TEMP = '',
    this.DTDATE = '',
  });

  String ID;
  String TIMESTART;
  String ORDER;
  String TANK;
  String NUMMODE;
  String CHEMICALNAME;
  String LOT;
  String BARCODE;
  String NUMMODEOPER;
  String STEP;
  String SP;
  String ACTUAL;
  String TEMP;
  String DTDATE;
}

String savenull(input) {
  String output = '-';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
