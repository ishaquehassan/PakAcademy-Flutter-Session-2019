import 'package:floor/floor.dart';

@Entity()
class Contact {
  @PrimaryKey(autoGenerate: true)
  final int id;

  String name;
  String email;
  String phone;
  String company;

  Contact(this.id, this.name, this.email, this.phone, this.company);
}
