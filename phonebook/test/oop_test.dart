class Employee {
  String name;

  String get get_name {
    return name;
  }

  set set_name(String name){
    this.name = name;
  }

  void printer(){
    print(name);
  }

}

void main(List<String> args){
  Employee employee = new Employee();
  employee.name = 'Biniyam';
  employee.set_name = 'new name';
  employee.name = 'final name';
  employee.printer();
}
