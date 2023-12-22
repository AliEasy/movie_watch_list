import 'package:movie_watch_list/feature/movie/domain/entities/list_metadata.dart';
import 'package:movie_watch_list/feature/movie/domain/entities/movie.dart';

class ListDataEntity {
  final List<MovieEntity> data;
  final ListMetadataEntity metadata;

  const ListDataEntity(this.data, this.metadata);
}
