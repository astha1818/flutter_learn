import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/dimen.dart';
import '../../../utlis/custom_widgets/custom_text.dart';
import '../list/movie_list.dart';

class MovieListView extends StatelessWidget {
  MovieListView({super.key});

  final List<MovieListModal> _movieList = MovieList.list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return _buildMovieListItem(context, index);
            },
            itemCount: _movieList.length,
            separatorBuilder: (BuildContext context, int index) {
              return buildDivider(
                AppDimen.size30,
              );
            },
          ),
        )
      ],
    );
  }

  _buildMovieListItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          _buildMovieListImage(index),
          Column(
            children: [
              _buildMovieListTitleBookmark(context, index),
              _buildMovieListTimeFavShare(context, index),
            ],
          ),
        ],
      ),
    );
  }

  _buildMovieListImage(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15), // Image border
      child: SizedBox.fromSize(
        size: const Size.fromRadius(50), // Image radius
        child: Image.asset(_movieList[index].image, fit: BoxFit.cover),
      ),
    );
  }

  _buildMovieListTitleBookmark(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width - 130,
      padding: const EdgeInsets.only(left: AppDimen.size14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomText(
              title: _movieList[index].title,
              fontSize: AppDimen.size18,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _buildMovieListTimeFavShare(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width - 130,
      padding: const EdgeInsets.only(left: AppDimen.size14),
      margin: const EdgeInsets.only(top: AppDimen.size10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildMovieListProfileTime(index),
          _buildMovieListFavShare(index),
        ],
      ),
    );
  }

  _buildMovieListProfileTime(int index) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(_movieList[index].profilePic),
          radius: AppDimen.size12,
        ),
        _buildSizedBox(
          width: 5,
        ),
        CustomText(
          title: _movieList[index].time,
        ),
      ],
    );
  }

  _buildMovieListFavShare(int index) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.favorite_outline),
          onPressed: () {},
        ),
        CustomText(
          title: _movieList[index].favCount != '0'
              ? _movieList[index].favCount
              : '',
        ),
        IconButton(
          icon: const Icon(Icons.share_outlined),
          onPressed: () {},
        ),
      ],
    );
  }

  buildDivider(double height) {
    return Divider(
      height: height,
      thickness: 1,
      color: AppColors.black.withOpacity(0.2),
    );
  }

  _buildSizedBox({double height = 0, double width = 0}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
