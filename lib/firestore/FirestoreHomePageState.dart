import 'package:flutter/material.dart';
import 'FirestoreHomePage.dart';
import 'Record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHomePageState extends State<FirestoreHomePage> {

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Votes').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 22.0),
      children: snapshot.map((data) => buildListItem(context, data)).toList(),
    );
  }

  Widget buildListItem(BuildContext context, DocumentSnapshot data) {
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
          onTap: () {
            print(record);
          }
        ),
      ),
    );
  }
}
