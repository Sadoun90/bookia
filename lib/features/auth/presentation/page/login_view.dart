import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
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
            PushAndRemoveUntil(context, NavBarWidget());
          } else if (state is LoginErrorState) {
            showErrorDialog(context, state.error);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.whiteColor,
            title: Row(
              children: [
                Container(
                  width: 41,
                  height: 41,
                  padding: EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.whiteColor,
                      border: Border.all(color: AppColors.borderColor)),
                  child: const Icon(Icons.arrow_back_ios_new_rounded),
                )
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
                    ))
                // Text(
                //   'Register Now',
                //   style: getTitleTextStyle(fontSize: 14),
                // ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(22),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back! Glad To See You,Again!',
                    style: getTitleTextStyle(
                        color: AppColors.blackColor,
                        fontSize: 22,
                        fontWeight: FontWeight.normal),
                  ),
                  const Gap(32),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: getSmallTextStyle(color: AppColors.greyColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.greyColor)),
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
                        return 'please enter your name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Gap(15),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isPasswordVisible,
                    decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle:
                            getSmallTextStyle(color: AppColors.greyColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.greyColor)),
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
                        suffixIcon: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                                child: SvgPicture.asset(AssetesIcons.eyeSvg)),
                          ],
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your name';
                      } else if (value.length < 6) {
                        return ('Passwprd must be at least 6 characters');
                      }
                      return null;
                    },
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            Push(context, ConfirmPassword());
                          },
                          child: Text(
                            'Forget Password?',
                            style: getTitleTextStyle(
                                fontSize: 15, color: AppColors.blackColor),
                          ))
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
                          context.read<AuthBloc>().add(LoginEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ));
                        }
                        PushWithReplacement(context, const NavBarWidget());
                      },
                    ),
                  ),
                  Gap(30),
                  OrDividerWidget(
                    text: 'or login with',
                  ),
                  const Gap(20),
                  SocialButtonsCard()
                ],
              ),
            ),
          ),
        ));
  }
}
