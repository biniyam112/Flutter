import 'dart:collection';
import 'package:scoped_model/scoped_model.dart';
import 'Expense.dart';
import 'Database.dart';

class ExpenseListModel extends Model {
  ExpenseListModel() {
    this.load();
  }
  final List<Expense> _items = [];
  UnmodifiableListView<Expense> get items => UnmodifiableListView(_items);

  double get totalExpense {
    double amount = 0.0;
    for (var i = 0; i < _items.length; i++) {
      amount = amount + _items[i].amount;
    }
    return amount;
  }

  void load() {
    Future<List<Expense>> list = SQLiteDbProvider.db.getAllExpenses();
    list.then((dbItems) {
      for (var i = 0; i < dbItems.length; i++) {
        _items.add(dbItems[i]);
      }
      notifyListeners();
    });
  }

  Expense byId(int id) {
    for (var i = 0; i < _items.length; i++) {
      if (_items[i].id == id) {
        return _items[i];
      }
    }
    return null;
  }

  void add(Expense item) {
    SQLiteDbProvider.db.insert(item).then((val) {
      _items.add(val);
      load();
      notifyListeners();
    });
  }

  void update(Expense item) {
    bool found = false;
    for (var i = 0; i < _items.length; i++) {
      if (_items[i].id == item.id) {
        _items[i] = item;
        found = true;
        SQLiteDbProvider.db.update(item);
        break;
      }
    }
    if (found) notifyListeners();
  }

  void delete(Expense item) {
    bool found = false;
    for (var i = 0; i < _items.length; i++) {
      if (_items[i].id == item.id) {
        found = true;
        SQLiteDbProvider.db.delete(item.id);
        _items.removeAt(i);
        break;
      }
    }
    if (found) notifyListeners();
  }
}
