import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/home/details/details_page.dart';
import 'package:movie_app/pages/home/widgets/recommendation_item.dart';  // Corrigido o caminho para a página de detalhes


class RecommendationHorizontalList extends StatelessWidget {
  final List<Movie> recommendations;

  const RecommendationHorizontalList({super.key, required this.recommendations});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final rec = recommendations[index];

          return GestureDetector(
            onTap: () {
              // Navegação para a página de detalhes, passando o ID do filme
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(movieId: rec.id),  // Passa o ID do filme
                ),
              );
            },
            child: RecommendationHorizontalItem(recommendation: rec),
          );
        },
      ),
    );
  }
}
