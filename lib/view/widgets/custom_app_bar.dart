import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/db_controller.dart';
import '../../utilis/my_colors.dart';
import 'custom_dialog.dart';
import 'custom_search.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget {
  bool isAddOrEdit;
  CustomAppBar({
    Key? key,
    this.isAddOrEdit = false,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  DbController dbController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color:MyColors.boldColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: widget.isAddOrEdit
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          widget.isAddOrEdit
              ? IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                )
              : Container(),
          widget.isAddOrEdit
              ? Container()
              : IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearch(),
                    );
                  },
                  icon: const Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  ),
                ),
          widget.isAddOrEdit
              ? Container()
              : IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialog(
                          yesFunction: () {
                            dbController.deleteAllNote();
                            Get.back();
                          },
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.clear_sharp,
                    color: Colors.white,
                  ),
                ),
        ],
      ),
    );
  }
}
