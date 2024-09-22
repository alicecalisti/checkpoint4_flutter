import 'package:flutter/cupertino.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/common/utils.dart';

class DetailsMovie extends StatelessWidget {
  final List<Details> details;
  const DetailsMovie({super.key, required this.details});



@override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: details.map((detail){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('$imageUrl${detail.posterPath}'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  detail.title ,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Ano de Lançamento: ${detail.releaseDate}.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Avaliação: ${detail.popularity}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  detail.overview,
                  style: TextStyle(fontSize: 16),
                ),
              ),          
            ],
          );
        }).toList(), 
      ),
    );
  }
  
}

