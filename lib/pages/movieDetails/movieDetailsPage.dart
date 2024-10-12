import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/reviews/review_page.dart';
import 'package:movie_app/services/api_services.dart';
import '../../models/detail_model.dart';


// class MovieDetails extends StatefulWidget {
//   final int movieId;

//   const MovieDetails({super.key, required this.movieId});

//   @override
//   State<MovieDetails> createState() => _MovieDetailsState();
// }

// class _MovieDetailsState extends State<MovieDetails> {
//   late Future<Details> movieDetails;
//   ApiServices apiServices = ApiServices();

//   @override
//   void initState() {
//     fetchInitialData();
//     super.initState();
//     // futureMovieDetails = apiServices.getDetails(widget.movieId);
//   }

//   fetchInitialData(){
//     movieDetails = apiServices.getDetails(widget.movieId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Detalhes do Filme"),
//       ),
//       body: FutureBuilder<Details>(
//         future: movieDetails,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Erro: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return Center(child: Text('Nenhum dado encontrado.'));
//           } else {
//             final movieDetails = snapshot.data!;
//             return SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Center(
//                       child: Image.network(
//                         'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}',
//                         height: 300,
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       movieDetails.title,
//                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 8),
//                     Text('Gêneros: ${movieDetails.genres.map((genre) => genre.name).join(', ')}'),
//                     SizedBox(height: 8),
//                     Text('Línguas Faladas: ${movieDetails.spokenLanguages.map((lang) => lang.name).join(', ')}'),
//                     SizedBox(height: 16),
//                     Text(
//                       'Overview:',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 8),
//                     Text(movieDetails.overview),
//                     SizedBox(height: 16),
//                     Text('Classificação Indicativa: ${movieDetails.voteAverage}'),
//                   ],
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class MovieDetails extends StatefulWidget {
//   final int movieId;

//   MovieDetails({required this.movieId});

//   @override
//   _MovieDetailsState createState() => _MovieDetailsState();
// }

// class _MovieDetailsState extends State<MovieDetails> {
//   late Future<Details> futureMovieDetails;
//   final ApiServices apiServices = ApiServices();

//   @override
//   void initState() {
//     super.initState();
//     futureMovieDetails = apiServices.getDetails(widget.movieId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Detalhes do Filme"),
//       ),
//       body: FutureBuilder<Details>(
//         future: futureMovieDetails,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Erro: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return Center(child: Text('Nenhum dado encontrado.'));
//           } else {
//             final movieDetails = snapshot.data!;
//             return SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Center(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Image.network(
//                         'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}',
//                         height: 300,
//                       ),
//                       SizedBox(height: 16),
//                       Text(
//                         movieDetails.title,
//                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 8),
//                       Text('Gêneros: ${movieDetails.genres.map((genre) => genre.name).join(', ')}'),
//                       SizedBox(height: 8),
//                       Text('Línguas Faladas: ${movieDetails.spokenLanguages.map((lang) => lang.name).join(', ')}'),
//                       SizedBox(height: 16),
//                       Text(
//                         'Overview:',
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 8),
//                       Text(movieDetails.overview),
//                       SizedBox(height: 16),
//                       Text('Nota: ${movieDetails.voteAverage}'),
//                       SizedBox(height: 16),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => MovieVideoPage(movieId: movieDetails.id),
//                             ),
//                           );
//                         },
//                         child: Text('Assistir ao Vídeo'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class MovieVideoPage extends StatelessWidget {
//   final int movieId;

//   MovieVideoPage({required this.movieId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Vídeo do Filme'),
//       ),
//       body: Center(
//         child: Text('Aqui você vai exibir o vídeo do filme $movieId.'),
//       ),
//     );
//   }
// }

class MovieDetailsPage extends StatefulWidget {
  final int movieId;

  MovieDetailsPage({required this.movieId});

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late Future<Details> futureMovieDetails;
  final ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    futureMovieDetails = apiServices.getDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Filme"),
      ),
      body: FutureBuilder<Details>(
        future: futureMovieDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Nenhum dado encontrado.'));
          } else {
            final movieDetails = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}',
                          height: 300,
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          movieDetails.title,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gêneros: ${movieDetails.genres.map((genre) => genre.name).join(', ')}'),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Línguas Faladas: ${movieDetails.spokenLanguages.map((lang) => lang.name).join(', ')}'),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Overview:',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(movieDetails.overview),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieReviewPage(movieId: movieDetails.id),
                            ),
                          );
                        },
                        child: Text('Reviews'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}








