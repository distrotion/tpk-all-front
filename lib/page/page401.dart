// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P401-01-P401QCFNQCget.dart';
import 'P401QCFN/P401QCFNMAIN.dart';

//---------------------------------------------------------

class Page401 extends StatelessWidget {
  const Page401({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page401BlocTableBody();
  }
}

class Page401BlocTableBody extends StatelessWidget {
  const Page401BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P401QCFNget_Bloc(),
        child: BlocBuilder<P401QCFNget_Bloc, List<P401QCFNgetclass>>(
          builder: (context, data) {
            return Page401Body(
              data: data,
            );
          },
        ));
  }
}

class Page401Body extends StatelessWidget {
  Page401Body({
    super.key,
    this.data,
  });
  List<P401QCFNgetclass>? data;
  @override
  Widget build(BuildContext context) {
    return P401QCFNMAIN(
      data: data,
    );
  }
}
