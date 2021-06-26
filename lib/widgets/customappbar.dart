import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  TextEditingController tc;
  Function getImageSearchText;
  CustomAppBar(this.tc, this.getImageSearchText);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 10,
        backgroundColor: Colors.lightGreenAccent,
        //leading: Icon(Icons.account_circle),
        centerTitle: false,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3)),
            child: TextField(
              controller: tc,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search_sharp,
                      size: 30,
                    ),
                    onPressed: () {
                      getImageSearchText();
                    },
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
        )),
        actions: [
          Icon(
            Icons.edit,
            color: Colors.black,
          ),
          Padding(
            child: Icon(
              Icons.calendar_today,
              color: Colors.black,
            ),
            padding: EdgeInsets.only(left: 10),
          ),
          SizedBox(
            width: 20,
          )
        ],
        title: Container(
          width: 50,
          child: Image.network(
              'https://github.githubassets.com/images/modules/profile/badge--acv-64.png'),
        )
        // title: Text('Search Image'),
        );
  }
}
