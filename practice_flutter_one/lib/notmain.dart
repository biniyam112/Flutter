List myList = new List<String>();
sayHi(String name) {
  try {
    if (name == 'name') {
      throw ('Shouldn\'t use default value provided');
    }
  } on FormatException catch (fe) {
    print('this is format exception ' + fe.toString());
  } on IntegerDivisionByZeroException {
    print('dont care about the object');
  } on Exception catch (e) {
    print('general exception ' + e.toString());
  } catch (u) {
    print('exception caught ' + u.toString());
  } finally {
    print('this is how to do finally');
  }
  assert(name.isEmpty);
  return () => print('Hi $name');
}

class MainClass {
  greet({Function f, String name = 'defined param'}) {
    f(name);
  }
}

Iterable<int> countTo(int max) sync* {
  int i = 0;
  while (i <= max) {
    yield i++;
  }
}

class C {
  E getValue<E>(List<E> list) {
    int i =0;
    for (int j=0; j < list.length; j++) {
      i = j;
      if (list[i] is String) {
        print('the value is String');
        return list[i];
      }
    }
    print('the value may be int');
    return list[i];
  }
}

// class MyException extends Exception{
// final String message;
// MyException(this.message);
// }


main() {
  MainClass main = new MainClass();
  sayHi('name');
  main.greet(f: sayHi, name: 'through optional variable');
  main.greet(f: sayHi);

  var sayhiguy = sayHi('this is the saying hi!');
  sayhiguy();

  Iterable iterable = countTo(3);
  Iterator i = iterable.iterator;
  while (i.moveNext()) {
    myList.add(i.current.toString());
    print(i.current);
  }
  

  C c = new C();
  c.getValue(<int>[1,2,3,4,6,8]);
  c.getValue(<String>['one','two','three']);



  // from main
  MyNumber mn = new MyNumber(4);
  print(mn +(5));
  // runApp(Mainapp());
  Mainapp notmain = Mainapp();
  notmain
    ..number1
    ..number = 12;
  print(notmain.number2);
  print(notmain.number1);
  print(notmain.number);
  // ..increment;
  notmain.setManipulation();
  notmain.mapManipulation();

  Hero hero = Hero('biniyam', 'demissew');
  dynamic heroname = hero.heroName();
  print(heroname);
  MetaHero metaHero = new MetaHero();
  metaHero.firstName = 'no name';
  metaHero.lastName = 'real name';
  metaHero.firstnamer = 'yes name';
  var metaheroname = metaHero.heroName();
  print(metaheroname + metaHero.doer());
}

class Mainapp {
  Object get number2 => 5;

  // @override
  // Widget build(BuildContext context) {
  //   return null;
  // }

  setManipulation() {
    Set integers = new Set();
    integers.addAll(['one', 'two', 'three']);
    bool check_1 = integers.contains('two');
    bool check_2 = integers.containsAll(['one', 'two', 'three']);
    integers.addAll(['one', 'tow']);
    bool check_3 = integers.containsAll(['one', 'tow']);
    print(check_1);
    print(check_2);
    print(check_3);
    print(integers);
  }

  double number;

  set number2(double number) {
    number++;
  }

  double get number1 {
    return number;
  }

  mapManipulation() {
    Map map = new Map<String, String>();
    map = {'one': '1', 'two': '2'};
    map.addAll({'not_one': 'not_one', 'two': '2'});
    map.forEach(
      (key, value) {
        if (key != value) {
          print(key + ' : ' + value);
          var bitValue = (num.parse(value.toString()) as int).roundToDouble();
          print(num.parse(value.toString().length.toString()) + bitValue - 1);
          print(bitValue);
        }
      },
    );
  }
}

class Hero {
  String firstName;
  String lastName;

  Hero(this.firstName, this.lastName);
  String heroName() {
    return '$firstName $lastName';
  }
}

mixin Power {
  var doEverything = true;
  String doer() {
    if (doEverything) {
      return ' He can do evertthing';
    }
    return ' cant do nothing';
  }
}

class MetaHero with Power implements Hero {
  String firstName;
  String lastName;
  String get firstnamers {
    if (firstName == null) {
      return 'bini_boy';
    }
    return firstName;
  }

  set firstnamer(String firstname) {
    if (firstName == null) {
      firstName = firstName;
    }
    firstName = firstname;
  }

  String heroName() {
    return 'Maziak $firstName $lastName';
  }
}

abstract class TheAbstracter {
  String patientsCounter(int number) {
    return number.toString();
  }

  abstractPatientCounter();
  // no impelementation/body so abstract
}

class MyNumber {
  num value;
  MyNumber(num n) {
    this.value = n;
  }
  num operator +(num number) => value / number;
}