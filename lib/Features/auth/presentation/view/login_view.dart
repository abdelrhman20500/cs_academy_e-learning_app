import 'package:cs_academy_e_learning_app/Core/constants/app_color.dart';
import 'package:cs_academy_e_learning_app/Core/functions/snack_bar_message.dart';
import 'package:cs_academy_e_learning_app/Core/theme/app_theme.dart';
import 'package:cs_academy_e_learning_app/Core/widgets/custom_bottom.dart';
import 'package:cs_academy_e_learning_app/Core/widgets/custom_text_form_field.dart';
import 'package:cs_academy_e_learning_app/Features/auth/data/repo/auth_repo.dart';
import 'package:cs_academy_e_learning_app/Features/auth/presentation/view/sign_up_view.dart';
import 'package:cs_academy_e_learning_app/Features/auth/presentation/view/widget/top_logo.dart';
import 'package:cs_academy_e_learning_app/Features/auth/presentation/view_manager/auth_cubit.dart';
import 'package:cs_academy_e_learning_app/Features/auth/presentation/view_manager/auth_states.dart';
import 'package:cs_academy_e_learning_app/Features/layout/presentation/view/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocProvider(
        create: (context) => AuthCubit(AuthRepo()),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is LoginFailure){
              snackBarMessage(context: context, text: state.error,backgroundColor: Colors.red);
            }else if(state is LoginSuccess){
              snackBarMessage(context: context,backgroundColor: Colors.green, text: "Login Success");
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
              const LayoutView()));
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: (){
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const TopLogo(text: "Login",),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: height*0.03,),
                              const Text("Email", style: AppTheme.textStyle20),
                              SizedBox(height: height*0.01,),
                              CustomTextFormField(
                                hintText: "Email",
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                suffixIcon: const Icon(Icons.email_outlined),
                              ),
                              SizedBox(height: height*0.03,),
                              const Text("Password", style: AppTheme.textStyle20),
                              SizedBox(height: height*0.01,),
                              CustomTextFormField(
                                hintText: "password",
                                keyboardType: TextInputType.text,
                                controller: passwordController,
                                suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                              ),
                              SizedBox(height: height*0.01,),
                              const Align(
                                alignment: Alignment.bottomRight,
                                child: Text("forget password ?", style: AppTheme.textStyle17),),
                              SizedBox(height: height*0.06,),
                               state is LoginLoading ? const Center(child: CircularProgressIndicator()) : CustomBottom(text: "Login",onPressed: (){
                                if(formKey.currentState!.validate()){
                                  BlocProvider.of<AuthCubit>(context).signIn(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim()
                                  );
                                }
                              },backgroundColor: AppColors.primaryColor,height: 56,),
                              SizedBox(height: height*0.03,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't have an account ?",style: AppTheme.textStyle18,),
                                  SizedBox(width: width*0.02,),
                                  InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                            SignUpView()));
                                      },
                                      child: Text("SignUp", style:AppTheme.textStyle20.copyWith(color: AppColors.primaryColor) ,)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


