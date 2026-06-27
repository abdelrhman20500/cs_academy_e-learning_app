import 'package:cs_academy_e_learning_app/Core/theme/app_theme.dart';
import 'package:cs_academy_e_learning_app/Core/widgets/custom_bottom.dart';
import 'package:cs_academy_e_learning_app/Core/widgets/custom_text_form_field.dart';
import 'package:cs_academy_e_learning_app/Features/auth/presentation/view/sign_up_view.dart';
import 'package:cs_academy_e_learning_app/Features/auth/presentation/view/widget/top_logo.dart';
import 'package:flutter/material.dart';

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
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
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
                      CustomBottom(text: "Login",onPressed: (){},),
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
                              child: Text("SignUp", style:AppTheme.textStyle20.copyWith(color: Colors.blue) ,)),
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
  }
}


