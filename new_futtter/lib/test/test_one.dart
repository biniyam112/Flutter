void main(List<String> args) {
  print('this is the message I got for you');
  for (int i = 0; i < args.length; i++) {
    print(args[i] + '\n' + 'new list item starts here');

    print('================================');
    TheSon theSon = TheSon();
    theSon.getPrinter();
  }
  var list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  ListItems listitems = new ListItems();
  listitems.evenLister(list);
  listitems.DaysLister(list);

  Circle circle = new Circle();
  circle.ComputeArea(list[4]);

  String strng = 'this is the strng';
  print(strng.addSign(strng));
}

// this is me tring out mixns

class TheBoss {
  void printer(int numberofpages) {
    for (int i = 0; i < numberofpages; i++) {
      print('The number is :' + i.toString());
    }
  }
}

class TheSon with TheBoss {
  void getPrinter() {
    TheSon theSon = TheSon();
    print('this has to work');
    theSon.printer(12);
  }
}

class ListItems {
  List<int> evenLister(List<int> numbers) {
    List<int> evennumbers = new List();
    List<int> oddnumbers = new List();
    for (int i = 0; i < numbers.length; i++) {
      if (numbers[i] % 2 == 0) {
        evennumbers.add(numbers[i]);
      } else {
        continue;
        // oddnumbers.add(numbers[i]);
      }
    }
    print(evennumbers);
    print(oddnumbers);
  }

  List<int> anotherLister(List<int> numbers) {
    int i = 0;
    while (i < numbers.length) {
      // do this
    }
    for (var number in numbers) {
      // do this
    }
  }

  List<String> DaysLister(List<int> week) {
    for (var weekdays in week) {
      switch (weekdays) {
        case 1:
          print('Monday');
          break;
        case 2:
          print('Tuesday');
          break;
        case 3:
          print('wednesday');
          break;
        case 4:
          print('Thursday');
          break;
        case 5:
          print('Friday');
          break;
        case 6:
          print('Saturday');
          break;
        case 7:
          print('Sunday');
          break;
        default:
          print('invalid number');
      }
    }

    try {
      int i = 0;
      int k = 4;
      print(k / i);
    } catch (exception) {
      print(exception);
    }
  }
}

class Circle {
  int _radius;
  int _area;

  set(int radius) {
    if (radius < 0) {
      radius = 0;
      this._radius = radius;
    }
  }

  int get(int radius) {
    if (radius > 0) {
      return radius;
    } else {
      return -1 * radius;
    }
  }

  int ComputeArea(int radius) {
    set(radius);
    _area = radius * radius;
    print(_area);
    return _area;
  }
}

extension on String{
  String addSign(String string){
    return '\$' + string;
  }
}





