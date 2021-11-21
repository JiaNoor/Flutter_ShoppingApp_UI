import 'package:flutter/material.dart';

Widget cart(String name, String price, String img, context) {
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
    ),
    body: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Image(
            image: AssetImage(img),
            width: MediaQuery.of(context).size.width * .50,
            height: MediaQuery.of(context).size.height * 0.50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(price),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
              child: Text(
                  "This is a product you want. It is of imported quality and available in different colors."))
        ],
      ),
    ),
  );
}
