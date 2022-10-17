import '../../../res/images.dart';
import '../../../res/strings.dart';

class MovieList {
  static final List<MovieListModal> list = [
    MovieListModal(
      title: AppStrings.movieType1,
      image: AppImages.netflix,
      profilePic: AppImages.netflix,
      favCount: AppStrings.favCount,
      time: AppStrings.movieTime,
    ),
    MovieListModal(
      title: AppStrings.movieType2,
      image: AppImages.netflix,
      profilePic: AppImages.netflix,
      favCount: AppStrings.favCount,
      time: AppStrings.movieTime,
    ),
    MovieListModal(
      title: AppStrings.movieType3,
      image: AppImages.netflix,
      profilePic: AppImages.netflix,
      favCount: AppStrings.favCount,
      time: AppStrings.movieTime,
    ),
    MovieListModal(
      title: AppStrings.movieType4,
      image: AppImages.netflix,
      profilePic: AppImages.netflix,
      favCount: AppStrings.favCount,
      time: AppStrings.movieTime,
    ),
    MovieListModal(
      title: AppStrings.movieType5,
      image: AppImages.netflix,
      profilePic: AppImages.netflix,
      favCount: AppStrings.favCount,
      time: AppStrings.movieTime,
    ),
    MovieListModal(
      title: AppStrings.movieType6,
      image: AppImages.netflix,
      profilePic: AppImages.netflix,
      favCount: AppStrings.favCount,
      time: AppStrings.movieTime,
    ),
  ];
}

class MovieListModal {
  String title, image, profilePic, time, favCount;

  MovieListModal({
    required this.title,
    required this.image,
    required this.profilePic,
    required this.favCount,
    required this.time,
  });
}
