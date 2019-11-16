main(){
  Car car = new Car();
  car.start();
  print(car.year);
  car.year = 2012;
  print(car.year);
  print("-----------------------");
  Car car2 = new Car();
  /*String name = "Hello";
  name.length;*/
  print(car2.year);
  car2.year = 2010;
  print(car2.year);
  car.showYear();
}

class Car{
  int year = 2019;
  String modelName = "SLR";
  String color = "Black";

  start(){
    print("Starting Car");
  }

  showYear(){
    print(year);
  }
}
