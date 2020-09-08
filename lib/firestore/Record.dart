import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String name;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(map, {this.reference})
    : assert(map.get('name') != null),
      assert(map.get('votes') != null),
      name = map.get('name'),
      votes = map.get('votes');

  Record.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}
