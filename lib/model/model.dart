import "dart:io";
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class Note {
  int? id;
  String title;
  String tag;
  String content;
  DateTime? datetime;

  Note({
    this.id,
    required this.title,
    required this.tag,
    required this.content,
    this.datetime,
  }) {
    datetime ??= DateTime.now();
    if (tag.isEmpty) tag = "未命名";
  }

  static Future<List<Note>> readData() async {
    Directory docs = await getApplicationDocumentsDirectory();
    File data = File("${docs.path}/notes.data");

    if (!await data.exists()) {
      await data.writeAsString(jsonEncode([]));
    }
    List rawNotes = jsonDecode(await data.readAsString());
    List<Note> notes = [];

    for (final (index, rawNote) in rawNotes.indexed) {
      DateTime timestamp =
          rawNote["datetime"] != null
              ? DateTime.parse(rawNote["datetime"])
              : DateTime.now();
      notes.add(
        Note(
          id: index,
          title: rawNote["title"],
          tag: rawNote["tag"],
          content: rawNote["content"],
          datetime: timestamp,
        ),
      );
    }

    return notes;
  }

  static Future<List<String>> getTagsList() async {
    List<String> tagsList = [];

    List<Note> notes = await readData();

    for (var note in notes) {
      if (!tagsList.contains(note.tag)) {
        tagsList.add(note.tag);
      }
    }
    return tagsList;
  }

  getTimestamp() {
    return datetime != null
        ? "${datetime!.year.toString()} - ${datetime!.month} - ${datetime!.day}"
        : "";
  }

  toJSON() => {
    "title": title,
    "tag": tag,
    "content": content,
    "datetime":
        "${"${datetime!.day < 10 ? "0" : ""}${datetime!.day}"} 00.00.00",
  };

  saveData(List<Note> inputData) async {
    Directory docs = await getApplicationDocumentsDirectory();
    File data = File("${docs.path}/notes.data");

    await data.writeAsString(
      jsonEncode(inputData.map((note) => note.toString()).toList()),
    );
  }

  static Future<List<Note>> getNotes({tag = false}) async {
    List<Note> notes = await readData();

    if (tag != false) notes.removeWhere((element) => element.tag != tag);

    return notes;
  }

  save() async {
    List<Note> notes = await readData();

    if (id == null) {
      notes.add(this);
    } else {
      int noteIndex = notes.indexWhere((elememt) => elememt.id == id);
      notes[noteIndex] = this;
    }

    saveData(notes);
  }

  delete() async {
    List<Note> notes = await readData();

    notes.removeWhere((element) => element.id == id);

    saveData(notes);
  }
}
