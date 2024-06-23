import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qontact/core/constants/locale/locale_keys.g.dart';
import 'package:qontact/core/utils/locale/locale_extention.dart';
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
class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _repasswordController.dispose();
    super.dispose();
  }

  void _changePassword(BuildContext context) {
    final password = _passwordController.text;
    final repassword = _repasswordController.text;

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

    // Form is valid, proceed with changing password
    print({
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
                          text: LocaleKeys.changepassword_changepasswordtitle,
                          style: AppTextStyles.titleLarge),
                      const Space(),
                      LocaleText(
                          text: LocaleKeys.changepassword_changepassworddesc,
                          style: AppTextStyles.bodyLarge),
                      Space(
                        height: AppSpacing.spacing20,
                      ),
                      LocaleText(
                          text: LocaleKeys.authentication_password,
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
                            hintText: LocaleKeys.authentication_password.locale,
                            border: const OutlineInputBorder(),
                            hintStyle: AppTextStyles.bodyMedium,
                          ),
                        ),
                      ),
                      const Space(),
                      LocaleText(
                          text: LocaleKeys.authentication_repeatpassword,
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
                            hintText: LocaleKeys
                                .authentication_pleaseenterrepeatpassword
                                .locale,
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
                            _changePassword(context);
                          },
                          isText: true,
                          height: 50.w,
                          width: 150.w,
                          text: LocaleKeys
                              .changepassword_changepasswordbutton.locale,
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
