import 'package:flutter/material.dart';

import 'tablebox.dart';

class QCSAPMASTERtable extends StatelessWidget {
  QCSAPMASTERtable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "MKMNR",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "Material",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "SORTFELD",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "KURZTEXT",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "AQC ITEM",
          ),
        ),
      ],
    );
  }
}

class QCSAPMASTERitem extends StatelessWidget {
  QCSAPMASTERitem({
    super.key,
    this.text01,
    this.text02,
    this.text03,
    this.text04,
    this.text05,
    this.text06,
    this.text07,
    this.text08,
    this.text09,
    this.setupreturn,
  });

  String? text01;
  String? text02;
  String? text03;
  String? text04;
  String? text05;
  String? text06;
  String? text07;
  String? text08;
  String? text09;
  Function(String)? setupreturn;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text01,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text02,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text03,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text04,
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              if (setupreturn != null) {
                setupreturn!(text01 ?? '');
              }
            },
            child: rowbox_type0(
              Head: text05,
            ),
          ),
        ),
      ],
    );
  }
}
