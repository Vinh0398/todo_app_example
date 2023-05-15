import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_flutter_app/data/dao/todo_entity.dart';

class DatabaseService {
  late Isar isar;

  DatabaseService._();

  static final DatabaseService _instance = DatabaseService._();

  factory DatabaseService() {
    return _instance;
  }

  Future<void> initDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        TodoEntitySchema,
      ],
      directory: dir.path,
    );
  }
}
