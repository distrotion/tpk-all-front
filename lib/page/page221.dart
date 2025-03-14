// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P221-01-P221PRODUCTIONCONFIRMATIONget.dart';
import 'P202SELECTCHEMLIST/P202SELECTCHEMLISTmain.dart';
import 'P203SELECTPLANT/P203SELECTPLANTmain.dart';
import 'P204HANDSLIST/P204HANDSLISTmain.dart';
import 'P221PRODUCTIONCONFIRMATION/P221PRODUCTIONCONFIRMATION.dart';

//---------------------------------------------------------

class Page221 extends StatelessWidget {
  const Page221({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page221BlocTableBody();
  }
}

class Page221BlocTableBody extends StatelessWidget {
  const Page221BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P221PRODUCTIONCONFIRMATIONget_Bloc(),
        child: BlocBuilder<P221PRODUCTIONCONFIRMATIONget_Bloc,
            List<P221PRODUCTIONCONFIRMATIONgetclass>>(
          builder: (context, data) {
            return Page221Body(
              data: data,
            );
          },
        ));
  }
}

class Page221Body extends StatelessWidget {
  Page221Body({
    super.key,
    this.data,
  });
  List<P221PRODUCTIONCONFIRMATIONgetclass>? data;
  @override
  Widget build(BuildContext context) {
    return P221PRODUCTIONCONFIRMATION(
      data: data,
    );
  }
}
