import 'package:flutter/material.dart';
import 'dart:core';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController txt = TextEditingController();
  var getText = "";
  var temp = "123456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Container(
              child: CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
          Center(
            child: SizedBox(
                height: 80,
                width: 350,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Username'),
                    ),
                  ),
                )),
          ),
          Center(
            child: SizedBox(
                height: 80,
                width: 350,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Password'),
                      controller: txt,
                      onChanged: (value) {
                        getText = value;
                      },
                    ),
                  ),
                )),
          ),
          Center(
            child: SizedBox(
              height: 5,
            ),
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      //add();
                    });
                    if (getText == temp) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                    } else {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Pass()));
                    }
                  },
                  child: Text("Login"))),
        ],
      ),
    );
  }
}

class Pass extends StatelessWidget {
  const Pass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Wrong Password"),
      content: Text("Enter Password Again"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.black),
            ))
      ],
    );
  }
}
