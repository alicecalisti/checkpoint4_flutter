import 'package:flutter/material.dart';
import 'package:movie_app/models/review_model.dart';
import 'package:movie_app/services/api_services.dart';


class MovieReviewPage extends StatefulWidget {
  final int movieId;

  MovieReviewPage({required this.movieId});

  @override
  _MovieReviewPageState createState() => _MovieReviewPageState();
}

class _MovieReviewPageState extends State<MovieReviewPage> {
  late Future<ReviewResult> futureReviews;
  final ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    futureReviews = apiServices.getReviews(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews do Filme'),
      ),
      body: FutureBuilder<ReviewResult>(
        future: futureReviews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Nenhuma review encontrada.'));
          } else {
            final reviews = snapshot.data!.review;
            return ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          review.author,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        if (review.authorDetails != null)
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Nota: ${review.authorDetails!.rating}',
                                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        SizedBox(height: 8),
                        Text(
                          review.content,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

