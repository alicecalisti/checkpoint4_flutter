import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/movieDetails/widgets/detailsmovie.dart';
import 'package:movie_app/services/api_services.dart';

class MovieDetails extends StatefulWidget {
  final int movieId;
  const MovieDetails({super.key, required this.movieId});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  ApiServices apiServices = ApiServices();
  late Future<ResultDetail>? details;

  @override
  void initState() {
    super.initState();
    _loadDetails();
  }

  void _loadDetails() {
    setState(() {
      details = apiServices.getDetails(widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: FutureBuilder(
      future: details, 
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
            );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
            );
        }
        if (!snapshot.hasData || snapshot.data!.details.isEmpty) {
          return const Center(
            child: Text('Nenhum detalhe encontrado.'),
            );
        }
        return DetailsMovie(details: snapshot.data!.details);

      })
    );
  }
}

