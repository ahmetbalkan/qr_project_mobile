import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qontact/core/constants/locale/locale_keys.g.dart';
import 'package:qontact/core/utils/locale/locale_extention.dart';
import 'package:qontact/presentation/global_widgets/buttons/custom_button.dart';
import 'package:qontact/presentation/global_widgets/buttons/custom_circle_icon_button.dart';
import 'package:qontact/presentation/global_widgets/locale_text/locale_text.dart';
import 'package:qontact/presentation/theme/app_color.dart';
import 'package:qontact/presentation/theme/app_spacing.dart';
import 'package:qontact/presentation/theme/space/app_edgeinsets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qontact/presentation/theme/space/space_widget.dart';
import 'package:qontact/presentation/theme/text_styles.dart';
import 'package:reactive_forms/reactive_forms.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

@RoutePage()
class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  late FormGroup changepasswordform;
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    changepasswordform = FormGroup({
      'password': FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
      'repassword': FormControl<String>(
        validators: [Validators.required],
      ),
    }, validators: [
      Validators.mustMatch('password', 'repassword'),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ReactiveForm(
        formGroup: changepasswordform,
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
                      ReactiveTextField<String>(
                        formControlName: 'password',
                        decoration: InputDecoration(
                          hintText: LocaleKeys.authentication_password.locale,
                          border: const OutlineInputBorder(),
                          hintStyle: AppTextStyles.bodyMedium,
                        ),
                      ),
                      const Space(),
                      LocaleText(
                          text: LocaleKeys.authentication_repeatpassword,
                          style: AppTextStyles.bodyLarge
                              .copyWith(fontWeight: FontWeight.w600)),
                      Space(height: AppSpacing.spacing4),
                      ReactiveTextField<String>(
                        formControlName: 'repassword',
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: LocaleKeys
                              .authentication_pleaseenterrepeatpassword.locale,
                          border: const OutlineInputBorder(),
                          hintStyle: AppTextStyles.bodyMedium,
                        ),
                      ),
                      Space(height: AppSpacing.spacing24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                          onTap: () {
                            if (changepasswordform.valid) {
                              print(changepasswordform.value);
                            } else {
                              changepasswordform.markAllAsTouched();
                            }
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
