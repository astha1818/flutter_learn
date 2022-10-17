import 'package:flutter/material.dart';
import 'package:flutter_learn/modules/demo_ui/list_model/movie_type_list_model.dart';
import '../../../modules/demo_ui/bloc/movie_bloc.dart';
import '../../../modules/demo_ui/list/movie_type_list.dart';
import '../../../utlis/helpers/global.dart';
import '../../../modules/demo_ui/list/popular_movie_list.dart';
import '../list_model/popular_movie_list_model.dart';
import '../../../res/colors.dart';
import '../../../res/dimen.dart';
import '../../../utlis/custom_widgets/custom_text.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final List<PopularMovieListModal> _popoularMpvieList = PopularMovieList.list;
  final List<MovieTypeListModal> _movieTypeList = MovieTypeList.list;
  final MovieBloc _movieBloc = MovieBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          backgroundColor: AppColors.black.withOpacity(0.4),
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomText(
                title: 'BUZZ',
                fontSize: AppDimen.size20,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                title: 'Discover what\'s treading in entertainment',
                fontSize: AppDimen.size16,
              )
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView(
          children: [
            _buildPopularMoviesList(),
            Divider(
              height: AppDimen.size24,
              thickness: 1,
              color: AppColors.black.withOpacity(0.2),
            ),
            _buildMovieType(),
            Divider(
              height: AppDimen.size24,
              thickness: 1,
              color: AppColors.black.withOpacity(0.2),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Buzz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }

  _buildPopularMoviesList() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: _buildPopularMoviesItem(_popoularMpvieList[index]),
            );
          },
          itemCount: _popoularMpvieList.length,
        ),
      ),
    );
  }

  _buildPopularMoviesItem(PopularMovieListModal list) {
    return Column(
      children: [
        Container(
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
            backgroundImage: AssetImage(list.image),
            radius: AppDimen.size50,
          ),
        ),
        const SizedBox(
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

  _buildMovieType() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Wrap(
        children: List<Widget>.generate(
          _movieTypeList.length,
          (index) => InkWell(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
            overlayColor: MaterialStateProperty.all(AppColors.red),
            onTap: () {
              printDebug(index);
              _movieBloc.updateIndex(index);
            },
            child: Container(
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
                border: Border.all(color: AppColors.red),
              ),
              child: CustomText(
                title: _movieTypeList[index].title,
                color: _movieBloc.state.selectedIndex == index
                    ? AppColors.white
                    : AppColors.red,
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }
}
