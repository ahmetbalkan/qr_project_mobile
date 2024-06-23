import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qontact/presentation/global_widgets/buttons/custom_button.dart';
import 'package:qontact/presentation/global_widgets/buttons/custom_circle_icon_button.dart';
import 'package:qontact/presentation/global_widgets/locale_text/locale_text.dart';
import 'package:qontact/presentation/global_widgets/snackbar/top_snackbar.dart';
import 'package:qontact/presentation/theme/app_color.dart';
import 'package:qontact/presentation/theme/app_spacing.dart';
import 'package:qontact/presentation/theme/space/app_edgeinsets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qontact/presentation/theme/space/space_widget.dart';
import 'package:qontact/presentation/theme/text_styles.dart';

@RoutePage()
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();
    super.dispose();
  }

  void _register(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;
    final repassword = _repasswordController.text;

    if (email.isEmpty) {
      showTopSnackBar(context, 'Please enter your email address');
      return;
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      showTopSnackBar(context, 'Please enter a valid email address');
      return;
    }

    if (password.isEmpty) {
      showTopSnackBar(context, 'Please enter your password');
      return;
    }

    if (password.length < 8) {
      showTopSnackBar(context, 'Password must be at least 8 characters long');
      return;
    }

    if (repassword.isEmpty) {
      showTopSnackBar(context, 'Please re-enter your password');
      return;
    }

    if (password != repassword) {
      showTopSnackBar(context, 'Passwords do not match');
      return;
    }

    // Form is valid, proceed with registration
    print({
      'email': email,
      'password': password,
      'repassword': repassword,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: AppEdgeInset.horizontal(value: AppSpacing.spacing16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Space(
                        height: AppSpacing.spacing40,
                      ),
                      CustomCircleIconButton(
                        padding: 15.w,
                        backgroundColor: AppColors.primary,
                        icon: Icons.arrow_back,
                        iconColor: Colors.white,
                        iconSize: 20.w,
                        onPressed: () {
                          context.router.maybePop();
                        },
                      ),
                      Space(
                        height: AppSpacing.spacing32,
                      ),
                      LocaleText(
                          text: 'Create Your Account',
                          style: AppTextStyles.titleLarge),
                      const Space(),
                      LocaleText(
                          text:
                              'Please enter your information to create an account.',
                          style: AppTextStyles.bodyLarge),
                      Space(
                        height: AppSpacing.spacing20,
                      ),
                      LocaleText(
                          text: "Email",
                          style: AppTextStyles.bodyLarge
                              .copyWith(fontWeight: FontWeight.w600)),
                      Space(height: AppSpacing.spacing4),
                      SizedBox(
                        height: 60.w,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.grey,
                              ),
                            ),
                            hintText: 'Please Enter your Email Address',
                            border: const OutlineInputBorder(),
                            hintStyle: AppTextStyles.bodyMedium,
                          ),
                        ),
                      ),
                      const Space(),
                      LocaleText(
                          text: "Password",
                          style: AppTextStyles.bodyLarge
                              .copyWith(fontWeight: FontWeight.w600)),
                      Space(height: AppSpacing.spacing4),
                      SizedBox(
                        height: 60.w,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.grey,
                              ),
                            ),
                            hintText: 'Please Enter your Password',
                            hintStyle: AppTextStyles.bodyMedium,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const Space(),
                      LocaleText(
                          text: "Repeat Password",
                          style: AppTextStyles.bodyLarge
                              .copyWith(fontWeight: FontWeight.w600)),
                      Space(height: AppSpacing.spacing4),
                      SizedBox(
                        height: 60.w,
                        child: TextFormField(
                          controller: _repasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.grey,
                              ),
                            ),
                            hintText: 'Re-enter Password',
                            border: const OutlineInputBorder(),
                            hintStyle: AppTextStyles.bodyMedium,
                          ),
                        ),
                      ),
                      Space(height: AppSpacing.spacing24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                          onTap: () {
                            _register(context);
                          },
                          isText: true,
                          height: 50.w,
                          width: 100.w,
                          text: "Register",
                        ),
                      ),
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
