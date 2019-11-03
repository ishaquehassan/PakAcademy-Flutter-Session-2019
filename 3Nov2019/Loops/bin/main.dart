main() {
  //For Loop
  int i = 0;
  for(i;i<10;i++){
    print('Hello world!');
  }

  List<String> friends = [
    "Ishaq","Usama","Ali","Usman"
  ];
  print(friends.length);
  for(int j = 0;j<friends.length;j++) {
    print("Friend " + j.toString());
    print(friends[j]);
  }
}

