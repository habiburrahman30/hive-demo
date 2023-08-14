import 'package:get/get.dart';
import 'package:hive_demo/src/services/hive_boxes.dart';

import '../hive_models/notes_model.dart';

class DataListController extends GetxController with Boxes {
  final title = RxString('');
  final description = RxString('');

  addListItem() {
    final box = Boxes.getData('notes');

    final data = NotesModel(
      "${title}",
      "${description}",
    );
    box.add(data);
    title.value = '';
    description.value = '';
  }

  editListItem(key) {
    final box = Boxes.getData('notes');
    final data = NotesModel(
      "${title}",
      "${description}",
    );
    box.put(key, data);
    title.value = '';
    description.value = '';
  }

  deleteListItem(NotesModel notesModel) {
    notesModel.delete();
  }
}
