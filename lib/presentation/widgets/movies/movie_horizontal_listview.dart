import 'package:cinemapedia_220472/domain/entities/movie.dart';
import 'package:flutter/material.dart';

// Widget que muestra una lista horizontal de películas con scroll
class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  // VoidCallback es una función sin parámetros ni retorno - sirve para cargar más películas
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null || subTitle != null)
            _CurrDate(place: title, formateDate: subTitle),

          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              // Axis.horizontal hace que el scroll sea de izquierda a derecha
              scrollDirection: Axis.horizontal,
              // BouncingScrollPhysics da el efecto de rebote al llegar al final
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: movies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              // ClipRRect recorta la imagen con bordes redondeados
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: 150,
                // loadingBuilder maneja el estado mientras carga la imagen desde internet
                loadingBuilder: (context, child, loadingProgress) {
                  return child;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrDate extends StatelessWidget {
  final String? place;
  final String? formateDate;

  const _CurrDate({this.place, this.formateDate});

  @override
  Widget build(BuildContext context) {
    final placeStyle = Theme.of(context).textTheme.titleMedium;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (place != null) Text(place!, style: placeStyle),
          Spacer(),
          if (formateDate != null)
            FilledButton.tonal(onPressed: () {}, child: Text(formateDate!)),
        ],
      ),
    );
  }
}
