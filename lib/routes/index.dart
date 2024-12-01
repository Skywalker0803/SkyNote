import "package:flutter/material.dart";
import "package:skynote/widgets/search_bar.dart";

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //      appBar: AppBar(title: Text("SkyNote")),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Search(),
            const SizedBox(height: 20),
            Card(
              //color: Theme.of(context).colorScheme.surfaceDim,
              child: Text("data Google &"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
