//Task(2)
import 'dart:io';
import 'dart:math';
void main() {
  int numStudents = _readInt("Enter number of students: ");
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];
  for (int i = 0; i < numStudents; i++) {
    stdout.write("Enter name of student ${i + 1}: ");
    String name = stdin.readLineSync()!.trim();
    studentNames.add(name);
    int numSubjects = _readInt("Enter number of subjects for $name: ");
    List<double> grades = [];
    for (int j = 0; j < numSubjects; j++) {
      double grade = _readDouble("Enter grade for subject ${j + 1}: ");
      grades.add(grade);
    }
    studentGrades.add(grades);
  }
  while (true) {
    print("\n===== MENU =====");
    print("1. Show All Results");
    print("2. Search Student");
    print("3. Exit");
    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();
    switch (choice) {
      case "1":
        _showAllResults(studentNames, studentGrades);
        break;
      case "2":
        _searchStudent(studentNames, studentGrades);
        break;
      case "3":
        print("Exiting program...");
        return;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}
int _readInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    try {
      return int.parse(stdin.readLineSync()!.trim());
    } catch (e) {
      print("Invalid input. Please enter a valid integer.");
    }
  }
}
double _readDouble(String prompt) {
  while (true) {
    stdout.write(prompt);
    try {
      return double.parse(stdin.readLineSync()!.trim());
    } catch (e) {
      print("Invalid input. Please enter a valid number.");
    }
  }
}
void _showAllResults(List<String> names, List<List<double>> grades) {
  print("\n===== ALL RESULTS =====");
  for (int i = 0; i < names.length; i++) {
    String name = names[i].toUpperCase();
    double avg = grades[i].reduce((a, b) => a + b) / grades[i].length;
    String letter = _getLetterGrade(avg);
    print("$name → Average: ${avg.toStringAsFixed(2)}, Grade: $letter");
  }
}
void _searchStudent(List<String> names, List<List<double>> grades) {
  stdout.write("Enter student name to search: ");
  String searchName = stdin.readLineSync()!.trim().toLowerCase();
  for (int i = 0; i < names.length; i++) {
    if (names[i].toLowerCase() == searchName) {
      double avg = grades[i].reduce((a, b) => a + b) / grades[i].length;
      print("${names[i]} → Average (rounded): ${avg.round()}");
      return;
    }
  }
  print("Student not found.");
}
String _getLetterGrade(double avg) {
  if (avg >= 85) return "A";
  if (avg >= 70) return "B";
  if (avg >= 50) return "C";
  return "F";
}
