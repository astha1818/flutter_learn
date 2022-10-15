import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_learn/bloc/bloc_builder.dart';
import 'package:flutter_learn/modules/tutorial/bloc/tutorial_bloc.dart';
import 'package:flutter_learn/modules/tutorial/data/tutorial_data_model.dart';
import '../../../modules/tutorial/data/tutorial_list.dart';
import '../../login/view/login.dart';
import '../../../utlis/custom_widgets/custom_text.dart';
import '../../../res/dimen.dart';
import '../../../res/strings.dart';
import '../../../res/colors.dart';

const int _tutorialItemBase = 1000;

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final PageController _pageViewController =
      PageController(initialPage: _tutorialItemBase);
  late Timer? _timer;
  final List<TutorialDataModal> _list = TutorialList.list;
  final TutorialBloc _tutorialBloc = TutorialBloc();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _stopTimer();
  }

  _startTimer() {
    _timer = _getTimer();
  }

  _stopTimer() {
    _timer?.cancel();
  }

  Timer _getTimer() {
    return Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      _nextPage();
    });
  }

  _nextPage() {
    _pageViewController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: () => Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _buildPageView(),
              ),
              _buildIndicatorSkipView(),
            ],
          ),
        ),
      ),
      bloc: _tutorialBloc,
    );
  }

  _buildPageView() {
    return PageView.builder(
      itemBuilder: (context, index) {
        return _buildItemBuilder(index);
      },
      controller: _pageViewController,
      onPageChanged: (int index) {
        _tutorialBloc.updateIndex(index);
      },
    );
  }

  _buildItemBuilder(int index) {
    return GestureDetector(
      onLongPressStart: (_) {
        _stopTimer();
      },
      onLongPressEnd: (_) {
        _startTimer();
      },
      child: Container(
        color: AppColors.white,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(
            AppDimen.size40, AppDimen.size80, AppDimen.size40, AppDimen.size80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appNameText(),
            _sizedBox(AppDimen.size20),
            _titleText(index),
            _sizedBox(AppDimen.size20),
            _descriptionText(index),
            _sizedBox(AppDimen.size20),
            _tutorialImage(index),
          ],
        ),
      ),
    );
  }

  _appNameText() {
    return const CustomText(
      title: AppStrings.appName,
      fontSize: AppDimen.size18,
      fontWeight: FontWeight.bold,
      color: AppColors.red,
    );
  }

  _sizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  _titleText(int index) {
    return CustomText(
      title: _list[_tutorialBloc.state.index].title,
      fontSize: AppDimen.size25,
      fontWeight: FontWeight.bold,
    );
  }

  _descriptionText(int index) {
    return CustomText(
      title: _list[_tutorialBloc.state.index].description,
      fontSize: AppDimen.size18,
      fontWeight: FontWeight.bold,
    );
  }

  _tutorialImage(int index) {
    return Image.asset(
      _list[_tutorialBloc.state.index].tutorialIcon,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.contain,
    );
  }

  _buildIndicatorSkipView() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: AppDimen.size50),
          child: CustomText(title: ''),
        ),
        _buildIndicator(),
        _buildSkipButton(),
      ],
    );
  }

  _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        _list.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimen.size5),
          child: InkWell(
            onTap: () {},
            child: Container(
              height: AppDimen.size10,
              width: _tutorialBloc.state.index == index
                  ? AppDimen.size20
                  : AppDimen.size10,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(AppDimen.size5)),
                color: AppColors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildSkipButton() {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      },
      child: const CustomText(
        title: AppStrings.skip,
        fontSize: AppDimen.size14,
        color: AppColors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
