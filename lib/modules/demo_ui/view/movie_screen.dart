import 'package:flutter/material.dart';
import '../../../modules/demo_ui/view/horizontal_view.dart';
import '../../../modules/demo_ui/view/movie_type.dart';
import '../../../res/colors.dart';
import '../../../res/dimen.dart';
import '../../../utlis/custom_widgets/custom_text.dart';
import 'movie_list.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: _buildMainView(),
      ),
      bottomNavigationBar: _buildBottomNavigator(),
    );
  }

  _buildAppBar() {
    return AppBar(
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
      ),
    );
  }

  _buildMainView() {
    return ListView(
      children: [
        MainWidget(),
        MovieListView().buildDivider(
          AppDimen.size24,
        ),
        MovieType(),
        MovieListView().buildDivider(
          AppDimen.size24,
        ),
        MovieListView(),
      ],
    );
  }

  _buildBottomNavigator() {
    return BottomNavigationBar(
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
    );
  }
}
