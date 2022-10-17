import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/dimen.dart';
import '../../../utlis/custom_widgets/custom_text.dart';
import '../list/popular_movie_list.dart';

class MainWidget extends StatelessWidget {
  MainWidget({super.key});
  final List<PopularMovieListModal> _popoularMovieList = PopularMovieList.list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        height: 150,
        child: _buildHorizontalView(),
      ),
    );
  }

  Widget _buildHorizontalView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          child: _buildPopularMoviesItem(_popoularMovieList[index]),
        );
      },
      itemCount: _popoularMovieList.length,
    );
  }

  Widget _buildPopularMoviesItem(PopularMovieListModal list) {
    return Column(
      children: [
        _buildCircleView(list.image),
        _buildSizedBox(
          height: 10,
        ),
        Expanded(
            child: SizedBox(
          width: 80,
          child: CustomText(
              title: list.title,
              color: AppColors.black,
              textAlign: TextAlign.center),
        ))
      ],
    );
  }

  Widget _buildCircleView(String image) {
    return Container(
      width: AppDimen.size100,
      height: AppDimen.size100,
      padding: const EdgeInsets.all(AppDimen.size5),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.red),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimen.size50),
        ),
        color: AppColors.white,
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        backgroundImage: AssetImage(image),
        radius: AppDimen.size50,
      ),
    );
  }

  Widget _buildSizedBox({double height = 0, double width = 0}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
