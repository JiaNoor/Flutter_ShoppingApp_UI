import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = ["Email", "Phone Number", "Date Of Birth", "City"];
    var pro1 = ["user@gmail.com", "95785462", "01-01-2000", "Karachi"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: Text(
          "My Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(children: [
              Image.asset('assets/images/pr1.png'),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                "Javeria Noor",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Divider(),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pro.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(
                          pro[index],
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          pro1[index],
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo),
                        ),
                        Divider(),
                      ],
                    );
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
