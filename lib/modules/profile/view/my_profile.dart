import 'package:flutter/material.dart';
import 'package:flutter_learn/res/strings.dart';
import 'package:flutter_learn/utlis/helpers/route.dart';
import '../../../res/colors.dart';
import '../../../res/dimen.dart';
import '../../../utlis/custom_widgets/custom_text.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({
    super.key,
  });

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  _navigateToGoogleMap() {
    Navigator.of(context).pushNamed(AppRoutes.googleMapScreen);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Container(
          decoration: _buildBorder(),
          padding: const EdgeInsets.all(AppDimen.size30),
          margin: const EdgeInsets.symmetric(
            horizontal: AppDimen.size30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildProfilePicture(args['profile_pic']),
              _buildSizedBox(height: AppDimen.size20),
              _buildNameText(args['full_name']),
              _buildSizedBox(height: AppDimen.size10),
              _buildEmailText(args['email']),
              _buildSizedBox(height: AppDimen.size20),
              _buildGoogleMapButton(),
            ],
          ),
        ),
      ),
    );
  }

  _buildProfilePicture(String profilePic) {
    return CircleAvatar(
      backgroundImage: NetworkImage(profilePic),
      radius: AppDimen.size50,
    );
  }

  _buildBorder() {
    return BoxDecoration(
      color: AppColors.red,
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimen.size10),
      ),
      gradient: const LinearGradient(
        colors: [
          AppColors.white,
          AppColors.blue,
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.blue.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  _buildSizedBox({double width = 0, double height = 0}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }

  _buildNameText(String fullName) {
    return CustomText(
      title: fullName,
      fontSize: AppDimen.size24,
      fontWeight: FontWeight.bold,
    );
  }

  _buildEmailText(String email) {
    return CustomText(
      title: email,
      fontSize: AppDimen.size20,
    );
  }

  _buildGoogleMapButton() {
    return ElevatedButton(
      onPressed: () {
        _navigateToGoogleMap();
      },
      child: const CustomText(
        title: 'Open ${AppStrings.googleMap}',
        color: AppColors.black,
        fontSize: AppDimen.size18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
