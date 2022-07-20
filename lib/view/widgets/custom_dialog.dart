import 'package:flutter/material.dart';
import 'package:molahzati/utilis/my_colors.dart';

// ignore: must_be_immutable
class CustomDialog extends StatelessWidget {
  dynamic yesFunction;
  dynamic noFunction;
  bool isOne;
  CustomDialog({
    Key? key,
    this.yesFunction,
    this.noFunction,
    this.isOne = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColors.boldColor,
      content: Container(
        alignment: Alignment.center,
        height: 130,
        width: 130,
        decoration:  BoxDecoration(
          color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isOne
                ? const SizedBox(
                    height: 20,
                  )
                : Container(),
            isOne
                ? const Text(
                    'Delete this Note',
                    style: TextStyle(color: Colors.white, fontSize: 29),
                  )
                : const Text(
                    'Delete All Notes',
                    style: TextStyle(fontSize: 29, color: Colors.white),
                  ),
            isOne
                ? Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: yesFunction,
                          child: const Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 25),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        GestureDetector(
                          onTap: noFunction,
                          child: const Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'No',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
            isOne
                ? Container()
                : Container(
                    margin: const EdgeInsets.only(top: 15),
                    alignment: Alignment.center,
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.liteColor,
                    ),
                    child: IconButton(
                      onPressed: yesFunction,
                      padding: const EdgeInsets.all(0),
                      icon: Icon(
                        Icons.delete,
                        size: 40,
                        color: Colors.red.shade900,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
