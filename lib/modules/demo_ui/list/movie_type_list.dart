import '../../../res/strings.dart';

class MovieTypeList {
  static final List<MovieTypeListModal> list = [
    MovieTypeListModal(
      AppStrings.movieType1,
    ),
    MovieTypeListModal(
      AppStrings.movieType2,
    ),
    MovieTypeListModal(
      AppStrings.movieType3,
    ),
    MovieTypeListModal(
      AppStrings.movieType4,
    ),
    MovieTypeListModal(
      AppStrings.movieType5,
    ),
    MovieTypeListModal(
      AppStrings.movieType6,
    ),
  ];
}

class MovieTypeListModal {
  String title;

  MovieTypeListModal(
    this.title,
  );
}
