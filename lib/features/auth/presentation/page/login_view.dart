import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/services/local_storage.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/back_card_widegt.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia/features/auth/presentation/bloc/auth_event.dart';
import 'package:bookia/features/auth/presentation/bloc/auth_state.dart';
import 'package:bookia/features/auth/presentation/page/Register_View.dart';
import 'package:bookia/features/auth/presentation/page/confirm_password.dart';
import 'package:bookia/features/auth/presentation/widgets/nav_bar_widget.dart';
import 'package:bookia/features/auth/presentation/widgets/or_divider_widgt.dart';
import 'package:bookia/features/auth/presentation/widgets/social_btn_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPasswordVisible = false;

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pop(context);
          PushAndRemoveUntil(context, NavBarWidget());
        } else if (state is LoginErrorState) {
          Navigator.pop(context);
          showErrorDialog(context, state.error);
        } else if (state is LoginLoadingState) {
          ShowLoadingDialogs(context);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.whiteColor,
          title: Row(
            children: [
              BackCardWidegt(),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: getBodyTextStyle(fontSize: 14),
              ),
              TextButton(
                onPressed: () {
                  PushWithReplacement(context, const RegisterView());
                },
                child: Text(
                  'Register Now',
                  style: getTitleTextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back! Glad To See You, Again!',
                    style: getTitleTextStyle(
                      color: AppColors.blackColor,
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Gap(32),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: getSmallTextStyle(color: AppColors.greyColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.greyColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.borderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.redColor,
                          width: 2.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.redColor,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your email';
                      }
                      return null;
                    },
                  ),
                  const Gap(15),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: getSmallTextStyle(color: AppColors.greyColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.greyColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.borderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.redColor,
                          width: 2.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.redColor,
                          width: 2.0,
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(maxWidth: 33),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SvgPicture.asset(AssetesIcons.eyeSvg),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Push(context, const ConfirmPassword());
                        },
                        child: Text(
                          'Forget Password?',
                          style: getTitleTextStyle(
                            fontSize: 15,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Center(
                    child: CustomButton(
                      width: 330,
                      text: 'Login',
                      onPressed: () {
                        if (formKey.currentState != null &&
                            formKey.currentState!.validate()) {
                          print("Login button clicked!");
                          context.read<AuthBloc>().add(LoginEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ));
                        }
                      },
                    ),
                  ),
                  const Gap(30),
                  const OrDividerWidget(text: 'or login with'),
                  const Gap(20),
                  const SocialButtonsCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
