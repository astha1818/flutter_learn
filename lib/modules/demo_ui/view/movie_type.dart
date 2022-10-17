import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/dimen.dart';
import '../../../utlis/custom_widgets/custom_text.dart';
import '../bloc/movie_bloc.dart';
import '../list/movie_type_list.dart';

class MovieType extends StatelessWidget {
  MovieType({super.key});
  final List<MovieTypeListModal> _movieTypeList = MovieTypeList.list;
  final MovieBloc movieBloc = MovieBloc();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Wrap(
        children: List<Widget>.generate(
          _movieTypeList.length,
          (index) => _buildMovieTypeItem(index),
        ).toList(),
      ),
    );
  }

  _buildMovieTypeItem(int index) {
    return GestureDetector(
      onTap: () {
        movieBloc.updateIndex(index);
      },
      child: _buildMovieTypeGestureDetectorChild(index),
    );
  }

  _buildMovieTypeGestureDetectorChild(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimen.size10, vertical: AppDimen.size5),
      margin: const EdgeInsets.all(AppDimen.size5),
      decoration: BoxDecoration(
        color: movieBloc.state.selectedIndex == index
            ? AppColors.red
            : AppColors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
        border: Border.all(
            color: movieBloc.state.selectedIndex == index
                ? AppColors.red
                : AppColors.black),
      ),
      child: CustomText(
        title: _movieTypeList[index].title,
        color: movieBloc.state.selectedIndex == index
            ? AppColors.white
            : AppColors.black,
      ),
    );
  }
}
