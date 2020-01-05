import 'package:floor/floor.dart';
import 'package:flutter_orm/entities/contact.dart';

@dao
abstract class ContactDao {
  @Query("SELECT * FROM Contact")
  Future<List<Contact>> getAll();

  @Query('SELECT * FROM Contact WHERE id = :id')
  Future<Contact> findContactById(int id);

  @insert
  Future<void> insertContact(Contact contact);

  @update
  Future<void> updateContact(Contact contact);

  @delete
  Future<void> deleteContact(Contact contact);
}
