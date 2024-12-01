import "package:flutter/material.dart";
import "package:skynote/main.dart";
import "package:skynote/utils/ui.dart";

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 26),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.search),
            const SizedBox(width: 17),
            Expanded(
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: "搜索...",
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            InkWell(
              onTap:
                  () => showSheet(
                    scrollControlled: true,
                    context,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextButton(
                          onPressed: () => {},
                          child: Ink(
                            child: TextButton(
                              onPressed:
                                  () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const AboutPage(),
                                    ),
                                  ),
                              child: Row(
                                children: [
                                  const Icon(Icons.settings),
                                  SizedBox(width: 15),
                                  Text("设置"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              child: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
