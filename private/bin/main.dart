main() {
  Object o = Car();
  dynamic d = Car();
  //c.model = "";
  //c.year = 1;
  //c._currentSpeed = 1;
  //o.model = 1;
  //o.asasa = 1;
  //d.sdsds = "1";

  //print(c.toString());

  /*Object a = 1;
  a = "";
  dynamic ab = "";*/
  print(o);
  print(d);
  //c1.printSpeed();
}

class Car{
  String model;
  int year;
  int _currentSpeed;

  printSpeed(){
    print(_currentSpeed);
  }

  @override
  String toString() {
    return 'Car{model: $model, year: $year, _currentSpeed: $_currentSpeed}';
  }


}
