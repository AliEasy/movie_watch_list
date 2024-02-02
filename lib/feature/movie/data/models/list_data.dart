import 'package:movie_watch_list/core/resources/list_data.dart';
import 'package:movie_watch_list/feature/movie/data/models/list_metadata.dart';
import 'package:movie_watch_list/feature/movie/data/models/movie.dart';

class ListDataModel<T> extends ListData<T> {
  const ListDataModel(
    List<T> data,
    ListMetadataModel metadata,
  ) : super(data, metadata);

  factory ListDataModel.fromJson(Map<String, dynamic> map) {
    return ListDataModel(
      List<T>.from(map['data'].map((x) => MovieModel.fromJson(x))),
      ListMetadataModel.fromJson(map['metadata']),
    );
  }
}
