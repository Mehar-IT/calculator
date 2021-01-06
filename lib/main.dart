import 'package:flutter/material.dart';

void main() => runApp(SimpleCalculator());

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  var result = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Calcuclator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: firstController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter First Number'),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: secondController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter Second Number'),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Add'),
                    onPressed: () {
                      add();
                    },
                  ),
                  RaisedButton(
                    child: Text('Sub'),
                    onPressed: () {
                      sub();
                    },
                  ),
                  RaisedButton(
                    child: Text('Div'),
                    onPressed: () {
                      div();
                    },
                  ),
                  RaisedButton(
                    child: Text('Mul'),
                    onPressed: () {
                      mul();
                    },
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Answer is: $result',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                child: Text('Reset'),
                onPressed: () {
                  setState(() {
                    firstController.text = '';
                    secondController.text = '';
                    result = 0;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void add() {
    setState(() {
      result =
          int.parse(firstController.text) + int.parse(secondController.text);
    });
  }

  void sub() {
    setState(() {
      result =
          int.parse(firstController.text) - int.parse(secondController.text);
    });
  }

  void div() {
    setState(() {
      result =
          (int.parse(firstController.text) ~/ int.parse(secondController.text))
              .toInt();
    });
  }

  void mul() {
    setState(() {
      result =
          int.parse(firstController.text) * int.parse(secondController.text);
    });
  }
}
