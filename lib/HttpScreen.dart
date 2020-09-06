import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Post {
  final int date;
  final String state;

  Post({this.date, this.state});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      date: json['date'],
      state: json['state'],
    );
  }
}

Future<Post> fetchPost() async {
  final response =
  await get('https://api.covidtracking.com/v1/states/ca/current.json');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Post.fromJson(jsonDecode(response.body));
  } else {
    // If that call was not successful, flag an error.
    throw Exception('Failed to load post');
  }
}


class HttpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HTTP Screen"),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.state);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner
              return CircularProgressIndicator();
          },
          ),
        ),
    );
  }
}
