import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/constants.dart';
import '../../../models/movie_model.dart';

class More_Of_Movies extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as MovieModel ;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
                child:Stack(
                  children: [
                    Image.network(
                      "${Constants.imageBaseURL}${ args.posterPath}",
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    Image.asset("assets/images/bookmark.png"),
                  ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Row(
            children: [
              Image.asset("assets/images/Group16.png"),
              // SizedBox(width:5),
              Text(
                "${args.voteAverage}" ,
                style:
              TextStyle(fontSize: 15 , color: Colors.white),)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            args.originalTitle?? "" ,
           style:
          TextStyle(fontSize: 15, color:Colors.white),),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5.0),
              child: Text(
                args.releaseDate ?? "",
                style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
              ),
            ),
            Text("7 h 2m" ,style:
            TextStyle(fontSize: 10, color: Colors.grey.shade400) )
          ],
        ),
      ],
    );
  }


}