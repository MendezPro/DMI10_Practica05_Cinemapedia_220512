import 'package:cinemapedia_220472/domain/repositories/movies_repository.dart';
import 'package:cinemapedia_220472/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_220472/domain/entities/movie.dart';

class MovieRepositoryImpl implements MoviesRepository{
  
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

}