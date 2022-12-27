import 'package:path/path.dart';
import 'package:rd/model/dog.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const String TABLE_DOG = "dog";
  static const String COLUMN_NAME = "name";
  static const String COLUMN_MOTHERNAME = "motherName";
  static const String COLUMN_FATHERNAME = "fatherName";
  static const String COLUMN_HASRD = "hasRD";

  //Create a private constructor
  DatabaseProvider._();

  static const databaseName = 'doggie_database.db';
  static final DatabaseProvider instance = DatabaseProvider._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    return await initializeDatabase();
  }

  Future<Database> initializeDatabase() async {
    String dbPath = join(await getDatabasesPath(), databaseName);
    String dogInit = "CREATE TABLE $TABLE_DOG ($COLUMN_NAME TEXT PRIMARY KEY, $COLUMN_MOTHERNAME TEXT, $COLUMN_FATHERNAME TEXT, $COLUMN_HASRD INTEGER)";
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(dogInit);
      },
    );
  }

  Future<List<Dog>> getDogs() async {
    final db = await database;
    var dogs = await db.query(
      TABLE_DOG,
      columns: [COLUMN_NAME, COLUMN_MOTHERNAME, COLUMN_FATHERNAME, COLUMN_HASRD],
    );
    List<Dog> dogList = <Dog>[];
    for (var currentDog in dogs) {
      Dog dog = Dog.fromMap(currentDog);
      dogList.add(dog);
    }
    return dogList;
  }

  Future<Dog> insert(Dog dog) async {
    final db = await database;
    await db.insert(TABLE_DOG, dog.toMap());
    return dog;
  }
}
