import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_watch_list/core/widgets/widgets.dart';
import 'package:movie_watch_list/feature/movie/domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;
  final int index;

  const MovieCard({super.key, required this.movie, required this.index});

  @override
  Widget build(BuildContext context) {
    return listItemAnimator(
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Card(
          clipBehavior: Clip.hardEdge,
          elevation: 5,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              height: 100,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            if ((movie.poster ?? '').isNotEmpty)
                              CachedNetworkImage(
                                width: 80,
                                height: 100,
                                imageUrl: movie.poster ?? '',
                                fit: BoxFit.fill,
                                errorWidget: (context, url, error) {
                                  return SizedBox(
                                    width: 80,
                                    height: 100,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/svg/no_image.svg',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  );
                                },
                                placeholder: (context, url) {
                                  return const Center(
                                    child: CupertinoActivityIndicator(),
                                  );
                                },
                              )
                            else
                              SizedBox(
                                width: 80,
                                height: 100,
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/svg/no_image.svg',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: AutoSizeText(
                                            movie.title ?? '',
                                            maxLines: 2,
                                            style: const TextStyle(
                                                fontFamily: 'Muli',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          movie.year ?? '',
                                          style: const TextStyle(
                                              fontFamily: 'Muli', fontSize: 13),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Icon(
                                          Icons.star_rate_rounded,
                                          size: 14,
                                          color: Colors.orange,
                                        ),
                                        Text(
                                          movie.imdbRating ?? '',
                                          style: const TextStyle(
                                              fontFamily: 'Muli', fontSize: 13),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(color: Colors.black, fontFamily: 'Muli', fontSize: 12),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
      index: index,
    );
  }
}
