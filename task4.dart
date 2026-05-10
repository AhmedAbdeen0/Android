//Task(4)
class Person {
  String name;
  int _age;
  Person(this.name, this._age);
  int get age => _age;
  set age(int value) {
    if (value > 0) {
      _age = value;
    } else {
      print("Invalid age value!");
    }
  }
  static String universityName = "Sohag University";
}
class Employee extends Person {
  double salary;
  Employee(String name, int age, this.salary) : super(name, age);
  void showInfo() {
    print("University: ${Person.universityName}");
    print("Name: $name");
    print("Age: $age");
    print("Salary: $salary");
  }
}
abstract class Skills {
  void programming();
  void communication();
}
class Developer extends Employee implements Skills {
  String programmingSkill;
  String communicationSkill;
  Developer(String name, int age, double salary, this.programmingSkill, this.communicationSkill)
      : super(name, age, salary);
  @override
  void programming() {
    print("Programming skill: $programmingSkill");
  }
  @override
  void communication() {
    print("Communication skill: $communicationSkill");
  }
}
void main() {
  Developer dev = Developer("Ahmed", 25, 8000, "Dart developer", "Good team communication");
  dev.showInfo();
  dev.programming();
  dev.communication();
}
