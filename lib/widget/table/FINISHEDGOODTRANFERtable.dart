import 'package:flutter/material.dart';

import 'tablebox.dart';

class FINISHEDGOODTRANFERtable extends StatelessWidget {
  const FINISHEDGOODTRANFERtable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
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
        8: FixedColumnWidth(100.0),
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
                            'Yield',
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
                            'Packaging',
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
                            'Prod Confirm',
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
                            'Store Confirm',
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
    );
  }
}

class FINISHEDGOODTRANFERitem extends StatelessWidget {
  FINISHEDGOODTRANFERitem({
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
    this.RETURN1,
    this.RETURN2,
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
  Function(String)? RETURN1;
  Function(String)? RETURN2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 100,
          child: InkWell(
            onTap: () {
              if (RETURN1 != null) {
                RETURN1!("RETURN1");
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.black),
                ),
              ),
              child: Center(
                child: SelectableText(
                  text01 ?? '',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 100,
          child: InkWell(
            onTap: () {
              if (RETURN1 != null) {
                RETURN1!("RETURN1");
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.black),
                ),
              ),
              child: Center(
                child: Text(
                  text02 ?? '',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 400,
          child: InkWell(
            onTap: () {
              if (RETURN1 != null) {
                RETURN1!("RETURN1");
              }
            },
            child: SizedBox(
              height: 30,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('   ${text03}'),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 100,
          child: InkWell(
            onTap: () {
              if (RETURN1 != null) {
                RETURN1!("RETURN1");
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.black),
                ),
              ),
              child: Center(
                child: Text(
                  text04 ?? '',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 100,
          child: InkWell(
            onTap: () {
              if (RETURN1 != null) {
                RETURN1!("RETURN1");
              }
            },
            child: Container(
              height: 30,
              child: Center(child: Text(text05 ?? '')),
            ),
          ),
        ),
        Expanded(
          flex: 100,
          child: InkWell(
            onTap: () {
              if (RETURN1 != null) {
                RETURN1!("RETURN1");
              }
            },
            child: SizedBox(
              height: 30,
              child: Center(
                child: Text(text06 ?? ''),
              ),
            ),
          ),
        ),

        Expanded(
          flex: 100,
          child: InkWell(
            onTap: () {
              if (RETURN1 != null) {
                RETURN1!("RETURN1");
              }
            },
            child: SizedBox(
              height: 30,
              child: Center(
                child: Text(text07 ?? ''),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 100,
          child: InkWell(
            onTap: () {
              if (RETURN1 != null) {
                RETURN1!("RETURN1");
              }
            },
            child: SizedBox(
              height: 30,
              child: Center(
                child: Text(text08 ?? ''),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 100,
          child: InkWell(
            onTap: () {
              if (RETURN2 != null) {
                RETURN2!("RETURN2");
              }
            },
            child: Container(
              color: (text09) == 'Complete' ? Colors.green : Colors.white,
              height: 30,
              child: Center(
                child: Text(text09 ?? ''),
              ),
            ),
          ),
        ),
        // Expanded(
        //   flex: 100,
        //   child: SizedBox(
        //     height: 30,
        //     child: Center(
        //       child: Text(_datain[i].MAT),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
