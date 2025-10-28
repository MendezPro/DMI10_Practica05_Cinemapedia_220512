
import 'package:cinemapedia_220472/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220472/domain/entities/movie.dart';

final movieSlideshowProvider = Provider<List<Movie>>((ref)
 {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  if (nowPlayingMovies.isEmpty) return [];
  
  return nowPlayingMovies.sublist(0, 6);
});
