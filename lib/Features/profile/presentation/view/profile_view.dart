import 'package:cs_academy_e_learning_app/Core/Routing/routes.dart';
import 'package:cs_academy_e_learning_app/Core/constants/app_color.dart';
import 'package:cs_academy_e_learning_app/Core/functions/snack_bar_message.dart';
import 'package:cs_academy_e_learning_app/Core/theme/app_theme.dart';
import 'package:cs_academy_e_learning_app/Features/profile/data/repo/profile_repo.dart';
import 'package:cs_academy_e_learning_app/Features/profile/presentation/view/widget/profile_list_title.dart';
import 'package:cs_academy_e_learning_app/Features/profile/presentation/view_manager/profile_cubit.dart';
import 'package:cs_academy_e_learning_app/Features/profile/presentation/view_manager/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(ProfileRepo())..getUserData(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileSignOutSuccess) {
              Navigator.pushNamedAndRemoveUntil(context, Routes.loginView, (route) => false);
            }
            if (state is ProfileSignOutFailure) {
              snackBarMessage(context: context, text: "Logout Failed: ${state.error}");
            }
            if (state is ProfileFailure) {
              snackBarMessage(context: context, text: "Failed to load profile: ${state.error}");
            }
          },
          builder: (context, state) {
            if (state is ProfileLoading || state is ProfileSignOutLoading) {
              return const Center(child: CircularProgressIndicator(color: Colors.deepPurple));
            }
            if (state is ProfileSuccess) {
              final user = state.userModel;
              final String nameInitial = user.name.isNotEmpty ? user.name[0].toUpperCase() : 'U';
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 60, bottom: 30, left: 24, right: 24),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primaryColor, Colors.indigo],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 43,
                            backgroundColor: Colors.deepPurple[50],
                            child: Text(
                              nameInitial,
                              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(state.userModel.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
                          const SizedBox(height: 4),
                          Text(state.userModel.email, style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.85)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            ProfileListTitle(icon:Icons.person,text1: "Account Details",text2: "View your login info",),
                            const Divider(height: 1, thickness: 0.5, indent: 64, endIndent: 16),
                            ProfileListTitle(icon:Icons.settings,text1: "App Settings",text2:"Preferences and core options",),
                            const Divider(height: 1, thickness: 0.5, indent: 64, endIndent: 16),
                            SwitchListTile(
                              secondary: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(color: Colors.grey[100], shape: BoxShape.circle),
                                child: const Icon(Icons.dark_mode, color: AppColors.primaryColor, size: 25),
                              ),
                              title: const Text("Dark Mode", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                              subtitle: const Text("Toggle interface theme", style: TextStyle(fontSize: 15)),
                              value: _isDarkMode,
                              activeColor: AppColors.primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  _isDarkMode = value;
                                });
                              },
                            ),
                            const Divider(height: 1, thickness: 0.5, indent: 64, endIndent: 16),
                            ProfileListTitle(icon:Icons.logout,text1: "Sign Out",text2:"Safely exit your account",
                            onTap: (){
                              _showLogoutDialog(context, context.read<ProfileCubit>());
                            },),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
  void _showLogoutDialog(BuildContext context, ProfileCubit cubit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Logout", style: AppTheme.textStyle20.copyWith(color: AppColors.primaryColor),),
        content: const Text("Are you sure you want to logout?", style: TextStyle(color: AppColors.primaryColor),),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel",style: AppTheme.textStyle18,),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              cubit.signOut();
            },
            child: const Text("Logout", style: TextStyle(fontSize: 18, color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

