import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moto_mender/domain_layer/use_cases/auth_usecases/register_usecase.dart';
import 'package:moto_mender/utils/view_models/register_view_model.dart';

import '../../../data_layer/repos/auth_repo/auth_repo_impl.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/base_states.dart';
import '../../../utils/dialog_utils.dart';
import 'auth_shared_components/button.dart';
import 'auth_shared_components/text_button.dart';
import 'auth_shared_components/text_field.dart';

class RegisterScreen extends StatelessWidget {

  static const routeName = "registerScreen";
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterViewModel viewModel = RegisterViewModel(RegisterUseCase(AuthRepoImpl()));
    return Scaffold(
      body: BlocListener(
        bloc: viewModel,
        listener: (_, state) {
          print("state : $state");
          if(state is BaseLoadingState){
            showLoading(context);
          }else{
            Navigator.pop(context);
          }
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: EdgeInsets.only(top: 60.h, right: 24.w, left: 24.w),
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
                    "Sign Up now to Enjoy our Services",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextField(
                    title: "Full Name",
                    controller: viewModel.name,
                    hintText: 'Enter your full name',
                    prefixIconPath: AppAssets.user,
                    textInputType: TextInputType.name,
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
                    isPassword: true,
                  ),
                  CustomTextField(
                    title: "Re Enter Password",
                    controller: viewModel.reEnterPassword,
                    hintText: 'Re Enter Password',
                    prefixIconPath: AppAssets.lock,
                    textInputType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomButton(
                    title: "Sign Up",
                    onPressed: () {
                      viewModel.register();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have Account?", style: Theme.of(context).textTheme.headlineSmall,),
                      CustomTextButton(text: "Log In", onPressed: () {
                        Navigator.pop(context);
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
