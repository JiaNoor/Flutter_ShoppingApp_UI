import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> ab = [
      Icons.location_on,
      Icons.phone_android,
      Icons.access_time,
      Icons.calendar_view_day
    ];
    var ab1 = ["Karachi", "95785462", "09:00-7:00", "Monday-Friday"];
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
          "About",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(children: [
              Image.asset('assets/images/ab1.png'),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                "Shopping App",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Divider(),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ab.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Icon(ab[index], color: Colors.indigo),
                        Text(
                          ab1[index],
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
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
