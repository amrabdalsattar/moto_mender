import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/domain_layer/use_cases/auth_usecases/login_usecase.dart';
import 'package:moto_mender/ui_layer/user_view/screens/auth_screens/register_screen.dart';
import 'package:moto_mender/utils/app_assets.dart';
import 'package:moto_mender/utils/base_states.dart';
import 'package:moto_mender/utils/dialog_utils.dart';
import 'package:moto_mender/utils/view_models/login_view_model.dart';

import '../../../../data_layer/repos/auth_repo/auth_repo_impl.dart';
import 'auth_shared_components/button.dart';
import 'auth_shared_components/text_button.dart';
import 'auth_shared_components/text_field.dart';


class LoginScreen extends StatelessWidget {

  static const routeName = "loginScreen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = LoginViewModel(LoginUseCase(AuthRepoImpl()));
    return Scaffold(
      body: BlocListener(
        bloc: viewModel,
        listener: (_, state) {

          if(state is BaseLoadingState){
            showLoading(context);
          }else if(state is BaseErrorState){
            Navigator.pop(context);
          }else if(state is BaseSuccessState){
            Navigator.pop(context);
          }
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: EdgeInsets.only(top: 80.h, right: 24.w, left: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Welcome To MotoMender 👋",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Log in to Enjoy our Services",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  CustomTextField(
                    title: "Email",
                    controller: viewModel.email,
                    hintText: 'example@mail.com',
                    prefixIconPath: AppAssets.email,
                    textInputType: TextInputType.emailAddress,
                    validator: (email) {
                      if (!RegExp(
                        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                      ).hasMatch(email!)) {
                        return "Email not valid";
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    title: "Password",
                    controller: viewModel.password,
                    hintText: 'Enter Password',
                    prefixIconPath: AppAssets.lock,
                    textInputType: TextInputType.visiblePassword,
                    isPassword: viewModel.passwordShowed,
                    eyeVisibility: true,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: CustomTextButton(
                        text: "Forgot Password?",
                        onPressed: () {},
                      )),
                  CustomButton(
                    title: "Log In",
                    onPressed: () {
                      viewModel.login();
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("You don't have an Account?", style: Theme.of(context).textTheme.headlineSmall,),
                      CustomTextButton(text: "Sign Up", onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
