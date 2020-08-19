import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = "";
  String _finalResult = "";

  void _calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height * 12;
      double weight = double.parse(_weightController.text);
      if ((_ageController.text.isNotEmpty || age > 0) &&
          (_heightController.text.isNotEmpty || inches > 0) &&
          (_weightController.text.isNotEmpty && weight > 0)) {
        result = weight / (inches * inches) * 703;
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "UnderWeight";
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          _resultReading = "Great Shape!";
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) > 25.0 &&
            result < 30) {
          _resultReading = "Overweight";
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 30) {
          _resultReading = "Obese";
          print(_resultReading);
        }
      } else {
        result = 0.0;
      }
    });

    _finalResult = "Your BMI: ${result.toStringAsExponential(1)}  ";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BMI'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset(
              'images/111 bmilogo.png',
              height: 85.0,
              width: 75.0,
            ),
            new Container(
                margin: const EdgeInsets.all(3.0),
                height: 300.0,
                width: 300.0,
                color: Colors.grey.shade300,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: 'Age',
                        hintText: 'eg: 34',
                        icon: new Icon(Icons.person_outline),
                      ),
                    ),
                    new TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: 'Height in feet',
                        hintText: 'eg: 6.5',
                        icon: new Icon(Icons.insert_chart),
                      ),
                    ),
                    new TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: 'Weight in lbs',
                        hintText: 'eg: 180',
                        icon: new Icon(Icons.line_weight),
                      ),
                    ),
                    new Padding(padding: new EdgeInsets.all(10.6)),
                    new Container(
                      alignment: Alignment.center,
                      child: new RaisedButton(
                        onPressed: _calculateBMI,
                        color: Colors.pinkAccent,
                        child: new Text('Claculate'),
                        textColor: Colors.white,
                      ),
                    )
                  ],
                )),
            new Padding(padding: new EdgeInsets.all(10.6)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'BMI: $_finalResult',
                  style: new TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),
                ),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new Text(
                  "$_resultReading",
                  style: new TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.9),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
