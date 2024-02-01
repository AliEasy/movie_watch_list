import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movie_watch_list/config/color/app_color.dart';
import 'package:movie_watch_list/configureDependencies.dart';
import 'package:movie_watch_list/core/widgets/error.dart';
import 'package:movie_watch_list/feature/movie/domain/entities/movie.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie_list/movie_list_bloc.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie_list/movie_list_event.dart';
import 'package:movie_watch_list/feature/movie/presentation/bloc/movie_list/movie_list_state.dart';
import 'package:movie_watch_list/feature/movie/presentation/widgets/movie_card.dart';
import 'package:shimmer/shimmer.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie List',
          style: TextStyle(color: black),
        ),
      ),
      body: BlocProvider(
        create: (context) {
          var bloc = getIt<MovieListBloc>();
          bloc.add(const GetMovieListEvent());
          return bloc;
        },
        child: BlocBuilder<MovieListBloc, MovieListState>(
          builder: (context, state) {
            if (state is MovieListLoading) {
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
            } else if (state is MovieListError) {
              return CustomErrorWidget(
                exception: state.error,
                retry: () {
                  context.read<MovieListBloc>().add(const GetMovieListEvent());
                },
              );
            } else {
              List<MovieEntity> movieList = state.data!.data;
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<MovieListBloc>().add(const GetMovieListEvent());
                },
                child: AnimationLimiter(
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
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
