import 'package:flutter/material.dart';
import 'package:movie_app/models/tv_series_model.dart';
import 'package:movie_app/pages/home/widgets/tv_horizontal_item.dart';

class TvHorizontalList extends StatelessWidget {
  final List<Result> series;

  const TvHorizontalList({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: series.length,
        itemBuilder: (context, index) {
          final serie = series[index];

          return TvHorizontalItem(tv: serie);
        },
      ),
    );
  }
}
