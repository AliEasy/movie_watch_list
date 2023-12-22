import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movie_watch_list/config/color/app_color.dart';
import 'package:movie_watch_list/core/widgets/error.dart';
import 'package:movie_watch_list/feature/movie/domain/entities/movie.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie/remote/remote_movie_bloc.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie/remote/remote_movie_event.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie/remote/remote_movie_state.dart';
import 'package:movie_watch_list/feature/movie/presentation/widgets/movie_card.dart';
import 'package:shimmer/shimmer.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text(
        'Movie List',
        style: TextStyle(color: black),
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<RemoteMovieBloc, RemoteMovieState>(
      builder: (context, state) {
        if (state is RemoteMovieLoading) {
          return Shimmer.fromColors(
            baseColor: shimmerBaseColor,
            highlightColor: shimmerHighlightColor,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is RemoteMovieError) {
          return CustomErrorWidget(
            exception: state.error,
            retry: () {
              BlocProvider.of<RemoteMovieBloc>(context).add(const GetMovie());
            },
          );
        } else {
          List<MovieEntity> movieList = state.data!.data;
          return AnimationLimiter(
            child: ListView.builder(
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                var item = movieList[index];
                return MovieCard(
                  movie: item,
                  index: index,
                );
              },
            ),
          );
        }
      },
    );
  }
}
