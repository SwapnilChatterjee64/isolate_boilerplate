// To parse this JSON data, do
//
//     final newsListResponse = newsListResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_list_model.freezed.dart';
part 'news_list_model.g.dart';

NewsListResponse newsListResponseFromJson(String str) =>
    NewsListResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String newsListResponseToJson(NewsListResponse data) =>
    json.encode(data.toJson());

@freezed
abstract class NewsListResponse with _$NewsListResponse {
  const factory NewsListResponse({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) = _NewsListResponse;

  factory NewsListResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsListResponseFromJson(json);

  map(NewsListResponse Function(dynamic json) param0) {}
}

@freezed
abstract class Article with _$Article {
  const factory Article({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@freezed
abstract class Source with _$Source {
  const factory Source({
    String? id,
    String? name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
