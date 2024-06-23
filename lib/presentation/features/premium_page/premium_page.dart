import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qontact/presentation/global_widgets/buttons/custom_button.dart';
import 'package:qontact/presentation/global_widgets/locale_text/locale_text.dart';
import 'package:qontact/presentation/global_widgets/logo_widget.dart';
import 'package:qontact/presentation/navigation/app_router.gr.dart';
import 'package:qontact/presentation/theme/app_color.dart';
import 'package:qontact/presentation/theme/app_spacing.dart';
import 'package:qontact/presentation/theme/space/app_border_radius.dart';
import 'package:qontact/presentation/theme/space/app_edgeinsets.dart';
import 'package:qontact/presentation/theme/space/space_widget.dart';
import 'package:qontact/presentation/theme/text_styles.dart';

@RoutePage()
class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  _PremiumPageState createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  String _selectedPlan = '1 Month';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: Padding(
                  padding: AppEdgeInset.horizontal(value: AppSpacing.spacing16),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LogoWidget(
                              fontsize: 60.sp,
                              isWhite: false,
                            ),
                            IconButton(
                              icon: Icon(
                                CupertinoIcons.xmark_circle,
                                size: 40.sp,
                                color: AppColors.secondary,
                              ),
                              onPressed: () {
                                context.router.pushAndPopUntil(
                                    const EmptyHomeRoute(),
                                    predicate: (_) => false);
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              child: LocaleText(
                                text: 'Go Premium',
                                style: AppTextStyles.displayMedium.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              child: LocaleText(
                                text:
                                    "Özelliklerden faydalanmak için Premium'a geçin ve avantajları keşfedin.",
                                style: AppTextStyles.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            SizedBox(height: AppSpacing.spacing16),
                            _buildPlanButton('Aylık',
                                "plan al istediğin zaman iptal et.", '\$4', ''),
                            const Space(),
                            _buildPlanButton(
                                '3 Aylık',
                                "plan al istediğin zaman iptal et.",
                                '\$10',
                                '15% Kar'),
                            const Space(),
                            _buildPlanButton(
                                'Yıllık',
                                "plan al istediğin zaman iptal et.",
                                '\$36',
                                '25% Kar'),
                          ],
                        ),
                      ),
                      Flexible(
                        child: CustomButton(
                          isText: true,
                          height: 60.h,
                          backgroundColor: AppColors.secondary,
                          text: 'Satın Al',
                          onTap: () {
                            context.router.pushNamed('/payment');
                          },
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Space(),
                            LocaleText(
                              text: "Premium Özellikleri Keşfet",
                              style: AppTextStyles.bodyMedium,
                            ),
                            const Space(),
                            FaIcon(FontAwesomeIcons.arrowDown)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PremiumFeaturesTable()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanButton(
      String plan, String desc, String price, String savings) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlan = plan;
        });
      },
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.all(AppSpacing.spacing16),
          border: Border.all(
            color: _selectedPlan == plan ? AppColors.secondary : AppColors.grey,
            width: AppSpacing.spacing4,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Theme(
                data: ThemeData(
                  unselectedWidgetColor: AppColors.secondary,
                ),
                child: Transform.scale(
                  scale: 1.5, // Checkbox boyutunu büyütmek için ölçeklendirme
                  child: Padding(
                    padding: const EdgeInsets.all(
                        4.0), // İç kısmına padding eklemek için
                    child: Checkbox(
                      shape: const CircleBorder(),
                      value: _selectedPlan == plan,
                      onChanged: (bool? value) {
                        setState(() {
                          _selectedPlan = plan;
                        });
                      },
                      checkColor: Colors.white,
                      activeColor: AppColors.secondary,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan,
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    desc,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    savings,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    price,
                    style: AppTextStyles.titleLarge.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PremiumFeaturesTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppEdgeInset.all(value: AppSpacing.spacing16),
      child: Container(
        padding: AppEdgeInset.all(value: AppSpacing.spacing16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondary),
          borderRadius: AppBorderRadius.all(AppSpacing.spacing16),
        ),
        child: Column(
          children: [
            Table(
              columnWidths: {
                0: FlexColumnWidth(4),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),
              },
              border: TableBorder(
                horizontalInside: BorderSide(color: AppColors.secondary),
                verticalInside: BorderSide.none,
              ),
              children: [
                TableRow(
                  children: [
                    _buildTableHeader("Özellik", TextAlign.left),
                    _buildTableHeader("Standart", TextAlign.center),
                    _buildTableHeader("Premium", TextAlign.center),
                  ],
                ),
                _buildTableRow("Kişisel Sayfa", true, true),
                _buildTableRow("Restaurant", false, true),
                _buildTableRow("Pet Tasması", false, true),
                _buildTableRow("Yaşlılar İçin QR", false, true),
                _buildTableRow("Araç Şikayet", false, true),
                _buildTableRow("App Download", false, true),
                _buildTableRow("WiFi Şifresi", false, true),
                _buildTableRow("Birden Fazla QR Oluşturma", false, true),
                _buildTableRow("QR Farklı Kullanıcı Ekleme", false, true),
                _buildTableRow("QR'ın O Anki Sahibini Değiştirme", false, true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(
      String feature, bool isAvailableFree, bool isAvailablePremium) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            feature,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildCheckIcon(isAvailableFree),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildCheckIcon(isAvailablePremium),
        ),
      ],
    );
  }

  Widget _buildCheckIcon(bool isChecked) {
    return Icon(
      isChecked ? FontAwesomeIcons.check : FontAwesomeIcons.times,
      color: isChecked ? Colors.green : Colors.red,
    );
  }

  Widget _buildTableHeader(String title, TextAlign? textAlign) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: AppTextStyles.bodyMedium.copyWith(
          fontWeight: FontWeight.w500,
        ),
        textAlign: textAlign ?? TextAlign.left,
      ),
    );
  }
}
