import "package:flutter/material.dart";
import "package:skynote/model/model.dart";

class NoteDetail extends StatelessWidget {
  final Note currentNote;

  const NoteDetail({super.key, required this.currentNote});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            currentNote.getTimestamp() ?? "",
            style: TextStyle(fontSize: 15),
          ),
          Expanded(child: Container()),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: Row(children: []),
          ),
        ],
      ),
    );
  }
}
