import 'package:movie_watch_list/feature/movie/data/models/list_metadata.dart';
import 'package:movie_watch_list/feature/movie/data/models/movie.dart';
import 'package:movie_watch_list/feature/movie/domain/entities/list_data.dart';

class ListDataModel extends ListDataEntity {
  const ListDataModel(
    List<MovieModel> data,
    ListMetadataModel metadata,
  ) : super(data, metadata);

  factory ListDataModel.fromJson(Map<String, dynamic> map) {
    return ListDataModel(
      List<MovieModel>.from(map['data'].map((x) => MovieModel.fromJson(x))),
      ListMetadataModel.fromJson(map['metadata']),
    );
  }
}
