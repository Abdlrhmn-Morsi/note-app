import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:molahzati/controller/db_controller.dart';
import 'package:molahzati/model/note.dart';
import 'package:molahzati/utilis/string.dart';
import 'package:molahzati/view/add_note.dart';
import 'package:molahzati/view/widgets/custom_app_bar.dart';
import 'package:molahzati/view/widgets/no_note.dart';
import 'package:molahzati/view/widgets/note_grid_view.dart';

import '../utilis/my_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DbController dbController = Get.put(DbController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DbController>(
        init: DbController(),
        builder: ((controller) {
          return FutureBuilder<List<Note>>(
              future: controller.getAllNotes(),
              builder: (context, AsyncSnapshot<List<Note>> snapshot) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Center(
                      child: NoNote(),
                    ),
                  );
                }
                if (snapshot.data == null) {
                  return const Center(child: Text('NULL'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    padding: const EdgeInsets.only(top: 100),
                    alignment: Alignment.center,
                    color: MyColors.boldColor,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                  );
                }
                return Container(
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
                      const SizedBox(height: 60),
                      CustomAppBar(),
                      const SizedBox(height: 30),
                      Expanded(
                        child: StaggeredGridView.countBuilder(
                          padding: const EdgeInsets.all(0),
                          itemCount: snapshot.data!.length,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 0,
                          staggeredTileBuilder: (i) =>
                              const StaggeredTile.fit(1),
                          itemBuilder: (context, i) {
                            return NoteGridView(
                              dateTimeCreated:
                                  snapshot.data![i].dateTimeCreated,
                              i: i,
                              myTitle: snapshot.data![i].title.toString(),
                              myContent: snapshot.data![i].content.toString(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              });
        }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: MyColors.boldColor,
          onPressed: () {
            Get.to(AddNote());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
