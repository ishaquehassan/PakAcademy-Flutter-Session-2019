main(){
  Car c = new Car();
  SedanCar sedan = new SedanCar('m5','bmw',2016,4,5,true);
  SportsCar sports = new SportsCar("A7","Audi",1029,true,"Hyper",400);
  /*print(sports.turbo);
  print(sports.engineType);
  print(sports.horsePower);
  print(sports.model);
  print(sports.year);
  print(sports.company);*/
  sedan.showYear();
  print('====');
  sports.showYear();
}

class Car{
  String model;
  String company;
  int year;

 /* Car({String model,String company,int year}){
    this.model = model;
    this.company = company;
    this.year = year;
  }*/
  Car({this.model = '',this.company = '',this.year = 1}){
    print('cat is initializing');
  }

  showYear(){
    print('Showing year');
    print(year);
  }
}

class SportsCar extends Car{
  bool turbo;
  String engineType;
  int horsePower;

  SportsCar(String m,String c,int y,bool turbo, String engineType,int horsePower) : super(model:m,company:c,year:y){
    this.turbo = turbo;
    this.engineType = engineType;
    this.horsePower = horsePower;
  }

  showYear() {
    super.showYear();
    print('Sports Car year is $year');
  }

}

class SedanCar extends Car{
  int doorCount;
  int capacity;
  bool storageTrunk;

  SedanCar(String model, String company, int year,this.doorCount,this.capacity,this.storageTrunk) : super(model:model, company:company, year:year);
}

