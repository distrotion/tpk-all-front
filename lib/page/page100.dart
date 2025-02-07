// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'P100SELECTTYPE/P100SELECTTYPEMAIN.dart';

//---------------------------------------------------------

class Page100 extends StatelessWidget {
  const Page100({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page100Body();
  }
}

class Page100Body extends StatelessWidget {
  Page100Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return P100SELECTTYPEmain();
  }
}
