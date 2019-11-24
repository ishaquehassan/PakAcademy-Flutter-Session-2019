main() {
  Button b = Button();
  //b.setOnClick(myclick);

  b.setOnClick((a){
    print("a:$a");
  });
  b.execClick();

  var a = (Button a){

  };
  a(Button());
  //myclick();
}

myclick(String a){
  print("hello");
}

typedef void MyClick(String name);

class Button{
  MyClick click;

  setOnClick(MyClick click){
    this.click = click;
  }

  execClick(){
    click("Hello world");
  }
}
