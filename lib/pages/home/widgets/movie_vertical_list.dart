import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/home/details/details_page.dart';  // Corrigido o caminho para a página de detalhes
import 'package:movie_app/pages/home/widgets/movie_horizontal_item.dart';

class MoviesVerticalList extends StatelessWidget {
  final List<Movie> movies;

  const MoviesVerticalList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return GestureDetector(
            onTap: () {
              // Navegação para a página de detalhes, passando o ID do filme
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(movieId: movie.id),  // Passa o ID do filme
                ),
              );
            },
            child: MovieHorizontalItem(movie: movie),
          );
        },
      ),
    );
  }
}
