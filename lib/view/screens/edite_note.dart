import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:molahzati/controller/db_controller.dart';
import 'package:molahzati/view/widgets/custom_app_bar.dart';
import 'package:molahzati/view/widgets/custom_text_field.dart';

import '../../const/my_colors.dart';


// ignore: must_be_immutable
class EditeNote extends StatelessWidget {
  final DbController dbController = Get.put(DbController());
  int i;
  EditeNote({
    Key? key,
    required this.i,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    dbController.titleController.text =
        dbController.notes[i].title.toString();

    dbController.contentController.text =
        dbController.notes[i].content.toString();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.grayColor,
              MyColors.boldColor,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CustomAppBar(isAddOrEdit: true),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Expanded(
                child: CustomTextField(
                
                  isTitle: T,
                  hint: 'Title',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 30,
                  ),
                  textController: dbController.titleController,
                ),
              ),
            ),
            Container(
              height: 2,
              width: Get.width,
              color: MyColors.boldColor,
            ),
            Expanded(
              flex: 10,
              child: CustomTextField(
                hint: 'Content',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 25),
                textController: dbController.contentController,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.boldColor,
        onPressed: () async {
          await dbController.editeNote(dbController.notes[i].id as int);

          Get.back();
        },
        child: const Icon(
          Icons.edit,
        ),
      ),
    );
  }
}
