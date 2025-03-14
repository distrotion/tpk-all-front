// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P301-01-P301QMMASTERget.dart';
import 'P202SELECTCHEMLIST/P202SELECTCHEMLISTmain.dart';
import 'P203SELECTPLANT/P203SELECTPLANTmain.dart';
import 'P204HANDSLIST/P204HANDSLISTmain.dart';
import 'P211CHEMPLANING/P211CHEMPLANING.dart';
import 'P301QMMASTER/P301QMMASTERMAIN.dart';

//---------------------------------------------------------

class Page301 extends StatelessWidget {
  const Page301({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page301BlocTableBody();
  }
}

class Page301BlocTableBody extends StatelessWidget {
  const Page301BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P301QMMASTERget_Bloc(),
        child: BlocBuilder<P301QMMASTERget_Bloc, List<P301QMMASTERgetclass>>(
          builder: (context, data) {
            return Page301Body(
              data: data,
            );
          },
        ));
  }
}

class Page301Body extends StatelessWidget {
  Page301Body({
    super.key,
    this.data,
  });
  List<P301QMMASTERgetclass>? data;
  @override
  Widget build(BuildContext context) {
    return P301QMMASTERMAIN(
      data: data,
    );
  }
}
