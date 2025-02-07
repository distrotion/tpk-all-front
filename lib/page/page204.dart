// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'P202SELECTCHEMLIST/P202SELECTCHEMLISTmain.dart';
import 'P203SELECTPLANT/P203SELECTPLANTmain.dart';
import 'P204HANDSLIST/P204HANDSLISTmain.dart';

//---------------------------------------------------------

class Page204 extends StatelessWidget {
  const Page204({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page204Body();
  }
}

class Page204Body extends StatelessWidget {
  Page204Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return P204HANDSLISTmain();
  }
}
