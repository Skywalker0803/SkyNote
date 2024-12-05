import "dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart";

import "package:flutter/material.dart";
import "package:skynote/editor/_appbar.dart";
import "package:skynote/model/model.dart";

class NoteEditor extends StatefulWidget {
  static const route = "/editor";
  final Note? note;

  const NoteEditor({super.key, this.note});

  @override
  State<NoteEditor> createState() => EditorState();
}

class EditorState extends State<NoteEditor> {
  bool canAnimate = false;
  Note? currentNote;

  saveChanges() async {
    await currentNote!.save();
    if (mounted) {
      Navigator.pop(context);
    }
  }

  deleteNote() async {
    await currentNote!.delete();
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.note == null) {
      currentNote = Note(title: "未命名", content: "", tag: "");
    } else {
      currentNote = widget.note;
    }
    setState(() {});
    Future.delayed(
      Duration(milliseconds: 300),
      () => setState(() {
        canAnimate = true;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Positioned(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AnimatedOpacity(
                    curve: Curves.ease,
                    opacity: canAnimate ? 1 : 0,
                    duration: Duration(milliseconds: 300),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "笔记 --- ${currentNote?.title}",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Expanded(child: Container()),
                          widget.note != null
                              ? Row(
                                children: [
                                  InkWell(
                                    onTap: deleteNote,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                ],
                              )
                              : Container(),
                          InkWell(
                            onTap: saveChanges,
                            child: Icon(Icons.check, color: Colors.black),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 16,
                      ),
                    ),
                  ),

                  Container(
                    child: Row(
                      children: [
                        Text(
                          currentNote?.getTimestamp() ?? "",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Text(
                              "#",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              width: 100,
                              child: TextFormField(
                                onChanged:
                                    (value) => setState(() {
                                      currentNote?.tag = value;
                                    }),
                                initialValue: currentNote?.tag ?? '',
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: "标签",
                                  hintStyle: TextStyle(color: Colors.black54),
                                ),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(top: 16),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),

                  Container(
                    child: TextFormField(
                      onChanged:
                          (value) => setState(() {
                            currentNote?.title = value;
                          }),
                      initialValue: currentNote?.title ?? '',
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        hintStyle: TextStyle(color: Colors.black54),
                      ),
                      style: TextStyle(fontSize: 48, color: Colors.black),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  Container(
                    child: TextFormField(
                      onChanged:
                          (value) => setState(() {
                            currentNote?.content = value;
                          }),
                      cursorColor: Colors.black,
                      initialValue: currentNote?.content ?? '',
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Note description',
                        hintStyle: TextStyle(color: Colors.black54),
                      ),
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ],
              ),
              scrollDirection: Axis.vertical,
            ),
            bottom: 0,
            left: 0,
            top: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}
