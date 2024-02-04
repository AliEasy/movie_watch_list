import 'package:movie_watch_list/core/resources/list_metadata.dart';

class ListData<T> {
  final List<T> data;
  final ListMetadata metadata;

  const ListData(this.data, this.metadata);
}
