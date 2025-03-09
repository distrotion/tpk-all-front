import 'package:flutter/material.dart';

import 'tablebox.dart';

class QMMAASTERtable extends StatelessWidget {
  const QMMAASTERtable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "MATCP",
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "CUS NAME",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "PART NAME",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "PART NO",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "CHARG",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "CUST LOT",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "QTY",
          ),
        ),
      ],
    );
  }
}

class QMMAASTERitem extends StatelessWidget {
  QMMAASTERitem({
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
          flex: 2,
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
          child: rowbox_type0(
            Head: text05,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text06,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text07,
          ),
        ),
      ],
    );
  }
}
