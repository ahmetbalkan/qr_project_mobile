import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
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

@RoutePage()
class OtpVerificationPage extends ConsumerStatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends ConsumerState<OtpVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _verifyOtp(BuildContext context) {
    final otp = _otpController.text;

    if (otp.isEmpty) {
      showTopSnackBar(context, 'Please enter the OTP');
      return;
    }

    if (otp.length != 6) {
      showTopSnackBar(context, 'OTP must be 6 digits long');
      return;
    }

    // Form is valid, proceed with OTP verification
    context.router.push(const ChangePasswordRoute());
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
                          text: LocaleKeys.pincode_pincodetitle,
                          style: AppTextStyles.titleLarge),
                      const Space(),
                      LocaleText(
                          text: LocaleKeys.pincode_pincodedesc,
                          style: AppTextStyles.bodyLarge),
                      Space(
                        height: AppSpacing.spacing20,
                      ),
                      LocaleText(
                          text: LocaleKeys.pincode_otpcode,
                          style: AppTextStyles.bodyLarge
                              .copyWith(fontWeight: FontWeight.w600)),
                      Space(),
                      Pinput(
                        controller: _otpController,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        length: 6,
                        onCompleted: (value) {
                          _verifyOtp(context);
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        pinAnimationType: PinAnimationType.scale,
                        defaultPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          textStyle: AppTextStyles.displaySmall.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      Space(
                        height: AppSpacing.spacing20,
                      ),
                      LocaleText(
                          text: LocaleKeys.pincode_pincodedesc2,
                          style: AppTextStyles.bodyLarge),
                      Space(height: AppSpacing.spacing24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomButton(
                          onTap: () {
                            _verifyOtp(context);
                          },
                          isText: true,
                          height: 50.w,
                          width: 150.w,
                          text: LocaleKeys.pincode_checkotp.locale,
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
