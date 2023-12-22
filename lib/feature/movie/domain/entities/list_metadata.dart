class ListMetadataEntity {
  final String currentPage;
  final int perPage;
  final int pageCount;
  final int totalCount;

  const ListMetadataEntity(
      this.currentPage, this.perPage, this.pageCount, this.totalCount);
}
