main() {
  Person p = Student();
  p.sleep();
  p.hello();

  dynamic a = Student();
  a.hello();
}

abstract class Person{
  sleep(){
    print("person is sleeping");
  }

  hello();
}

class Hello{

}

class Student extends Person{
  sleep(){
    print("Student is sleeping");
  }

  hello() {

  }

  //world();
}
