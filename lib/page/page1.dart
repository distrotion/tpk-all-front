// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'P01SELECTUSERPURPOSE/P01SELECTUSERPURPOSEmain.dart';

//---------------------------------------------------------

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page1Body();
  }
}

class Page1Body extends StatelessWidget {
  Page1Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return P01SELECTUSERPURPOSEmain();
  }
}
