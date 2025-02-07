import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/global.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

abstract class P19PROGRESSGETDATA_Event {}

class P19PROGRESSGETDATA_GET extends P19PROGRESSGETDATA_Event {}

class P19PROGRESSGETDATA_GET2 extends P19PROGRESSGETDATA_Event {}

class P19PROGRESSGETDATA_GET3 extends P19PROGRESSGETDATA_Event {}

class P19PROGRESSGETDATA_FLUSH extends P19PROGRESSGETDATA_Event {}

class P19PROGRESSGETDATA_Bloc
    extends Bloc<P19PROGRESSGETDATA_Event, List<P19PROGRESSGETDATAclass>> {
  P19PROGRESSGETDATA_Bloc() : super([]) {
    on<P19PROGRESSGETDATA_GET>((event, emit) {
      return _P19PROGRESSGETDATA_GET([], emit);
    });

    on<P19PROGRESSGETDATA_GET2>((event, emit) {
      return _P19PROGRESSGETDATA_GET2([], emit);
    });
    on<P19PROGRESSGETDATA_GET3>((event, emit) {
      return _P19PROGRESSGETDATA_GET3([], emit);
    });
    on<P19PROGRESSGETDATA_FLUSH>((event, emit) {
      return _P19PROGRESSGETDATA_FLUSH([], emit);
    });
  }

  Future<void> _P19PROGRESSGETDATA_GET(List<P19PROGRESSGETDATAclass> toAdd,
      Emitter<List<P19PROGRESSGETDATAclass>> emit) async {
    FreeLoadingTan(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
    List<P19PROGRESSGETDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    final response = await Dio().post(
      "${server2}datacentertest/getsoi8set",
      data: {"PLANT": USERDATA.PLANT},
    );
    var input = [];
    // Navigator.pop(P19PROGRESSMAINcontext);
    if (response.statusCode == 200) {
      print(response.statusCode);
      // print(response.data);
      var databuff = response.data;
      input = [databuff];
      // print(input);

      List<P19PROGRESSGETDATAclass> outputdata = input.map((dataActual) {
        return P19PROGRESSGETDATAclass(
          PM1ORDER: savenull(dataActual['pm1_order']),
          PM2ORDER: savenull(dataActual['pm2_order']),
          PM3ORDER: savenull(dataActual['pm3_order']),
          PM4ORDER: savenull(dataActual['pm4_order']),
          PM5ORDER: savenull(dataActual['pm5_order']),
          PM6ORDER: savenull(dataActual['pm6_order']),
          PM7ORDER: savenull(dataActual['pm7_order']),
          PM8ORDER: savenull(dataActual['pm8_order']),
          PM9ORDER: savenull(dataActual['pm9_order']),
          PM10ORDER: savenull(dataActual['pm10_order']),
          PM11ORDER: savenull(dataActual['pm11_order']),
          PM12ORDER: savenull(dataActual['pm12_order']),
          PM13ORDER: savenull(dataActual['pm13_order']),
          PM14ORDER: savenull(dataActual['pm14_order']),
          PM15ORDER: savenull(dataActual['pm15_order']),
          PM16ORDER: savenull(dataActual['pm16_order']),
          PM17ORDER: savenull(dataActual['pm17_order']),
        );
      }).toList();

      output = outputdata;
      Navigator.pop(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
      emit(output);
    } else {
      print("where is my server");
      output = [];
      emit(output);
    }
  }

  Future<void> _P19PROGRESSGETDATA_GET2(List<P19PROGRESSGETDATAclass> toAdd,
      Emitter<List<P19PROGRESSGETDATAclass>> emit) async {
    List<P19PROGRESSGETDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P19PROGRESSGETDATAclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P19PROGRESSGETDATA_GET3(List<P19PROGRESSGETDATAclass> toAdd,
      Emitter<List<P19PROGRESSGETDATAclass>> emit) async {
    List<P19PROGRESSGETDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P19PROGRESSGETDATAclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P19PROGRESSGETDATA_FLUSH(List<P19PROGRESSGETDATAclass> toAdd,
      Emitter<List<P19PROGRESSGETDATAclass>> emit) async {
    List<P19PROGRESSGETDATAclass> output = [];
    emit(output);
  }
}

class P19PROGRESSGETDATAclass {
  P19PROGRESSGETDATAclass({
    this.PM1ORDER = '',
    this.PM2ORDER = '',
    this.PM3ORDER = '',
    this.PM4ORDER = '',
    this.PM5ORDER = '',
    this.PM6ORDER = '',
    this.PM7ORDER = '',
    this.PM8ORDER = '',
    this.PM9ORDER = '',
    this.PM10ORDER = '',
    this.PM11ORDER = '',
    this.PM12ORDER = '',
    this.PM13ORDER = '',
    this.PM14ORDER = '',
    this.PM15ORDER = '',
    this.PM16ORDER = '',
    this.PM17ORDER = '',
  });

  String PM1ORDER;
  String PM2ORDER;
  String PM3ORDER;
  String PM4ORDER;
  String PM5ORDER;
  String PM6ORDER;
  String PM7ORDER;
  String PM8ORDER;
  String PM9ORDER;
  String PM10ORDER;
  String PM11ORDER;
  String PM12ORDER;
  String PM13ORDER;
  String PM14ORDER;
  String PM15ORDER;
  String PM16ORDER;
  String PM17ORDER;
}

String savenull(input) {
  String output = '-';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
