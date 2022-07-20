import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molahzati/controller/db_controller.dart';
import 'package:molahzati/utilis/my_colors.dart';
import 'package:molahzati/view/edite_note.dart';
import 'package:molahzati/view/widgets/my_text.dart';
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
  dynamic myTitle;
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
        Get.to(EditeNote(
          argument: i!,
        ));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 4),
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: i!.isEven
              ? const LinearGradient(
                  colors: [
                    MyColors.boldColor,
                    MyColors.liteColor,
                  ],
                )
              : const LinearGradient(
                  colors: [
                    MyColors.liteColor,
                    MyColors.boldColor,
                  ],
                ),
          border: Border.all(color: MyColors.liteColor),
          boxShadow: [
            BoxShadow(
              spreadRadius: 0,
              blurRadius: 8,
              color: Colors.white.withOpacity(0.2),
              offset: const Offset(5, 5),
            ),
            BoxShadow(
              spreadRadius: 0,
              blurRadius: 10,
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(-5, -5),
            ),
          ],
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //title
              MyText(
                text: myTitle,
                fontSize: 21,
                maxLines: 1,
                color: Colors.grey.shade200,
              ),
              //the line
              Container(
                margin: const EdgeInsets.only(
                  top: 2,
                  bottom: 2,
                ),
                width: Get.width,
                height: 2,
                color: MyColors.liteColor,
              ),
              //content
              MyText(
                text: myContent,
                fontSize: 15,
                maxLines: 2,
                color: Colors.grey.shade200,
              ),
            const  SizedBox(height: 5),
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
                        color: Colors.black87,
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
