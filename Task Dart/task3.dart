//Task(3)
import 'dart:collection';
Set<String> studentNames = {};
void addStudent(String name) {
  studentNames.add(name);
}
void printStudentsRecursive(List<String> names, [int index = 0]) {
  if (index < names.length) {
    print(names[index]);
    printStudentsRecursive(names, index + 1);
  }
}
void printStudentsLambda() {
  studentNames.forEach((name) => print(name));
}
void mergeStudents(Set<String> newStudents) {
  studentNames = {...studentNames, ...newStudents};
}
Map<String, List<int>> studentCourses = {};
void addCourse({required String student, required String course, int grade = 0}) {
  studentCourses.putIfAbsent(student, () => []);
  studentCourses[student]!.add(grade);
}
double averageGrade(String student) {
  if (!studentCourses.containsKey(student) || studentCourses[student]!.isEmpty) {
    return 0;
  }
  var grades = studentCourses[student]!;
  double sum = grades.fold(0, (prev, g) => prev + g);
  return sum / grades.length;
}
void main() {
  addStudent("Ahmed");
  addStudent("Sara");
  addStudent("Omar");
  addStudent("Ahmed");
  print("Recursive Print:");
  printStudentsRecursive(studentNames.toList());
  print("\nLambda Print:");
  printStudentsLambda();
  mergeStudents({"Mona", "Ali"});
  print("\nAfter Merge:");
  printStudentsLambda();
  addCourse(student: "Ahmed", course: "Math", grade: 90);
  addCourse(student: "Ahmed", course: "Physics", grade: 80);
  addCourse(student: "Sara", course: "Biology", grade: 70);
  print("\nAverage Grades:");
  print("Ahmed → ${averageGrade("Ahmed")}");
  print("Sara → ${averageGrade("Sara")}");
  print("Omar → ${averageGrade("Omar")}");
}
