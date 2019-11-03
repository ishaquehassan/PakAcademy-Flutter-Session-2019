main(List<String> arguments) {
  /*int val1 = 10;
  int val2 = 20;
  int addition = val1+val2;
  int subtraction = val1-val2;
  int multiplication = val1*val2;
  double division = val1/val2;
  //String msg = "$val1 + $val2 = $addition";
  print("$val1 + $val2 = $addition");
  print("$val1 - $val2 = $subtraction");
  print("$val1 X $val2 = $multiplication");
  print("$val1 / $val2 = $division");

  int val4 = 20;
  int val5 = 30;
  print("$val4 + $val5 = ${val4+val5}");*/
  calculator(10,20, "+");
  calculator(20,10, "-");
  calculator(5,4, "*");
  calculator(10,5, "/");
  calculator(10,5, "plus");
}

int addition(int val1,int val2){
  int add = val1+val2;
  //print("$val1 + $val2 = $add");
  return add;
}

int subtraction(int val1,int val2){
  int sub = val1-val2;
  //print("$val1 - $val2 = $sub");
  return sub;
}
int multiplication(int val1,int val2){
  int mul = val1*val2;
  //print("$val1 X $val2 = $mul");
  return mul;
}

double division(int val1,int val2){
  double div = val1/val2;
  //print("$val1 / $val2 = $div");
  return div;
}

calculator(int a,int b,String operation){
  var ans;
  if(operation == "+" || operation == "plus"){
    ans = addition(a, b);
  }else if(operation == "-"){
    ans = subtraction(a, b);
  }else if(operation == "*"){
    ans = multiplication(a, b);
  }else if(operation == "/"){
    ans = division(a, b);
  }

  print("$a $operation $b = $ans");
}