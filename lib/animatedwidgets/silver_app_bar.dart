import 'package:flutter/material.dart';

main() {
  runApp(SilverAppBar());
}

class SilverAppBar extends StatelessWidget {
  String status = "Extended ";
  List _buildList(int count) {
    List<Widget> listItems = List();
    for (int i = 0; i < count; i++) {
      listItems.add(new Padding(
          padding: new EdgeInsets.all(20.0),
          child: new Text('Item ${i.toString()}',
              style: new TextStyle(fontSize: 15.0))));
    }
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Icon(Icons.adb_outlined),
              onStretchTrigger: () {
                print("STREXH");
              },
              forceElevated: true,
              pinned: true,
              floating: true,
              expandedHeight: 170, // height of appBar in Expanded mode
              collapsedHeight: 61, // height of Appbar after collapsing
              stretchTriggerOffset: 8,
              // toolbarHeight: 120,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('Collapsible AppBar'),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  tooltip: 'Add new entry',
                  onPressed: () {
                    /* ... */
                  },
                ),
              ],
            ),
            SliverList(delegate: SliverChildListDelegate(_buildList(50))),
            // FlexibleSpaceBar(title: Text("s",),
          ],
        ),
      ),
    );
  }
}
