// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P302-01-P302QMMASTERHSget.dart';
import 'P302QMMASTERHS/P302QMMASTERHSMAIN.dart';

//---------------------------------------------------------

class Page302 extends StatelessWidget {
  const Page302({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page302BlocTableBody();
  }
}

class Page302BlocTableBody extends StatelessWidget {
  const Page302BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P302QMMASTERHSget_Bloc(),
        child:
            BlocBuilder<P302QMMASTERHSget_Bloc, List<P302QMMASTERHSgetclass>>(
          builder: (context, data) {
            return Page302Body(
              data: data,
            );
          },
        ));
  }
}

class Page302Body extends StatelessWidget {
  Page302Body({
    super.key,
    this.data,
  });
  List<P302QMMASTERHSgetclass>? data;
  @override
  Widget build(BuildContext context) {
    return P302QMMASTERHSMAIN(
      data: data,
    );
  }
}
