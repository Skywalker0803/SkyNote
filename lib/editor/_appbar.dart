import "package:flutter/material.dart";

class NoteAppBar extends StatelessWidget {
  String noteTitle;
  Function onSave;
  Function onDelete;

  bool canAnimate;

  NoteAppBar({
    super.key,
    this.noteTitle = "无标题",
    required this.canAnimate,
    required this.onSave,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.ease,
      opacity: canAnimate ? 1 : 0,
      duration: Duration(milliseconds: 300),
      child: AppBar(
        leading: Icon(Icons.arrow_left),
        title: Text(noteTitle),
        actions: <Widget>[
          IconButton(onPressed: () => onSave, icon: Icon(Icons.delete)),
          IconButton(onPressed: () => onDelete, icon: Icon(Icons.save)),
        ],
      ),
    );
  }
}
