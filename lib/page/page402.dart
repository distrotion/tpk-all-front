// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P402-01-P402UDGRget.dart';
import 'P402UDGR/P402UDGRMAIN.dart';

//---------------------------------------------------------

class Page402 extends StatelessWidget {
  const Page402({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page402BlocTableBody();
  }
}

class Page402BlocTableBody extends StatelessWidget {
  const Page402BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P402UDGRget_Bloc(),
        child: BlocBuilder<P402UDGRget_Bloc, List<P402UDGRgetclass>>(
          builder: (context, data) {
            return Page402Body(
              data: data,
            );
          },
        ));
  }
}

class Page402Body extends StatelessWidget {
  Page402Body({
    super.key,
    this.data,
  });
  List<P402UDGRgetclass>? data;
  @override
  Widget build(BuildContext context) {
    return P402UDGRMAIN(
      data: data,
    );
  }
}
