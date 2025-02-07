// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'P202SELECTCHEMLIST/P202SELECTCHEMLISTmain.dart';
import 'P203SELECTPLANT/P203SELECTPLANTmain.dart';

//---------------------------------------------------------

class Page203 extends StatelessWidget {
  const Page203({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page203Body();
  }
}

class Page203Body extends StatelessWidget {
  Page203Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return P203SELECTPLANTmain();
  }
}
