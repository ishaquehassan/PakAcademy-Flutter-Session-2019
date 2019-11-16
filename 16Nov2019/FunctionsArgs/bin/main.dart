main(){
  //print(add(3,2,3));
  //print(add(4));
  print(sub(b: 2,a: 2));
  print(mul(2, 3));
}

String mul(int a,int b,{bool formatted = false,int xyz = 2}){
  if(formatted){
    return "$a X $b = ${a*b}";
  }else{
    return "${a*b}";
  }
}

int add(int c,[int a = 1,int b = 2]){
  return a+b;
}

int sub({int a = 2,int b = 1}){
  return a-b;
}