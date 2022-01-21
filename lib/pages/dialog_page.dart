import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  TextEditingController _sendMessageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.2),
    elevation: 0,
    leading: FlatButton(
    onPressed: () {
    Navigator.pop(context);
    },
    child: Icon(
    Icons.arrow_back_ios,
    color: Colors.green,
    )),
    title: Row(
    children: <Widget>[
    Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    image: DecorationImage(
    image: NetworkImage(
    "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
    fit: BoxFit.cover)),
    ),
    SizedBox(
    width: 15,
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text(
    "Tyler Nix",
    style: TextStyle(
    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    SizedBox(
    height: 3,
    ),
    Text(
    "Active now",
    style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 14),
    )
    ],
    )
    ],
    ),
    actions: <Widget>[
    Icon(
    Icons.phone,
    color: Colors.green,
    size: 32,
    ),
    SizedBox(
    width: 15,
    ),
    Icon(
    Icons.camera,
    color: Colors.green,
    size: 35,
    ),
    SizedBox(
    width: 8,
    ),
    Container(
    width: 13,
    height: 13,
    decoration: BoxDecoration(
    color: Colors.purple,
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white38)),
    ),
    SizedBox(
    width: 15,
    )
    ,
    ]
    ,
    ),
    );
  }
}
