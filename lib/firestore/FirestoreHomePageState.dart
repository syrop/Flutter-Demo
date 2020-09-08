import 'package:flutter/material.dart';
import 'FirestoreHomePage.dart';
import 'Record.dart';

class FirestoreHomePageState extends State<FirestoreHomePage> {

  final party = [
    {"name": "BJP", "votes": 1},
    {"name": "Congress", "votes": 3},
    {"name": "AAP", "votes": 5},
    {"name": "Janata Dal Party", "votes": 9},
    {"name": "NOTA", "votes": 11},
  ];

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    // We will add the code here in the next section
    return buildList(context, party);
  }

  Widget buildList(BuildContext context, List<Map> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 22.0),
      children: snapshot.map((data) => buildListItem(context, data)).toList(),
    );
  }

  Widget buildListItem(BuildContext context, Map data) {
    final record = Record.fromMap(data);

    // Adding the padding to ensure enough space is given
    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6.0),
        ),
        // Showing the list item, with name towards the left and the votes to the right
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.votes.toString()),
          onTap: () => print(record),
        ),
      ),
    );
  }
}
