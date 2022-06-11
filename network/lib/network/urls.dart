class Urls {
  static String apiKey = '';

  /// MOVIE
  static String movieDetail(int id) {
    return '/movie/$id?api_key=$apiKey';
  }

  static String moviePopular(int page) {
    return '/movie/popular?api_key=$apiKey&page=$page';
  }

  static String movieNowPlaying(int page) {
    return '/movie/now_playing?api_key=$apiKey&page=$page';
  }

  static String movieUpcoming(int page) {
    return '/movie/upcoming?api_key=$apiKey&page=$page';
  }

  /// TV
  static String tvOnAir(int page) {
    return '/tv/on_the_air?api_key=$apiKey&page=$page';
  }

  static String tvPopular(int page) {
    return '/tv/popular?api_key=$apiKey&page=$page';
  }

  static String tvDetail(int id) {
    return '/tv/$id?api_key=$apiKey';
  }
}
