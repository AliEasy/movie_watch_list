class ListMetadata {
  final String currentPage;
  final int perPage;
  final int pageCount;
  final int totalCount;

  const ListMetadata(
      this.currentPage, this.perPage, this.pageCount, this.totalCount);

  const ListMetadata.init(
      {this.currentPage = '0',
      this.perPage = 0,
      this.pageCount = 0,
      this.totalCount = 0});
}
