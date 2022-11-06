// ignore_for_file: prefer_const_constructors, prefer_final_fields, unnecessary_new, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  var _textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          children: [
            ListTile(
              title: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: "Input data to be passed....",
                  hintStyle: TextStyle(
                    color: Colors.grey
                  )
                ),
              ),
            ),
            ListTile(
              title: ElevatedButton(
                child: Text("Send"),
                onPressed: () {
                  var route = MaterialPageRoute(
                    builder: (BuildContext context) =>
                        NextPage(value: _textController.text),
                  );
                  Navigator.of(context).push(route);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  final String value;

  NextPage({Key? key, required this.value}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2nd Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          "${widget.value}",
          style: TextStyle(
            fontSize: 20
          ),
          ),
      ),
    );
  }
}
