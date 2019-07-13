import 'dart:math';

class Imc {
  double _height, _weight;

  Imc(this._weight, this._height);

  get imc => _weight / pow(_height / 100, 2);

  String getImcStatus() {
    var _infoText = "";

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

    return _infoText += " (${imc.toStringAsPrecision(4)})";
  }
}
