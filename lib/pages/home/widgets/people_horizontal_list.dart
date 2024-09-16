import 'package:flutter/material.dart';
import 'package:movie_app/models/people_popular_model.dart';

import 'package:movie_app/pages/home/details/details_people.dart';
import 'package:movie_app/pages/home/widgets/people_horizontal_item.dart';

class PeopleHorizontalList extends StatelessWidget {
  final List<Result> peoples;

  const PeopleHorizontalList({super.key, required this.peoples});

  @override
  Widget build(BuildContext context) {
    if (peoples.isEmpty) {
      return const Center(
        child: Text(
          'No popular people found',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: peoples.length,
        itemBuilder: (context, index) {
          final people = peoples[index];

          return GestureDetector(
            onTap: () {
              // Navegação para a página de detalhes, passando o ID da pessoa
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonDetailPage(
                      personId: people.id), // Passa o ID da pessoa
                ),
              );
            },
            child: PeopleHorizontalItem(peoples: people),
          );
        },
      ),
    );
  }
}
