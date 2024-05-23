import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController textEditingController = TextEditingController();

  List<String> listData = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("TodoApp"),
        ),
        body: Column(children: [
          Row(children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter a task"),
                  ),
                ),
              ),
            ),
            MaterialButton(
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  print(textEditingController.text);
                  listData.add(textEditingController.text);
                });
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ]),
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(listData[index])),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          print(index);
                          listData.removeAt(index);
                        });
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    )
                  ],
                );
              },
              itemCount: listData.length,
            ),
          )
        ]),
      ),
    );
  }
}
