import 'package:cinemapedia_220512/domain/entities/movie.dart';
import 'package:cinemapedia_220512/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




// 🔹 1. Definimos el tipo de función callback
typedef MovieCallback = Future<List<Movie>> Function({int page});

// 🔹 2. Provider principal
final nowPlayingMoviesProvider =
    NotifierProvider<MoviesNotifier, List<Movie>>(MoviesNotifier.new);

// 🔹 3. El Notifier que maneja el estado
class MoviesNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;
  late final MovieCallback fetchMoreMovies;
  bool isLoading = false;

  @override
  List<Movie> build() {
    // Obtenemos el repositorio desde el ref
    final repository = ref.watch(movieRepositoryProvider);
    fetchMoreMovies = repository.getNowPlaying;
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    currentPage++;
    final movies = await fetchMoreMovies(page: currentPage);

    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}