import 'package:movie_watch_list/core/resources/list_metadata.dart';

class ListMetadataModel extends ListMetadata {
  ListMetadataModel(
    String currentPage,
    int perPage,
    int pageCount,
    int totalCount,
  ) : super(currentPage, perPage, pageCount, totalCount);

  factory ListMetadataModel.fromJson(Map<String, dynamic> map) {
    return ListMetadataModel(
      map['current_page'],
      map['per_page'],
      map['page_count'],
      map['total_count'],
    );
  }
}
