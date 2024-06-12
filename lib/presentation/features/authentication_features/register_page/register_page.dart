import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  late FormGroup registerform;

  @override
  void initState() {
    registerform = FormGroup({
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
                      ReactiveTextField<String>(
                        formControlName: 'email',
                        decoration: InputDecoration(
                          hintText: 'Please Enter your Email Address',
                          border: const OutlineInputBorder(),
                          hintStyle: AppTextStyles.bodyMedium,
                        ),
                      ),
                      const Space(),
                      LocaleText(
                          text: "Password",
                          style: AppTextStyles.bodyLarge
                              .copyWith(fontWeight: FontWeight.w600)),
                      Space(height: AppSpacing.spacing4),
                      ReactiveTextField<String>(
                        formControlName: 'password',
                        validationMessages: {
                          ValidationMessage.required: (error) => "asfsdfsdf",
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Please Enter your Password',
                          hintStyle: AppTextStyles.bodyMedium,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const Space(),
                      LocaleText(
                          text: "Repeat Password",
                          style: AppTextStyles.bodyLarge
                              .copyWith(fontWeight: FontWeight.w600)),
                      Space(height: AppSpacing.spacing4),
                      ReactiveTextField<String>(
                        formControlName: 'repassword',
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Re-enter Password',
                          border: const OutlineInputBorder(),
                          hintStyle: AppTextStyles.bodyMedium,
                        ),
                      ),
                      Space(height: AppSpacing.spacing24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                          onTap: () {
                            if (registerform.valid) {
                              // Form is valid, proceed with registration
                              print(registerform.value);
                            } else {
                              // Form is invalid, display validation errors
                              registerform.markAllAsTouched();
                            }
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
