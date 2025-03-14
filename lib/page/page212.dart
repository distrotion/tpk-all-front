// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P211-01-P211CHEMPLANINGget.dart';
import 'P202SELECTCHEMLIST/P202SELECTCHEMLISTmain.dart';
import 'P203SELECTPLANT/P203SELECTPLANTmain.dart';
import 'P204HANDSLIST/P204HANDSLISTmain.dart';
import 'P211CHEMPLANING/P211CHEMPLANING.dart';

//---------------------------------------------------------

class Page211 extends StatelessWidget {
  const Page211({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page211Body();
  }
}

class Page211Body extends StatelessWidget {
  Page211Body({
    super.key,
    this.data,
  });
  List<P211CHEMPLANINGgetclass>? data;

  @override
  Widget build(BuildContext context) {
    return P211CHEMPLANING(
      data: data,
    );
  }
}
