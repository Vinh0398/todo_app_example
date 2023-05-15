import 'package:provider/provider.dart';
import 'package:to_do_flutter_app/data/dao/database/database_service.dart';

final databaseServiceProviders = [
  Provider<DatabaseService>(
    create: (context) => DatabaseService(),
  )
];