main() {
  List<String> friends = ["F1","F2","f3"];
  friends[0];

  Map mp = new Map();
  mp['hello'] = "world";
  mp[2] = "xyz";
  print(mp);

  Map<String,int> mp1 = new Map<String,int>();
  mp1["test"] = 2;
  print(mp1);

  Map<String,String> mp2 = {
    'hello':'world'
  };
  
}
