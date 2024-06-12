import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  late FormGroup registerform;

  @override
  void initState() {
    registerform = FormGroup({
      'email': FormControl<String>(),
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ReactiveForm(
        formGroup: registerform,
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
                          text: LocaleKeys.fotgotpassword_forgotpasswordtitle,
                          style: AppTextStyles.titleLarge),
                      const Space(),
                      LocaleText(
                          text: LocaleKeys.fotgotpassword_forgotpassworddesc,
                          style: AppTextStyles.bodyLarge),
                      Space(
                        height: AppSpacing.spacing20,
                      ),
                      //TODO Keyboard Type Ayarla
                      LocaleText(
                          text: LocaleKeys.authentication_email,
                          style: AppTextStyles.bodyLarge
                              .copyWith(fontWeight: FontWeight.w600)),
                      Space(height: AppSpacing.spacing4),
                      Container(
                        height: 60.w,
                        child: ReactiveTextField<String>(
                          formControlName: 'email',
                          decoration: InputDecoration(
                            fillColor: AppColors.grey,
                            hintText: LocaleKeys
                                .authentication_pleaseenteremail.locale,
                            hintStyle: AppTextStyles.bodyMedium,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Space(height: AppSpacing.spacing24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                          onTap: () {
                            context.router.push(const OtpVerificationRoute());

                            /*   if (registerform.valid) {
                              // Form is valid, proceed with registration
                              print(registerform.value);
                            } else {
                              // Form is invalid, display validation errors
                              registerform.markAllAsTouched();
                            }*/
                          },
                          isText: true,
                          height: 50.w,
                          width: 150.w,
                          text: LocaleKeys.fotgotpassword_sendotp.locale,
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
