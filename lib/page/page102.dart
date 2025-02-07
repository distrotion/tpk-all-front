// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'P102SELECTCHEMLIST/P102SELECTCHEMLISTmain.dart';

//---------------------------------------------------------

class Page102 extends StatelessWidget {
  const Page102({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page102Body();
  }
}

class Page102Body extends StatelessWidget {
  Page102Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return P102SELECTCHEMLISTmain();
  }
}
