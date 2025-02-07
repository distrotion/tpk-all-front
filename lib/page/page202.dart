// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'P202SELECTCHEMLIST/P202SELECTCHEMLISTmain.dart';

//---------------------------------------------------------

class Page202 extends StatelessWidget {
  const Page202({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page202Body();
  }
}

class Page202Body extends StatelessWidget {
  Page202Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return P202SELECTCHEMLISTmain();
  }
}
