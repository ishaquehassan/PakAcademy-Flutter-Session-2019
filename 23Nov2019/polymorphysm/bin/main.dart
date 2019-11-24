main() {
  Person p = Person();
  Person s = Student();
  UniPerson u = Student();
  checkSleep(p);
  checkSleep(s);
  //Student ss = Person();

}

checkSleep(Person p){
  p.sleep();
}

class Person{
  sleep(){
    print("Sleeping");
  }
}

class UniPerson extends Person{
  String depart;
  sleep() {
    print("UniPerson is sleeping");
  }
}

class Student extends UniPerson{
  String rollNo;

  sleep() {
    print("Student is sleeping");
  }
}
