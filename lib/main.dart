import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/widgets.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple[500],
        appBar: AppBar(
          title: Text('Dicee', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
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
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      leftDiceNum = Random().nextInt(5) + 1;
                      if (leftDiceNum == rightDiceNum) {
                        _visible = false;
                      } else {
                        _visible = true;
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
                        _visible = false;
                      } else {
                        _visible = true;
                      }
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNum.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Visibility(
            visible: _visible,
            child: Card(
              color: Colors.white,
              child: ListTile(
                  leading: Icon(Icons.api_outlined),
                  title: Text(
                    'Left Dice Number:  $leftDiceNum',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Lobster',
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: _visible,
            child: Card(
              color: Colors.white,
              child: ListTile(
                  leading: Icon(Icons.api_outlined),
                  title: Text(
                    'Right Dice Number:  $rightDiceNum',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Lobster',
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: !_visible,
            child: Card(
              child: ListTile(
                  tileColor: Colors.lightGreenAccent,
                  title: Center(
                    child: Text(
                      'Yay! We got the same numbers.',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontFamily: 'Lobster',
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
