// import 'dart:convert';

// class ReviewResult {
//   int id;
//   int page;
//   List<Review> review;
//   int totalPages;
//   int totalResults;

//   ReviewResult(
//       {required this.id,
//       required this.page,
//       required this.review,
//       required this.totalPages,
//       required this.totalResults
//       });

//   factory ReviewResult.fromRawJson(String str) => ReviewResult.fromJson(json.decode(str));

//   factory ReviewResult.fromJson(Map<String, dynamic> json) => ReviewResult(
//         id: json['id'],
//         page: json['page'],
//         review: List<Review>.from(json["results"].map((x)=>Review.fromJson(x))),
//         totalPages: json['total_pages'],
//         totalResults: json['total_results']
//       );

// }
// class Review {
//   String author;
//   AuthorDetails authorDetails;
//   String content;
//   String createdAt;
//   String id;
//   String updatedAt;
//   String url;

//   Review(
//       {required this.author,
//       required this.authorDetails,
//       required this.content,
//       required this.createdAt,
//       required this.id,
//       required this.updatedAt,
//       required this.url});

//   factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

//   factory Review.fromJson(Map<String, dynamic> json) => Review(
//     author: json['author'],
//     authorDetails: json['author_details'] != null
//         ? new AuthorDetails.fromJson(json['author_details'])
//         : null,
//     content: json['content'],
//     createdAt: json['created_at'],
//     id: json['id'],
//     updatedAt: json['updated_at'],
//     url: json['url']
//   );

// }

// class AuthorDetails {
//   String name;
//   String username;
//   String avatarPath;
//   int rating;

//   AuthorDetails({ required this.name,required this.username,required this.avatarPath,required this.rating});

//   factory AuthorDetails.fromRawJson(String str) => AuthorDetails.fromJson(json.decode(str));

//   factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
//     name: json['name'],
//     username: json['username'],
//     avatarPath: json['avatar_path'],
//     rating: json['rating']
//   );
// }

import 'dart:convert';

class ReviewResult {
  int id;
  int page;
  List<Review> review;
  int totalPages;
  int totalResults;

  ReviewResult({
    required this.id,
    required this.page,
    required this.review,
    required this.totalPages,
    required this.totalResults
  });

  factory ReviewResult.fromRawJson(String str) => ReviewResult.fromJson(json.decode(str));

  factory ReviewResult.fromJson(Map<String, dynamic> json) => ReviewResult(
    id: json['id'] ?? 0,
    page: json['page'] ?? 0,
    review: json['results'] != null ? List<Review>.from(json["results"].map((x) => Review.fromJson(x))) : [],
    totalPages: json['total_pages'] ?? 0,
    totalResults: json['total_results'] ?? 0,
  );
}

class Review {
  String author;
  AuthorDetails? authorDetails;
  String content;
  String createdAt;
  String id;
  String updatedAt;
  String url;

  Review({
    required this.author,
    this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url
  });

  factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    author: json['author'] ?? '',
    authorDetails: json['author_details'] != null ? AuthorDetails.fromJson(json['author_details']) : null,
    content: json['content'] ?? '',
    createdAt: json['created_at'] ?? '',
    id: json['id'] ?? '',
    updatedAt: json['updated_at'] ?? '',
    url: json['url'] ?? ''
  );
}

class AuthorDetails {
  String name;
  String username;
  String avatarPath;
  int rating;

  AuthorDetails({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating
  });

  factory AuthorDetails.fromRawJson(String str) => AuthorDetails.fromJson(json.decode(str));

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
    name: json['name'] ?? '',
    username: json['username'] ?? '',
    avatarPath: json['avatar_path'] ?? '',
    rating: json['rating'] ?? 0,
  );
}
