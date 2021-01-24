import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple[500],
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.black12,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 4;
  int rightDiceNum = 6;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      leftDiceNum = Random().nextInt(5) + 1;
                      if (leftDiceNum == rightDiceNum) {
                        print('Yay');
                      }
                    });
                  },
                  child: Image.asset('images/dice$leftDiceNum.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      rightDiceNum = Random().nextInt(5) + 1;
                      if (leftDiceNum == rightDiceNum) {
                        print('Yay');
                        return Card(
                          child: ListTile(
                              leading: Icon(Icons.assistant_photo_sharp),
                              title: Text(
                                'Yay! We got the same numbers.',
                              )),
                        );
                      } else {
                        return Container();
                      }
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNum.png'),
                ),
              ),
            ],
          ),
          // Row(
          //   children: [
          //     Card(
          //       child: ListTile(
          //           leading: Icon(Icons.assistant_photo_sharp),
          //           title: Text(
          //             'Yay! We got the same numbers.',
          //           )),
          //     )
          //   ],
          // )

    );
  }
}
