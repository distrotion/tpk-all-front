// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'P201SELECTBRANCH/P201SELECTBRANCHmain.dart';

//---------------------------------------------------------

class Page201 extends StatelessWidget {
  const Page201({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page201Body();
  }
}

class Page201Body extends StatelessWidget {
  Page201Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return P201SELECTBRANCHmain();
  }
}
