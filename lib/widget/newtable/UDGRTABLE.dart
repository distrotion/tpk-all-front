import 'package:flutter/material.dart';

import 'tablebox.dart';

class UDGRTABLEtable extends StatelessWidget {
  const UDGRTABLEtable({super.key});

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
            Head: "PROCESS ORDER",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "PART NAME/NO",
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
            Head: "Received Lot",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "QTY",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "GOOD",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "NOGOOD",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "CNF",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "DLV",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "QC APPROVE",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "STATUS SAP",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "Force GR",
          ),
        ),
      ],
    );
  }
}

class UDGRTABLEitem extends StatelessWidget {
  UDGRTABLEitem({
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
    this.text10,
    this.text11,
    this.text12,
    this.text13,
    this.holding,
    this.Colorsstatus,
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
  String? text10;
  String? text11;
  String? text12;
  String? text13;
  bool? holding;
  Color? Colorsstatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text01,
            Colorss: holding ?? false
                ? Colors.grey.shade300
                : Colorsstatus ?? Colors.white,
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0_NB_BIG(
            Head: text02,
            Colorss: holding ?? false
                ? Colors.grey.shade300
                : Colorsstatus ?? Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text03,
            Colorss: holding ?? false
                ? Colors.grey.shade300
                : Colorsstatus ?? Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text04,
            Colorss: holding ?? false
                ? Colors.grey.shade300
                : Colorsstatus ?? Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text05,
            Colorss: holding ?? false
                ? Colors.grey.shade300
                : Colorsstatus ?? Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text06,
            Colorss: holding ?? false
                ? Colors.grey.shade300
                : Colorsstatus ?? Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text07,
            Colorss: holding ?? false
                ? Colors.grey.shade300
                : Colorsstatus ?? Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text08,
            Colorss: holding ?? false
                ? Colors.grey.shade300
                : Colorsstatus ?? Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text09,
            Colorss: holding ?? false
                ? Colors.grey.shade300
                : Colorsstatus ?? Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text10,
            Colorss: holding ?? false
                ? Colors.grey.shade300
                : Colorsstatus ?? Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text11,
            Colorss: holding ?? false
                ? Colors.grey.shade300
                : Colorsstatus ?? Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text12,
            Colorss: holding ?? false
                ? Colors.grey.shade300
                : Colorsstatus ?? Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text13,
            Colorss: holding ?? false
                ? Colors.grey.shade300
                : Colorsstatus ?? Colors.white,
          ),
        ),
      ],
    );
  }
}
