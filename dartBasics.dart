// Functions
bool isBanana(String fruit) {
  // return-type function-name (parameter-type parameter-name, ..) {
  // body
  // }
  return fruit == 'banana';
}

String fullName(String first, String last, [String? title]) {
  // optional parameter set to null if not given
  if (title == null) {
    return '$first $last';
  }
  return '$title $first $last';
  // else not needed due to return exiting function
}

bool withinTolerance({required int value, int min = 0, int max = 10}) {
  // named parameters optional by default but compulsory if required
  return min <= value && value <= max;
}

void main() {
  // main program

  var myAge = 35; // int variable declaration
  print(myAge); // output to console (35)

  /* 
  Data is statically typed like in C 
  The data type can be inferred if not specified
  */

  var pi = 3.14; // double variable
  print(pi); // output to console (3.14)

  var firstName = 'Sarthak';
  print(firstName);

  /*
  Data types are int, double, bool, String and dynamic
  */

  dynamic yourAge = 37; // multi-type variable
  print(yourAge);
  yourAge = 'Hello'; // type changed
  print(yourAge);

  bool areThereKittens = true;
  print(areThereKittens);

  String lastName = "Mittal";
  print(lastName);

  print(44.0 + 2 - 3); // arithmetic is left to right
  print(21.0 * 2); // more expressive type is double
  print(85 / 2); // answer in double format

  print(42 < 43);

  var value = 42.0;
  value += 1; // compound operators
  print(value);
  value -= 1;
  print(value);
  value++; // pre and post increment/decrement operators
  print(value);
  --value;
  print(value);

  value *= 2;
  print(value);
  value /= 2;
  print(value);

  print(392 % 50); // modulo operator

  print((41 < 42) && (42 < 43)); // logical AND
  print((41 > 42) || (42 < 43)); // logical OR
  print(!(41 < 42)); // logical NOT

  var physicist = "$firstName $lastName likes the number ${84 / 2}";
  // embedding inside string
  print(physicist);

  var quote =
      'If you can\'t explain it simply\nyou don\'t understand it well enough.';
  // escaping symbols needed for single quote strings
  print(quote);
  // to disable \ prefix the string with r

  /*
  const values cannot change once assigned at compile-time
  final values are unknown at compile-time but cannot be re-assigned
  */

  /*
  by default data types are non-nullable
  if to be enabled, add a ? to the data type
  default for nullable type is null
  */

  /*
  the ?? operator return LHV if it is not null and RHV is null
  the ?. returns null if object is null and value of property if not
  */

  var animal = 'fox';
  if (animal == 'cat' || animal == 'dog') {
    // conditional execution
    print('Animal is a house pet.');
  } else if (animal == 'rhino') {
    // alternate condition
    print('That\'s a big animal.');
  } else {
    // final alternative
    print('Animal is NOT a house pet.');
  }
  // Animal is NOT a house pet.

  var i = 1;
  while (i < 10) {
    // iterative loop
    print(i);
    i++;
  }

  i = 1;
  do {
    // at least one execution
    print(i);
    i++;
  } while (i < 10);

  /*
  continue skips remaining body of loop in that iteration and goes to next
  break stops loop execution at that iteration and continues after loop block
  */

  var sum = 0;
  for (var i = 0; i <= 10; i++) {
    // for loop
    sum += i;
  }
  print('The sum is $sum');

  List desserts = ['cookies', 'cupcakes', 'donuts', 'pie'];
  // collection object
  print(desserts);
  final numbers = [42, -1, 299792458, 100];
  print(numbers);

  var firstDessert = desserts[0];
  // list indexing from 0 to L - 1
  print(firstDessert);
  desserts.add('cake');
  // adds element to end
  desserts.remove('donuts');
  // removes first instance of element

  for (final dessert in desserts) {
    // for-in loop
    print('I love to eat $dessert.');
  }

  Map<String, int> calories = {
    'cake': 500,
    'donuts': 150,
    'cookies': 100,
  };
  print(calories);
  final donutCalories = calories['donuts'];
  // null-safe type inferred automatically due to map
  print(donutCalories); // 150
  calories['brownieFudgeSundae'] = 1346; // add new key-value pair
  print(calories);
  // {cake: 500, donuts: 150, cookies: 100, brownieFudgeSundae: 1346}

  var fruit = 'apple';
  print(isBanana(fruit)); // function call

  bool isApple(String fruit) {
    // nested function
    return fruit == 'apple';
  }

  print(isApple(fruit)); // nested function call

  print(fullName('Joe', 'Howard'));
  // Joe Howard
  print(fullName('Albert', 'Einstein', 'Professor'));
  // Professor Albert Einstein

  print(withinTolerance(min: 1, max: 5, value: 11)); // false
  print(withinTolerance(value: 5)); // true

  final onPressed = () {
    // anonymous first-class function
    print('button pressed');
  };
  onPressed(); // function call
  final onPress = () => print('button pressed');
  // arrow syntax for single-lined anonymous functions
  onPress();

  final drinks = ['water', 'juice', 'milk'];
  final bigDrinks = drinks.map((drink) => drink.toUpperCase());
  // using anonymous function for mapping
  print(bigDrinks);
  
}
