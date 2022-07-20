import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:molahzati/db/db.dart';
import 'package:molahzati/model/note.dart';
import 'package:intl/intl.dart';

class DbController extends GetxController {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final animController = TextEditingController();

  addNote() async {
    var title = titleController.value.text;
    var content = contentController.value.text;
    if (title.isEmpty) {
      title = 'no name';
    }

    Note note = Note(
      title: title,
      content: content,
      dateTimeCreated: DateFormat("MMM dd  HH:mm").format(DateTime.now()),
    );
    await DbHealper.db.addNote(note);
    await getAllNotes();
    update();
  }

  editeNote(dynamic id) async {
    var title = titleController.value.text;
    var content = contentController.value.text;
    if (title.isEmpty) {
      title = 'no name';
    }

    Note note = Note(
      id: id,
      title: title,
      content: content,
      dateTimeCreated: DateFormat("MMM dd  HH:mm").format(DateTime.now()),
    );
    await DbHealper.db.updateNote(note);
    getAllNotes();
    update();
  }

  deleteNote(dynamic id) async {
    Note note = Note(
      id: id,
    );
    await DbHealper.db.deleteNote(note);
    getAllNotes();
    update();
  }

  deleteAllNote() async {
    await DbHealper.db.deleteAllNote();
    getAllNotes();
    update();
  }

  Future<List<Note>> getAllNotes() async {
    notes = await DbHealper.db.getAllNotes();
    return notes;
  }

  List<Note> notes = [];

  @override
  void onInit() {
    super.onInit();
    getAllNotes();
    update();
  }
}
