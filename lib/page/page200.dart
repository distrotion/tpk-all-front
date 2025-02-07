// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'P200SELECTTYPE/P200SELECTTYPEmain.dart';

//---------------------------------------------------------

class Page200 extends StatelessWidget {
  const Page200({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page200Body();
  }
}

class Page200Body extends StatelessWidget {
  Page200Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return P200SELECTTYPEmain();
  }
}
