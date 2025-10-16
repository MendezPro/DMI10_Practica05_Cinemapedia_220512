import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220472/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia_220472/infrastructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref){
  return MovieRepositoryImpl(MoviedbDataSource());
});