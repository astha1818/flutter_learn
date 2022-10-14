import 'package:flutter/material.dart';
import '../../../res/colors.dart';
import '../../../res/dimen.dart';
import '../../../utlis/custom_widgets/custom_text.dart';
import '../../../utlis/custom_widgets/custom_icon.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({
    super.key,
  });

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Container(
          decoration: _buildBorder(),
          padding: const EdgeInsets.all(AppDimen.size40),
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
              _buildSizedBox(height: AppDimen.size10),
              // _buildPhoneNumberText(args['email']),
              // _buildSizedBox(height: AppDimen.size10),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomIcon(
          icon: Icons.person,
          iconSize: AppDimen.size24,
        ),
        _buildSizedBox(width: AppDimen.size10),
        CustomText(
          title: fullName,
          fontSize: AppDimen.size24,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }

  _buildEmailText(String email) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomIcon(
          icon: Icons.mail,
          iconSize: AppDimen.size20,
        ),
        _buildSizedBox(width: AppDimen.size10),
        Expanded(
          child: CustomText(
            title: email,
            fontSize: AppDimen.size20,
          ),
        ),
      ],
    );
  }

  _buildPhoneNumberText(String args) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomIcon(
          icon: Icons.phone,
          iconSize: AppDimen.size20,
        ),
        _buildSizedBox(width: AppDimen.size10),
        Expanded(
          child: CustomText(
            title: args,
            fontSize: AppDimen.size20,
          ),
        ),
      ],
    );
  }
}
