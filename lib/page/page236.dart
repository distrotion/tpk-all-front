// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P236-01-P236FINISHEDGOODTRANFERHSget.dart';

import 'P236FINISHEDGOODTRANFERHS/P236FINISHEDGOODTRANFERHS.dart';

//---------------------------------------------------------

class Page236 extends StatelessWidget {
  const Page236({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page236BlocTableBody();
  }
}

class Page236BlocTableBody extends StatelessWidget {
  const Page236BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P236FINISHEDGOODTRANFERHSget_Bloc(),
        child: BlocBuilder<P236FINISHEDGOODTRANFERHSget_Bloc,
            List<P236FINISHEDGOODTRANFERHSgetclass>>(
          builder: (context, data) {
            return Page236Body(
              data: data,
            );
          },
        ));
  }
}

class Page236Body extends StatelessWidget {
  Page236Body({
    super.key,
    this.data,
  });
  List<P236FINISHEDGOODTRANFERHSgetclass>? data;
  @override
  Widget build(BuildContext context) {
    return P236FINISHEDGOODTRANFERHS(
      data: data,
    );
  }
}
