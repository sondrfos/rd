import 'package:rd/db/database_provider.dart';

class Dog {
  late String name;
  late String motherName;
  late String fatherName;
  late bool hasRD;

  Dog({
    required this.name,
    required this.motherName,
    required this.fatherName,
    required this.hasRD,
  });

  Map<String, dynamic> toMap() {
    return {
      DatabaseProvider.COLUMN_NAME: name,
      DatabaseProvider.COLUMN_MOTHERNAME: motherName,
      DatabaseProvider.COLUMN_FATHERNAME: fatherName,
      DatabaseProvider.COLUMN_HASRD: hasRD ? 1 : 0,
    };
  }

  Dog.fromMap(Map<String, dynamic> map) {
    name = map[DatabaseProvider.COLUMN_NAME];
    motherName = map[DatabaseProvider.COLUMN_MOTHERNAME];
    fatherName = map[DatabaseProvider.COLUMN_FATHERNAME];
    hasRD = map[DatabaseProvider.COLUMN_HASRD] == 1;
  }
}
