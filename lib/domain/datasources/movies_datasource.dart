import 'package:cinemapedia_220472/domain/entities/movie.dart';


abstract class MoviesDatasource {
    Future<List<Movie>> getNowPlaying({int page = 1});
}