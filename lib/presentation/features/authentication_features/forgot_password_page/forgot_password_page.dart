import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qontact/core/constants/locale/locale_keys.g.dart';
import 'package:qontact/core/utils/locale/locale_extention.dart';
import 'package:qontact/presentation/global_widgets/buttons/custom_button.dart';
import 'package:qontact/presentation/global_widgets/buttons/custom_circle_icon_button.dart';
import 'package:qontact/presentation/global_widgets/locale_text/locale_text.dart';
import 'package:qontact/presentation/global_widgets/snackbar/top_snackbar.dart';
import 'package:qontact/presentation/navigation/app_router.gr.dart';
import 'package:qontact/presentation/theme/app_color.dart';
import 'package:qontact/presentation/theme/app_spacing.dart';
import 'package:qontact/presentation/theme/space/app_edgeinsets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qontact/presentation/theme/space/space_widget.dart';
import 'package:qontact/presentation/theme/text_styles.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

@RoutePage()
class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendOtp(BuildContext context) {
    final email = _emailController.text;

    if (email.isEmpty) {
      showTopSnackBar(context, 'Please enter your email address');
      return;
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      showTopSnackBar(context, 'Please enter a valid email address');
      return;
    }

    // Form is valid, proceed with sending OTP
    context.router.push(const OtpVerificationRoute());
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
                          text: LocaleKeys.fotgotpassword_forgotpasswordtitle,
                          style: AppTextStyles.titleLarge),
                      const Space(),
                      LocaleText(
                          text: LocaleKeys.fotgotpassword_forgotpassworddesc,
                          style: AppTextStyles.bodyLarge),
                      Space(
                        height: AppSpacing.spacing20,
                      ),
                      LocaleText(
                          text: LocaleKeys.authentication_email,
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
                            _sendOtp(context);
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
