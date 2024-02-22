import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String boardNumber = "";

  void calculateResult() {
    try {
      List<String> numbers = boardNumber.split(RegExp(r'[-+*/]'));
      List<String> operators = boardNumber.split(RegExp(r'[0-9]'));
      operators.removeWhere((element) => element.isEmpty);

      double result = double.parse(numbers[0]);
      for (int i = 0; i < operators.length; i++) {
        double operand = double.parse(numbers[i + 1]);
        if (operators[i] == '+') {
          result += operand;
        } else if (operators[i] == '-') {
          result -= operand;
        } else if (operators[i] == '*') {
          result *= operand;
        } else if (operators[i] == '/') {
          result /= operand;
        }
      }

      setState(() {
        boardNumber = result.toString();
      });
    } catch (e) {
      setState(() {
        boardNumber = "Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 123, 124, 1),
        title: const Text('Calculator'),
        leading: const Icon(Icons.calculate),
        bottom: PreferredSize(
          preferredSize: const Size(0, 130),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                
                children: [
                                const SizedBox(width: 25,),
                  Text(
                    boardNumber,
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox
            // ( width: double.infinity,
            // height: 100,
            //   child: Container(alignment: Alignment.centerLeft,
            //                 color: Color.fromRGBO(0, 123, 124, 1),
              
            //     child: Text(
            //       boardNumber,
            //       style: const TextStyle(fontSize: 30, color: Colors.white),
            //     ),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NumberButton(
                  number: '1',
                  func: () {
                    setState(() {
                      boardNumber += '1';
                      print(boardNumber);
                    });
                  },
                ),
                NumberButton(
                  number: '2',
                  func: () {
                    setState(() {
                      boardNumber += '2';
                      print(boardNumber);
                    });
                  },
                ),
                NumberButton(
                  number: '3',
                  func: () {
                    setState(() {
                      boardNumber += '3';
                      print(boardNumber);
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      boardNumber += '+';
                      print(boardNumber);
                    });
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 123, 124, 1),
                        borderRadius: BorderRadiusDirectional.circular(18)),
                    child: const Center(
                        child: Text(
                      "+",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NumberButton(
                  number: '4',
                  func: () {
                    setState(() {
                      boardNumber += '4';
                      print(boardNumber);
                    });
                  },
                ),
                NumberButton(
                  number: '5',
                  func: () {
                    setState(() {
                      boardNumber += '5';
                      print(boardNumber);
                    });
                  },
                ),
                NumberButton(
                  number: '6',
                  func: () {
                    setState(() {
                      boardNumber += '6';
                      print(boardNumber);
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      boardNumber += '-';
                      print(boardNumber);
                    });
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 123, 124, 1),
                        borderRadius: BorderRadiusDirectional.circular(18)),
                    child: const Center(
                        child: Text(
                      "-",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NumberButton(
                  number: '7',
                  func: () {
                    setState(() {
                      boardNumber += '7';
                      print(boardNumber);
                    });
                  },
                ),
                NumberButton(
                  number: '8',
                  func: () {
                    setState(() {
                      boardNumber += '8';
                      print(boardNumber);
                    });
                  },
                ),
                NumberButton(
                  number: '9',
                  func: () {
                    setState(() {
                      boardNumber += '9';
                      print(boardNumber);
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      boardNumber += 'x';
                      print(boardNumber);
                    });
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 123, 124, 1),
                        borderRadius: BorderRadiusDirectional.circular(18)),
                    child: const Center(
                        child: Text(
                      "X",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NumberButton(
                  number: '#',
                  func: () {
                    setState(() {
                      print(boardNumber);
                    });
                  },
                ),
                NumberButton(
                  number: '0',
                  func: () {
                    setState(() {
                      boardNumber += '0';
                      print(boardNumber);
                    });
                  },
                ),
                NumberButton(
                  number: '/',
                  func: () {
                    setState(() {
                      boardNumber += '/';
                      print(boardNumber);
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    calculateResult();
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadiusDirectional.circular(18)),
                    child: const Center(
                        child: Text(
                      "=",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  const NumberButton({
    Key? key,
    required this.number,
    required this.func,
  }) : super(key: key);

  final String number;
  final void Function() func;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: CircleAvatar(
        radius: 31,
        backgroundColor: Colors.black,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 25,
              color: Color.fromRGBO(0, 123, 124, 1),
            ),
          ),
        ),
      ),
    );
  }
}
