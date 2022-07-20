import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:molahzati/controller/db_controller.dart';
import 'package:molahzati/utilis/my_colors.dart';
import 'package:molahzati/view/widgets/note_grid_view.dart';

class CustomSearch extends SearchDelegate {
  DbController dbController = Get.find();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isNotEmpty) {
            query = '';
          } else {
            close(context, null);
          }
        },
        icon: query.isEmpty
            ? const Icon(Icons.arrow_back_ios_new)
            : const Icon(
                Icons.clear_sharp,
              ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var noteList = dbController.notes.where((note) {
      return note.title!.toLowerCase().contains(query.toLowerCase()) ||
          note.content!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyColors.boldColor,
            MyColors.liteColor,
          ],
        ),
      ),
      child: query.isEmpty
          ? Container()
          : Expanded(
              child: StaggeredGridView.countBuilder(
                padding: const EdgeInsets.only(top: 20),
                itemCount: noteList.length,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 0,
                staggeredTileBuilder: (i) => const StaggeredTile.fit(1),
                itemBuilder: (context, i) {
                  return NoteGridView(
                    dateTimeCreated: dbController.notes[i].dateTimeCreated,
                    myTitle: noteList[i].title,
                    myContent: noteList[i].content,
                    i: i,
                  );
                },
              ),
            ),
    );
  }
}
