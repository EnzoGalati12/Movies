import 'package:flutter/material.dart';
import 'package:movie_app/common/utils.dart';
import 'package:movie_app/models/people_popular_model.dart' as peopleModel;


class PeopleHorizontalItem extends StatelessWidget {
  const PeopleHorizontalItem({
    super.key,
    required this.peoples,
  });

  final peopleModel.Result peoples;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 140,
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.transparent,
              ],
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('$imageUrl${peoples.profilePath}'),
            ),
          ),
        ),
        // Adiciona o texto com o nome da pessoa
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Text(
            peoples.name, // Exibe o nome da pessoa
            style: const TextStyle(
              color: Colors.white, // Texto em branco
              fontWeight: FontWeight.bold,
              fontSize: 16,
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.black, // Sombra para maior contraste
                  offset: Offset(0, 2),
                ),
              ],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis, // Trunca o texto longo
            textAlign: TextAlign.center, // Centraliza o texto
          ),
        ),
      ],
    );
  }
}
