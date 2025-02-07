// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'P101SELECTBRANCH/P101SELECTBRANCHmain.dart';

//---------------------------------------------------------

class Page101 extends StatelessWidget {
  const Page101({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page101Body();
  }
}

class Page101Body extends StatelessWidget {
  Page101Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return P101SELECTBRANCHmain();
  }
}
