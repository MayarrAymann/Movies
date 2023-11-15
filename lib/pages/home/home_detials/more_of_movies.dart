import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/constants.dart';
import '../../../models/movie_model.dart';

class More_Of_Movies extends StatelessWidget{
  final MovieModel model;

  const More_Of_Movies({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as MovieModel ;
    return SizedBox(
      width: 120,
      height: 200,
      child:Card(
        color: const Color(0xff343534),
        elevation: 50,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color(0xff343534),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        "${Constants.imageBaseURL}${ args.posterPath}",
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      Image.asset("assets/images/bookmark.png"),
                    ],
                    ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ImageIcon(
                        AssetImage("assets/images/star_rate.png"),
                        color: Color(0xffFFBB3B),
                      ),
                      // SizedBox(width:5),
                      Text(
                        "${args.voteAverage}" ,
                        style:
                        TextStyle(fontSize: 10 , color: Colors.white),)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      args.originalTitle?? "" ,
                      style:
                      TextStyle(fontSize: 10, color:Colors.white),),
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
                      TextStyle(fontSize: 5, color: Colors.grey.shade400) )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }


}