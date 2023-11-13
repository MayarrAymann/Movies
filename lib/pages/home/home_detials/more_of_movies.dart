import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class More_Of_Movies extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
                child:Stack(
                  children: [
                    Image.asset("assets/images/poster.png"),
                    Image.asset("assets/images/bookmark.png"),
                  ],
            ),
          ),
        ),
        Row(
          children: [
            Image.asset("assets/images/Group16.png"),
            SizedBox(width:5),
            Text('7.7' , style:
            TextStyle(fontSize: 15 , color: Colors.white),)
          ],
        ),
        Text("Deadpool 2" , style:
        TextStyle(fontSize: 15, color:Colors.white),),
        Text("2018  R  1h 59m" ,
          style:TextStyle(fontSize: 10 , color: Colors.grey.shade400),)
      ],
    );
  }


}