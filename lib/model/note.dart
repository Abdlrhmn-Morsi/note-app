
import '../const/string.dart';

class Note {
  int? id;
  String? title;
  String? content;
  dynamic dateTimeCreated;

  Note({
    this.title,
    this.content,
    this.id,
    this.dateTimeCreated,
  });

  Note.fromMap(Map<String, dynamic> map) {
      Note(
      id: map[columnId],
      title: map[columnTitle],
      content: map[columnContent],
      dateTimeCreated: map[columnDateTimeCreated],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnTitle: title,
      columnContent: content,
      columnDateTimeCreated:dateTimeCreated,
    };
  }
}
