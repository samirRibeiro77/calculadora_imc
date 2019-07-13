import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var weightController = new TextEditingController();
  var heightController = new TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _infoText = "Informe seus dados!";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";

    setState(() {
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    var weight = double.parse(weightController.text);
    var height = double.parse(heightController.text) / 100;

    var imc = weight / pow(height, 2);

    if(imc < 18.6) {
      _infoText = "Abaixo do peso";
    }
    else if (imc >= 18.6 && imc < 24.9) {
      _infoText = "Peso ideal";
    }
    else if (imc >= 24.9 && imc < 29.9) {
      _infoText = "Levemente acima do peso";
    }
    else if (imc >= 29.9 && imc < 34.9) {
      _infoText = "Obesidade grau I";
    }
    else if (imc >= 29.9 && imc < 34.9) {
      _infoText = "Obesidade grau I";
    }
    else if (imc >= 34.9 && imc < 39.9) {
      _infoText = "Obesidade grau II";
    }
    else if (imc >= 40) {
      _infoText = "Obesidade grau III";
    }

    setState(() {
      _infoText += " (${imc.toStringAsPrecision(2)})";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calcucladora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form (
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.person_pin, size: 120.0, color: Colors.green),
                  TextFormField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso (kg)",
                        labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira seu peso!";
                      }
                    },
                  ),
                  TextFormField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Altura (cm)",
                        labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira sua altura!";
                      }
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _calculate();
                            }
                          },
                          child: Text(
                            "Calcular",
                            style: TextStyle(color: Colors.white, fontSize: 25.0),
                          ),
                          color: Colors.green,
                        ),
                      )),
                  Text(
                    "$_infoText",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                  )
                ],
              ),
            )));
  }
}
