import 'dart:math';

class Cat {
  DateTime? birthday;
  // default constructor exists if we do not give any
  Cat.baby() {
    // named constructor
    birthday = DateTime.now();
  }
  Cat(this.birthday);
  // main constructor
  Cat.withBirthday(DateTime birthday) : this(birthday);
  // delegating to main constructor
  void call() {
    print('Meow!');
  }
}

class CatTreat {
  static final CatTreat catTreat = const CatTreat(1);
  // class variable not initialized until used
  final num quantity;
  const CatTreat(this.quantity);
  // constant constructor
}

class Cat1 extends Pet {
  DateTime? birthday;
  Cat1(this.birthday);
  Cat1.withBirthday(DateTime birthday) : this(birthday);
}

class Dog extends Pet {
  DateTime? birthday;
  Dog(this.birthday);
  Dog.withBirthday(DateTime birthday) : this(birthday);
}

class Pet {
  Pet();
  factory Pet.withBirthday(DateTime birthday) {
    // produces instance of Cat1 or Dog at random
    // does not have access to 'this'
    bool isCat = Random.secure().nextBool();
    return isCat ? Cat1(birthday) : Dog(birthday);
  }
}

Iterable <Cat> kittens1 (int toSpawn) sync* {
  // synchronous generator
  int kittenIndex = 0;
  while(kittenIndex < toSpawn) {
    kittenIndex++;
    yield Cat.baby();
  }
}

Stream <Cat> kittens2 (int toSpawn) async* {
  // asynchronous generator
  int kittenIndex = 0;
  while(kittenIndex < toSpawn) {
    kittenIndex++;
    yield Cat.baby();
  }
}

Iterable<Cat> kittens3 (int toSpawn) sync* {
  // recursive version
  if(toSpawn > 0) {
    yield Cat.baby();
    yield* kittens3 (toSpawn - 1);
  }
}

void main() {
  var cat = Cat(DateTime.now());
  cat();
}