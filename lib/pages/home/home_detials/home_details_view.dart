import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/pages/home/home_detials/more_of_movies.dart';

class HomeDetailsView extends StatelessWidget {
  static String routeName = "home details";

  @override
  Widget build(BuildContext context) {
    var mediaquary = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Dora and the lost city of gold",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/video.png",
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 200,
                top: 70,
                child: Image.asset("assets/images/play_button.png"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Text(
              "Dora and the lost city of gold",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              '2019  PG-13  2h 7m',
              style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/movieposter.png",
                    ),
                    Image.asset("assets/images/bookmark.png"),
                  ],
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text("Action",
                            style: TextStyle(fontSize: 20, color: Colors.grey)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0 , left: 5.0,),
                        child: Text("Having spent most of her life "
                            "\n exploring the jungle, nothing could"
                            "  prepare Dora for her most dangerous adventure yet — high school. ",
                            style: TextStyle(fontSize: 18, color: Colors.grey)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0 , left: 5.0),
                        child: Row(
                          children: [
                            Image.asset("assets/images/Group16.png"),
                            SizedBox(width:5),
                            Text('7.7' , style:
                            TextStyle(fontSize: 15 , color: Colors.white),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("More Like This " , style:
            TextStyle(fontSize: 20 , color: Colors.white)),
          ),
          Expanded(
                  child: ListView.builder (itemBuilder: (context , index) =>
                      More_Of_Movies() ,
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                  ),
          ),
        ],
      ),
    );
  }
}
