import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molahzati/controller/db_controller.dart';
import 'package:molahzati/view/screens/edite_note.dart';
import 'package:molahzati/view/widgets/my_text.dart';
import '../../const/my_colors.dart';
import 'custom_dialog.dart';

// ignore: must_be_immutable
class NoteGridView extends StatelessWidget {
  NoteGridView({
    required this.myTitle,
    required this.myContent,
    required this.dateTimeCreated,
    this.i,
    Key? key,
  }) : super(key: key);
  DbController dbController = Get.find();
  int? i;
  String myTitle;
  dynamic myContent;
  dynamic dateTimeCreated;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return CustomDialog(
                isOne: true,
                noFunction: () {
                  Navigator.of(context).pop();
                },
                yesFunction: () {
                  dbController.deleteNote(dbController.notes[i!].id);
                  Navigator.of(context).pop();
                },
              );
            });
      },
      onTap: () {
        Get.to(
          EditeNote(
            i: i!,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 12, bottom: 4),
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            topLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
            topRight: Radius.circular(40),
          ),
          border: Border.all(
            color: MyColors.liteColor,
            width: 3,
          ),
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //title
              MyText(
                text: myTitle.capitalizeFirst,
                fontSize: 21,
                maxLines: 1,
                color: Colors.grey.shade300,
              ),
              //the line
              Container(
                margin: const EdgeInsets.only(
                  top: 2,
                  bottom: 2,
                ),
                width: Get.width,
                height: 1,
                color: MyColors.literColor,
              ),
              //content
              MyText(
                text: myContent,
                fontSize: 15,
                maxLines: 2,
                color: MyColors.liteColor,
              ),
              const SizedBox(height: 5),
              // dateTimeCreated
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: MyText(
                        text: dateTimeCreated,
                        fontSize: 10,
                        maxLines: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
