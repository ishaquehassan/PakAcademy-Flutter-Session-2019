import 'Person.dart';

main() {
  Person p = Person();
  //p._email = "helloworld";

  double myGpa = p.gpa;
  p.gpa = 0.4;
  p._calcGpa();

}


