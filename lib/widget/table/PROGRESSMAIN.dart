import 'package:flutter/material.dart';

import 'tablebox.dart';

class PROGRESSMAINtable extends StatelessWidget {
  const PROGRESSMAINtable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Table(
          border: TableBorder.all(),
          columnWidths: const {
            0: FixedColumnWidth(100.0),
            1: FixedColumnWidth(100.0),
            2: FixedColumnWidth(400.0),
            3: FixedColumnWidth(100.0),
            4: FixedColumnWidth(100.0),
            5: FixedColumnWidth(100.0),
            6: FixedColumnWidth(100.0),
            7: FixedColumnWidth(100.0),
          },
          children: [
            TableRow(
              children: [
                TableCell(
                  child: SizedBox(
                    height: 50,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: 50,
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                'ORDER',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TableCell(
                  child: SizedBox(
                    height: 50,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: 50,
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                'Product NO.',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TableCell(
                  child: SizedBox(
                    height: 50,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: 50,
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                'CHEMICAL',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TableCell(
                  child: SizedBox(
                    height: 50,
                    child: Positioned(
                      bottom: 0,
                      left: 0,
                      width: 101,
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border(
                            right: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'PLANT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: SizedBox(
                    height: 50,
                    child: Positioned(
                      bottom: 0,
                      left: 0,
                      width: 101,
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border(
                            right: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'TANK',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: SizedBox(
                    height: 50,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: 50,
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                'LOT. NO',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TableCell(
                  child: SizedBox(
                    height: 50,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: 50,
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                'QTY',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TableCell(
                  child: SizedBox(
                    height: 50,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: 50,
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                'STATUS',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class PROGRESSMAINitem extends StatelessWidget {
  PROGRESSMAINitem({
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
          flex: 2,
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
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: text08,
          ),
        ),
      ],
    );
  }
}
