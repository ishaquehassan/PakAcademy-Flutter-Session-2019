class Person{
  String _email;
  double _gpa;

  String get email{
    return _email;
  }

  double get gpa{
    //print("gpa");
    if(_gpa == null){
      _gpa = 2/3;
    }
    return _gpa;
  }

  set gpa(double gpa){
    if(gpa < 1){
      print("Invalid GPA");
    }else{
      _gpa = gpa;
    }
  }

  _calcGpa(){

  }
}
