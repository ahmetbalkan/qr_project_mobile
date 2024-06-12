import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qontact/core/constants/locale/locale_keys.g.dart';
import 'package:qontact/core/utils/locale/locale_extention.dart';
import 'package:qontact/presentation/global_widgets/buttons/custom_button.dart';
import 'package:qontact/presentation/global_widgets/buttons/custom_circle_icon_button.dart';
import 'package:qontact/presentation/global_widgets/locale_text/locale_text.dart';
import 'package:qontact/presentation/navigation/app_router.gr.dart';
import 'package:qontact/presentation/theme/app_color.dart';
import 'package:qontact/presentation/theme/app_spacing.dart';
import 'package:qontact/presentation/theme/space/app_edgeinsets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qontact/presentation/theme/space/space_widget.dart';
import 'package:qontact/presentation/theme/text_styles.dart';
import 'package:reactive_forms/reactive_forms.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late FormGroup loginform;

  @override
  void initState() {
    loginform = FormGroup({
      'email': FormControl<String>(
        validators: [
          Validators.required,
          Validators.email,
        ],
      ),
      'password': FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ReactiveForm(
        formGroup: loginform,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                          GestureDetector(
                            onTap: () {
                              context.router.push(const ForgotPasswordRoute());
                            },
                            child: LocaleText(
                              text:
                                  LocaleKeys.fotgotpassword_forgotpasswordtitle,
                              style: AppTextStyles.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                      Space(
                        height: AppSpacing.spacing32,
                      ),
                      LocaleText(
                          text: LocaleKeys.login_title,
                          style: AppTextStyles.titleLarge),
                      const Space(),
                      LocaleText(
                          text: LocaleKeys.login_desc,
                          style: AppTextStyles.bodyLarge),
                      Space(
                        height: AppSpacing.spacing20,
                      ),
                      LocaleText(
                          text: LocaleKeys.authentication_email,
                          style: AppTextStyles.bodyLarge
                              .copyWith(fontWeight: FontWeight.w600)),
                      Space(
                        height: AppSpacing.spacing4,
                      ),
                      ReactiveTextField<String>(
                        formControlName: 'email',
                        decoration: InputDecoration(
                          hintText:
                              LocaleKeys.authentication_pleaseenteremail.locale,
                          border: const OutlineInputBorder(),
                          hintStyle: AppTextStyles.bodyMedium,
                        ),
                      ),
                      const Space(),
                      LocaleText(
                          text: LocaleKeys.authentication_password,
                          style: AppTextStyles.bodyLarge
                              .copyWith(fontWeight: FontWeight.w600)),
                      Space(
                        height: AppSpacing.spacing4,
                      ),
                      ReactiveTextField<String>(
                        formControlName: 'password',
                        validationMessages: {
                          ValidationMessage.required: (error) => "asfsdfsdf",
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: LocaleKeys
                              .authentication_pleaseenterpassword.locale,
                          hintStyle: AppTextStyles.bodyMedium,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      Space(height: AppSpacing.spacing24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                          onTap: () {
                            if (loginform.valid) {
                              // Form is valid, proceed with registration
                              print(loginform.value);
                            } else {
                              loginform.markAllAsTouched();
                            }
                          },
                          isText: true,
                          height: 50.w,
                          width: 100.w,
                          text: LocaleKeys.login_login.locale,
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
