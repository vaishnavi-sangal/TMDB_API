import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/description.dart' as desc;

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Trending Movies',
            size: 26,
            color: Colors.white,
          ),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => desc.Description(
                                      name: trending[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path'],
                                      description: trending[index]['overview'],
                                      vote: trending[index]['vote_average']
                                          .toString(),
                                      launch_on: trending[index]
                                          ['release_date'],
                                    )));
                      },
                      child: trending[index]['title'] != null
                          ? Container(
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500' +
                                                trending[index]['poster_path']),
                                      ),
                                    ),
                                    height: 200,
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    child: modified_text(
                                        size: 15,
                                        color: Colors.white,
                                        text: trending[index]['title'] != null
                                            ? trending[index]['title']
                                            : 'Loading'),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                    );
                  }))
        ],
      ),
    );
  }
}

class Description {}
