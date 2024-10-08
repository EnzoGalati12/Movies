import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/home/details/details_page.dart'; // Corrija o caminho se necessário
import 'package:movie_app/widgets/custom_card_thumbnail.dart';

class NowPlayingList extends StatefulWidget {
  final List<Movie> movies;
  const NowPlayingList({super.key, required this.movies});

  @override
  State<NowPlayingList> createState() => _NowPlayingListState();
}

class _NowPlayingListState extends State<NowPlayingList> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            itemCount: widget.movies.length,
            itemBuilder: (context, index) {
              final movie = widget.movies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                          movieId: movie.id), // Navegação para a DetailsPage
                    ),
                  );
                },
                child: CustomCardThumbnail(
                  imageAsset: movie.posterPath,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildPageIndicators(),
        ),
      ],
    );
  }

  List<Widget> _buildPageIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < 7; i++) {
      indicators.add(_buildIndicator(i == currentPage));
    }
    return indicators;
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
