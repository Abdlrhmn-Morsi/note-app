import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../const/my_colors.dart';
import '../../controller/db_controller.dart';
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
            color: MyColors.boldColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: widget.isAddOrEdit
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceBetween,
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
              : Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  bottom: 10,
                ),
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: MyColors.boldColor,
                  border: Border.all(
                    color: MyColors.liteColor,
                    width: 3,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.contain,
                ),
              ),
          widget.isAddOrEdit
              ? Container()
              : Row(
                  children: [
                    IconButton(
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
                    IconButton(
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
        ],
      ),
    );
  }
}
