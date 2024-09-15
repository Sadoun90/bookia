import 'package:bookia/core/constants/assetes_icons.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/functions/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/core/widgets/textformfeild_widget.dart';
import 'package:bookia/features/auth/data/models/request/register_params.dart';
import 'package:bookia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia/features/auth/presentation/bloc/auth_event.dart';
import 'package:bookia/features/auth/presentation/bloc/auth_state.dart';
import 'package:bookia/features/auth/presentation/page/login_view.dart';
import 'package:bookia/features/auth/presentation/widgets/nav_bar_widget.dart';
import 'package:bookia/features/auth/presentation/widgets/or_divider_widgt.dart';
import 'package:bookia/features/auth/presentation/widgets/social_btn_card.dart';
import 'package:bookia/features/home/presentation/page/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isPasswordVisible1 = false;
  bool isPasswordVisible2 = false;

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          PushAndRemoveUntil(context, NavBarWidget());
        } else if (state is RegisterErrorState) {
          showErrorDialog(context, state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.whiteColor,
            title: Row(
              children: [
                Container(
                  width: 41,
                  height: 41,
                  padding: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.whiteColor,
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: getBodyTextStyle(fontSize: 14),
                ),
                TextButton(
                  onPressed: () {
                    PushWithReplacement(context, LoginView());
                  },
                  child: Text(
                    'Login Now',
                    style: getTitleTextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello! Register To Get Started',
                      style: getTitleTextStyle(
                        color: AppColors.blackColor,
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle:
                            getSmallTextStyle(color: AppColors.greyColor),
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
                          return 'please enter your name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'email',
                        hintStyle:
                            getSmallTextStyle(color: AppColors.greyColor),
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
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(15),
                    TextFormField(
                      obscureText: isPasswordVisible1,
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle:
                              getSmallTextStyle(color: AppColors.greyColor),
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
                          suffixIcon: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPasswordVisible1 = !isPasswordVisible1;
                                    });
                                  },
                                  child: SvgPicture.asset(AssetesIcons.eyeSvg)),
                            ],
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(15),
                    TextFormField(
                      obscureText: isPasswordVisible2,
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle:
                              getSmallTextStyle(color: AppColors.greyColor),
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
                          suffixIcon: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPasswordVisible2 = !isPasswordVisible2;
                                    });
                                  },
                                  child: SvgPicture.asset(AssetesIcons.eyeSvg)),
                            ],
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter confirm password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(20),
                    state is RegisterLoadingState
                        ? Center(child: const CircularProgressIndicator())
                        : Center(
                            child: CustomButton(
                              width: 330,
                              text: 'Register',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context
                                      .read<AuthBloc>()
                                      .add(RegisterEvent(RegisterParams(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        passwordConfirmation:
                                            confirmPasswordController.text,
                                      )));
                                }
                              },
                            ),
                          ),
                    const Gap(7),
                    // OrDividerWidget(
                    //   text: 'or Register with',
                    // ),
                    // const Gap(8),
                    // SocialButtonsCard(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
