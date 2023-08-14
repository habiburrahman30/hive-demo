import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_demo/src/helpers/k_log.dart';
import 'package:hive_demo/src/services/hive_boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../components/UserUniqueIdentifierInput.dart';
import '../controllers/data_list_controller.dart';
import '../helpers/hex_color copy.dart';
import '../helpers/k_text.dart';
import '../helpers/route.dart';
import '../hive_models/notes_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dataListC = Get.put(DataListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Demo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            ValueListenableBuilder(
              valueListenable: Boxes.getData('notes').listenable(),
              builder: (BuildContext context, Box box, Widget? child) {
                final data = box.values.toList().cast<NotesModel>();
                if (data.isEmpty) {
                  return Center(child: Text('No data list'));
                } else {
                  return ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (BuildContext context, int index) {
                      final item = data[index];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          child: ListTile(
                            title: KText(text: '${item.title}'),
                            subtitle: KText(text: '${item.discription}'),
                            trailing: Wrap(
                              spacing: 12, // space between two icons
                              children: [
                                IconButton(
                                  splashRadius: 24.0,
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    final data = NotesModel(
                                      "Habibur Rahman 666",
                                      "App developer",
                                    );
                                    // Boxes.getData('notes').put(item., data);
                                    // data.save();

                                    showEditDialog(
                                      label: 'Edit Item',
                                      onPressed: () {},
                                      title: '${item.title}',
                                      desc: '${item.discription}',
                                      dataKey: item.key,
                                    );
                                  },
                                ),
                                IconButton(
                                  // splashColor: Colors.black,
                                  // focusColor: Colors.black,
                                  // highlightColor: Colors.black,
                                  // hoverColor: Colors.black,
                                  splashRadius: 24.0,
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    item.delete();
                                    // Boxes.getData('notes').clear();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
            // ListView.builder(
            //   itemCount: 10,
            //   scrollDirection: Axis.vertical,
            //   shrinkWrap: true,
            //   primary: false,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Container(
            //       margin: EdgeInsets.symmetric(horizontal: 10),
            //       child: Card(
            //         child: ListTile(
            //           title: KText(text: 'App Development'),
            //           subtitle: KText(text: 'hi i am a app developer...'),
            //           trailing: Wrap(
            //             spacing: 12, // space between two icons
            //             children: [
            //               IconButton(
            //                 splashRadius: 24.0,
            //                 icon: Icon(
            //                   Icons.edit,
            //                   color: Colors.blue,
            //                 ),
            //                 onPressed: () {},
            //               ),
            //               IconButton(
            //                 splashColor: Colors.black,
            //                 // focusColor: Colors.black,
            //                 // highlightColor: Colors.black,
            //                 hoverColor: Colors.black,
            //                 splashRadius: 24.0,
            //                 icon: Icon(
            //                   Icons.delete,
            //                   color: Colors.red,
            //                 ),
            //                 onPressed: () {},
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final box = Boxes.getData('notes');
          final item = box.keys.map((key) {
            final data = box.get(key);
            return data;
          }).toList();
          kLog(item.reversed.toList());

          // final data = NotesModel(
          //   "Nahid 6666",
          //   "detail 11112222",
          // );
          // box.add(data);
          // kLog(box.length);

          showUniqueIdentifierInputDialog(
            title: 'Add List',
            //inputLabel: 'Email/Username',
            // inputLabel: 'Mobile No / Username',
            // onChanged: ,
            onPressed: () {},
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  showUniqueIdentifierInputDialog({
    required String title,
    // required String inputLabel,
    // required Function onChanged,
    required VoidCallback? onPressed,
    // required String inputValue,
  }) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(11.0))),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 13, bottom: 13),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  '${title}',
                  style: TextStyle(fontFamily: 'Manrope', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: hexToColor('#FFFFFF'),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Column(
                  children: [
                    UserUniqueIdentifierInput(
                      inputLabel: 'Title',
                      hintText: 'title',
                      onChanged: (value) {
                        titleController.text = value;
                      },
                      initialValue: '',
                    ),
                    UserUniqueIdentifierInput(
                      inputLabel: 'dsc',
                      hintText: 'description..',
                      onChanged: (value) {
                        descriptionController.text = value;
                      },
                      initialValue: '',
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                            onPressed: () => back(),
                            child: Text(
                              'Cancel ',
                              style: TextStyle(fontFamily: 'Manrope', fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: ElevatedButton(
                            key: Key('unique_identifier_submit_button'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                                final box = Boxes.getData('notes');

                                final data = NotesModel(
                                  "${titleController.text.trim()}",
                                  "${descriptionController.text.trim()}",
                                );

                                await box.add(data);

                                back();

                                titleController.clear();
                                descriptionController.clear();
                              }
                            },
                            child: Text(
                              'Add',
                              style: TextStyle(fontFamily: 'Manrope', fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showEditDialog({
    required String title,
    required String label,
    required String desc,
    required dynamic dataKey,
    // required String inputLabel,
    // required Function onChanged,
    required VoidCallback? onPressed,
    // required String inputValue,
  }) {
    dataListC.title.value = title;
    dataListC.description.value = desc;
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(11.0))),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 13, bottom: 13),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  '${label}',
                  style: TextStyle(fontFamily: 'Manrope', color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: hexToColor('#FFFFFF'),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Column(
                  children: [
                    UserUniqueIdentifierInput(
                      inputLabel: 'Title',
                      hintText: 'title',
                      onChanged: (value) {
                        dataListC.title.value = value;
                      },
                      initialValue: title,
                    ),
                    UserUniqueIdentifierInput(
                      inputLabel: 'dsc',
                      hintText: 'description..',
                      onChanged: (value) {
                        dataListC.description.value = value;
                      },
                      initialValue: desc,
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                            onPressed: () => back(),
                            child: Text(
                              'Cancel ',
                              style: TextStyle(fontFamily: 'Manrope', fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: ElevatedButton(
                            key: Key('unique_identifier_submit_button'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (dataListC.title.value.isNotEmpty || dataListC.description.value.isNotEmpty) {
                                dataListC.editListItem(dataKey);
                                back();

                                titleController.clear();
                                descriptionController.clear();
                              }
                            },
                            child: Text(
                              'Add',
                              style: TextStyle(fontFamily: 'Manrope', fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
