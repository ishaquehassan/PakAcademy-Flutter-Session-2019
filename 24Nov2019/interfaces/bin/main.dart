main() {
  var home = HomePage();
  home.createView();
}

class Button{
  ClickListener clickListener;

  setOnClick(ClickListener clickListener){
    this.clickListener = clickListener;
  }

  click(){
    clickListener.onClick();
  }
}

abstract class ClickListener{
  onClick();
}

class HomePage implements ClickListener{

  onClick() {
    print("clicked");
  }

  createView(){
    Button b = Button();
    b.setOnClick(this);
    b.click();
  }

}
