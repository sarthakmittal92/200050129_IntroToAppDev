String _evaluate(String s) {
  double answer = 0.0;
  List defaultOperators = ['x', '/', '+', '-'];
  List<String> numbers = [];
  List<String> operators = [];
  var number = '';
  for (int i = 0; i < s.length; i++) {
    if (defaultOperators.contains(s[i])) {
      operators.add(s[i]);
      numbers.add(number);
      number = '';
    } else {
      number += s[i];
    }
  }
  numbers.add(number);

  for (String i in operators) {
    if (i == 'x') {
      var n = operators.indexOf(i);
      numbers[n] =
          (double.parse(numbers[n]) * double.parse(numbers[n + 1])).toString();
      numbers.removeAt(n + 1);
      operators.remove(i);
    } else if (i == '/') {
      var n = operators.indexOf(i);
      numbers[n] =
          (double.parse(numbers[n]) / double.parse(numbers[n + 1])).toString();
      numbers.removeAt(n + 1);
      operators.remove(i);
    }
  }

  for (String i in operators) {
    if (i == '+') {
      var n = operators.indexOf(i);
      numbers[n] =
          (double.parse(numbers[n]) + double.parse(numbers[n + 1])).toString();
      numbers.removeAt(n + 1);
      operators.remove(i);
    } else if (i == '-') {
      var n = operators.indexOf(i);
      numbers[n] =
          (double.parse(numbers[n]) - double.parse(numbers[n + 1])).toString();
      numbers.removeAt(n + 1);
      operators.remove(i);
    }
  }
  answer = double.parse(numbers[0]);
  return answer.toString();
}

void main() {
  print(_evaluate('12+5'));
}
