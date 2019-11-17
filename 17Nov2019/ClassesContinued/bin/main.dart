main() {
  Car c = new Car(model: "Civic",company : "Honda",year:2020);
  c.showYear(true,msg: "Year ye hai ");
  Car c1 = new Car(model: "a7",company : "audi",year:2018);
  c1.showYear(false);

  Car c2 = new Car.testCons();
  c2.showYear(true);
}

class Car{
  String model;
  String company;
  int year;

  Car({String model = "SLS",String company = "Benz",int year = 2017}){
    this.model = model;
    this.company = company;
    this.year = year;
  }

  Car.testCons(){
    this.model = "";
    this.company = "";
    this.year = 0;
  }


  showYear(bool formatted,{String msg = "Your car year is"}){
    if(formatted){
      print("$msg ${this.year}");
    }else{
      print(year);
    }
  }
//Overloading not supported
//  showYear(bool formatted){
//
//  }
}