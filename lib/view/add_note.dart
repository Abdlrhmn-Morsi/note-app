import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:molahzati/controller/db_controller.dart';
import 'package:molahzati/utilis/my_colors.dart';
import 'package:molahzati/view/widgets/custom_app_bar.dart';
import 'package:molahzati/view/widgets/custom_text_field.dart';

class AddNote extends StatelessWidget {
  AddNote({
    Key? key,
  }) : super(key: key);
  final DbController dbController = Get.put(DbController());
  @override
  Widget build(BuildContext context) {
    dbController.titleController.text = '';

    dbController.contentController.text = '';

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.boldColor,
              MyColors.liteColor,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 70),
            CustomAppBar(isAddOrEdit: true),
            //title
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
            // line      
            Container(
              height: 2,
              width: Get.width,
              color: MyColors.boldColor,
            ),
           //content
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
      //FA btn
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.boldColor,
        onPressed: () {
          if (dbController.contentController.text.isEmpty) {
            Get.snackbar('Please add content',
                DateFormat("MMM dd  HH:mm").format(DateTime.now()));
          } else {
            dbController.addNote();
            dbController.titleController.clear();
            dbController.contentController.clear();
            Get.back();
          }
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
