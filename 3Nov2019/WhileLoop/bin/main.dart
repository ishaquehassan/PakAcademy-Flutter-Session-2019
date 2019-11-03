main() {
  bool canRun = true;
  int a = 1;
  while (canRun) {
    print(a);
    a++;
    if(a == 5){
      canRun = false;
    }
  }
}
