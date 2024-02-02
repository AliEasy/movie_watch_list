abstract class MovieListEvent {
  const MovieListEvent();
}

class GetMovieListEvent extends MovieListEvent {
  const GetMovieListEvent();
}

class MovieListLoadMoreEvent extends MovieListEvent {
  final int pageNumber;
  const MovieListLoadMoreEvent(this.pageNumber);
}
