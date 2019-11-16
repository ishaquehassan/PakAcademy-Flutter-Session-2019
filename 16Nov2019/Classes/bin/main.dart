import 'dart:io';

main(List<String> arguments) {
  print("enter value for a");
  String a = stdin.readLineSync();
  print("enter value for b");
  String b = stdin.readLineSync();
  print("$a + $b = ${int.parse(a)+int.parse(b)}");
}


