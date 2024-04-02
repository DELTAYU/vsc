import 'package:flutter/material.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  State<ListViewBuilder> createState() => _ListViewBuilder();
}

class _ListViewBuilder extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View Builder')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return getItem(index);
        },
      ),
    );
  }
}

Widget getItem(
  int index,
) {
  print('getIteam called $index');
  return Container(
    margin: const EdgeInsets.only(top: 12, bottom: 32),
    height: 100,
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(2, 2),
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 35,
              color: Colors.black45,
            )
          ],
        )),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Name",
                style: TextStyle(
                  fontFamily: "NexaRegular",
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
              Text(
                ".........",
                style: TextStyle(
                  fontFamily: "NexaBold",
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Profession",
              style: TextStyle(
                fontFamily: "NexaRegular",
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
            Text(".......... ",
                style: TextStyle(
                  fontFamily: "NexaBold",
                  fontSize: 24,
                ))
          ],
        )),
      ],
    ),
  );
}
