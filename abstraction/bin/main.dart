main() {
  Person p = Student();
  p.sleep();
  p.hello();
}

abstract class Person{
  sleep(){
    print("person is sleeping");
  }

  hello();
}

class Hello{}

class Student extends Person{
  sleep(){
    print("Student is sleeping");
  }

  hello() {

  }
  
  //world();
}
