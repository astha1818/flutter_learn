import 'package:flutter/material.dart';
import '../../../bloc/bloc_builder.dart';
import '../../../res/colors.dart';
import '../../../res/dimen.dart';
import '../../../utlis/custom_widgets/custom_text.dart';
import '../bloc/movie_bloc.dart';
import '../list/movie_type_list.dart';

class MovieType extends StatelessWidget {
  MovieType({super.key});
  final List<MovieTypeListModal> _movieTypeList = MovieTypeList.list;
  final MovieBloc _movieBloc = MovieBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: () {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Wrap(
            children: List<Widget>.generate(
              _movieTypeList.length,
              (index) => _buildMovieTypeItem(index),
            ).toList(),
          ),
        );
      },
      bloc: _movieBloc,
    );
  }

  _buildMovieTypeItem(int index) {
    return GestureDetector(
      onTap: () {
        _movieBloc.updateIndex(index);
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
        color: _movieBloc.state.selectedIndex == index
            ? AppColors.red
            : AppColors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
        border: Border.all(
            color: _movieBloc.state.selectedIndex == index
                ? AppColors.red
                : AppColors.black),
      ),
      child: CustomText(
        title: _movieTypeList[index].title,
        color: _movieBloc.state.selectedIndex == index
            ? AppColors.white
            : AppColors.black,
      ),
    );
  }
}
