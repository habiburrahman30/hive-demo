import 'package:hive/hive.dart';

import '../hive_models/notes_model.dart';

class Boxes {
  static Box<NotesModel> getData(String name) => Hive.box<NotesModel>(name);
}
