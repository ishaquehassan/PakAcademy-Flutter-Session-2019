main() {
  printStudents();
  printStudents();
}

printStudents(){
  List<String> students = ["Student 1","Student 2","Student 3"];
  for(int a = 0;a<students.length;a++){
    print(students[a]);
  }
}
