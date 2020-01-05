import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_orm/daos/contact_dao.dart';
import 'package:flutter_orm/entities/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 2, entities: [Contact])
abstract class AppDatabase extends FloorDatabase {
  ContactDao get contactDao;
}
