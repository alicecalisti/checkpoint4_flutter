import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/home/widgets/movie_horizontal_item.dart';
import 'package:movie_app/pages/movieDetails/movieDetailsPage.dart';

class MoviesHorizontalList extends StatelessWidget {
  final List<Movie> movies;
  const MoviesHorizontalList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return  GestureDetector(
                  onTap: () {                    
                    Navigator.of(context).push(
                    MaterialPageRoute(          
                      builder: (context) => MovieDetailsPage(movieId: movies[index].id),
                    ),                    
                  );
                  },
                  child: MovieHorizontalItem(movie: movies[index]),
                );          
        },
      ),
    );
  }
}
