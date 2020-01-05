// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final database = _$AppDatabase();
    database.database = await database.open(
      name ?? ':memory:',
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ContactDao _contactDaoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations,
      [Callback callback]) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Contact` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `email` TEXT, `phone` TEXT, `company` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  ContactDao get contactDao {
    return _contactDaoInstance ??= _$ContactDao(database, changeListener);
  }
}

class _$ContactDao extends ContactDao {
  _$ContactDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _contactInsertionAdapter = InsertionAdapter(
            database,
            'Contact',
            (Contact item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'phone': item.phone,
                  'company': item.company
                }),
        _contactUpdateAdapter = UpdateAdapter(
            database,
            'Contact',
            ['id'],
            (Contact item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'phone': item.phone,
                  'company': item.company
                }),
        _contactDeletionAdapter = DeletionAdapter(
            database,
            'Contact',
            ['id'],
            (Contact item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'phone': item.phone,
                  'company': item.company
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _contactMapper = (Map<String, dynamic> row) => Contact(
      row['id'] as int,
      row['name'] as String,
      row['email'] as String,
      row['phone'] as String,
      row['company'] as String);

  final InsertionAdapter<Contact> _contactInsertionAdapter;

  final UpdateAdapter<Contact> _contactUpdateAdapter;

  final DeletionAdapter<Contact> _contactDeletionAdapter;

  @override
  Future<List<Contact>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM Contact',
        mapper: _contactMapper);
  }

  @override
  Future<Contact> findContactById(int id) async {
    return _queryAdapter.query('SELECT * FROM Contact WHERE id = ?',
        arguments: <dynamic>[id], mapper: _contactMapper);
  }

  @override
  Future<void> insertContact(Contact contact) async {
    await _contactInsertionAdapter.insert(
        contact, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updateContact(Contact contact) async {
    await _contactUpdateAdapter.update(
        contact, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> deleteContact(Contact contact) async {
    await _contactDeletionAdapter.delete(contact);
  }
}
