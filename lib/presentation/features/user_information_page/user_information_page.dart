import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qontact/core/constants/locale/locale_keys.g.dart';
import 'package:qontact/core/utils/locale/locale_extention.dart';
import 'package:qontact/presentation/global_widgets/locale_text/locale_text.dart';
import 'package:qontact/presentation/global_widgets/logo_widget.dart';
import 'package:qontact/presentation/global_widgets/snackbar/top_snackbar.dart';
import 'package:qontact/presentation/navigation/app_router.gr.dart';
import 'package:qontact/presentation/theme/app_color.dart';
import 'package:qontact/presentation/theme/app_spacing.dart';
import 'package:qontact/presentation/theme/space/app_edgeinsets.dart';
import 'package:qontact/presentation/theme/space/space_widget.dart';
import 'package:qontact/presentation/theme/text_styles.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

@RoutePage()
class UserInformationPage extends StatefulWidget {
  const UserInformationPage({super.key});

  @override
  _UserInformationPageState createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  bool _isPhoneVisible = true;
  bool _isNotificationEnabled = false;
  bool _isSocialMediaVisible = true;
  bool _isNameVisible = true;
  bool _isProfilePhotoVisible = true;
  bool _isKVKKAccepted = false;
  bool _shareSocialMedia = true;
  bool _isUploading = false;

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _qrNoteController = TextEditingController();
  XFile? _profileImage;

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _surnameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _qrNoteFocusNode = FocusNode();

  final List<String> _socialMediaOptions = [
    'Instagram',
    'Facebook',
    'LinkedIn'
  ];
  final List<Map<String, TextEditingController>> _socialMediaFields = [];
  String _selectedSocialMedia = 'Instagram';

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _qrNoteController.dispose();
    _socialMediaFields.forEach((element) => element.values.first.dispose());
    super.dispose();
  }

  Future<void> _pickImage() async {
    setState(() {
      _isUploading = true;
    });

    if (await Permission.photos.request().isGranted) {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _profileImage = image;
        _isUploading = false;
      });
    } else {
      setState(() {
        _isUploading = false;
      });
      showTopSnackBar(context, LocaleKeys.personalinformation_noaccess.locale);
    }
  }

  bool _checkNotificationPermission() {
    return false;
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  bool _isProfilePageValid() {
    return _profileImage != null;
  }

  bool _isNamePageValid() {
    return _nameController.text.isNotEmpty;
  }

  bool _isSurnamePageValid() {
    return _surnameController.text.isNotEmpty;
  }

  bool _isEmailPageValid() {
    final email = _emailController.text;
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return email.isNotEmpty && emailRegex.hasMatch(email);
  }

  bool _isPhonePageValid() {
    return _phoneController.text.isNotEmpty &&
        RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(_phoneController.text);
  }

  bool _isKVKKValid() {
    return _isKVKKAccepted;
  }

  void _nextPage() {
    if (_currentPage == 0 && !_isKVKKValid()) {
      showTopSnackBar(
          context, LocaleKeys.personalinformation_kvkkapproval.locale);
    } else if (_currentPage == 1 && !_isProfilePageValid()) {
      showTopSnackBar(
          context, LocaleKeys.personalinformation_addprofilephoto.locale);
    } else if (_currentPage == 2 && !_isNamePageValid()) {
      showTopSnackBar(context, LocaleKeys.personalinformation_entername.locale);
    } else if (_currentPage == 3 && !_isSurnamePageValid()) {
      showTopSnackBar(
          context, LocaleKeys.personalinformation_entersurname.locale);
    } else if (_currentPage == 4 && !_isEmailPageValid()) {
      showTopSnackBar(
          context, LocaleKeys.personalinformation_validemail.locale);
    } else if (_currentPage == 5 && !_isPhonePageValid()) {
      showTopSnackBar(
          context, LocaleKeys.personalinformation_validphone.locale);
    } else if (_currentPage == 7 &&
        _shareSocialMedia &&
        _socialMediaFields.any((field) => field.values.first.text.isEmpty)) {
      showTopSnackBar(
          context, LocaleKeys.personalinformation_socialmedia_empty.locale);
    } else {
      _pageController
          .nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.ease)
          .then((_) => _autoFocusCurrentPage());
    }
  }

  void _autoFocusCurrentPage() {
    switch (_currentPage) {
      case 2:
        FocusScope.of(context).requestFocus(_nameFocusNode);
        break;
      case 3:
        FocusScope.of(context).requestFocus(_surnameFocusNode);
        break;
      case 4:
        FocusScope.of(context).requestFocus(_emailFocusNode);
        break;
      case 5:
        FocusScope.of(context).requestFocus(_phoneFocusNode);
        break;
      case 6:
        FocusScope.of(context).requestFocus(_qrNoteFocusNode);
        break;
      default:
        FocusScope.of(context).unfocus();
        break;
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController
          .previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          )
          .then((_) => _autoFocusCurrentPage());
    }
  }

  void _addSocialMediaField(String platform) {
    setState(() {
      _socialMediaFields.add({platform: TextEditingController()});
    });
  }

  void _removeSocialMediaField(Map<String, TextEditingController> field) {
    setState(() {
      _socialMediaFields.remove(field);
    });
  }

  Widget _buildSwitchListTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      title: Text(title),
      trailing: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  Widget _starterPage() {
    return Padding(
      padding: AppEdgeInset.all(value: AppSpacing.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(height: AppSpacing.spacing32),
          Text(
            LocaleKeys.personalinformation_welcometitle.locale,
            style: AppTextStyles.titleLarge,
          ),
          Space(height: AppSpacing.spacing8),
          LocaleText(
            text: LocaleKeys.personalinformation_welcomedescription.locale,
            style: AppTextStyles.bodyLarge,
          ),
          Space(height: AppSpacing.spacing8),
          LocaleText(
            text: LocaleKeys.personalinformation_infousagetitle.locale,
            style: AppTextStyles.bodyLarge,
          ),
          Space(height: AppSpacing.spacing8),
          LocaleText(
            text: LocaleKeys.personalinformation_securitypurpose.locale,
            style: AppTextStyles.bodyLarge,
          ),
          Space(height: AppSpacing.spacing20),
          GestureDetector(
            onTap: () {
              // KVKK bilgilendirme metni için bir sayfa ya da modal açabilirsiniz
            },
            child: Text(
              LocaleKeys.personalinformation_kvkkinfolink.locale,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          Space(height: AppSpacing.spacing20),
          Row(
            children: [
              CupertinoSwitch(
                value: _isKVKKAccepted,
                onChanged: (val) {
                  setState(() => _isKVKKAccepted = val);
                },
              ),
              Space(width: AppSpacing.spacing8),
              Expanded(
                child: LocaleText(
                  text: LocaleKeys.personalinformation_kvkkapproval.locale,
                  style: AppTextStyles.bodyLarge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQRNotePage() {
    return Padding(
      padding: AppEdgeInset.all(value: AppSpacing.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(height: AppSpacing.spacing32),
          Text(
            LocaleKeys.personalinformation_qrnotetitle.locale,
            style: AppTextStyles.titleLarge,
          ),
          Space(height: AppSpacing.spacing8),
          LocaleText(
            text: LocaleKeys.personalinformation_qrnotedescription.locale,
            style: AppTextStyles.bodyLarge,
          ),
          Space(height: AppSpacing.spacing20),
          SizedBox(
            height: 100.w,
            child: TextFormField(
              focusNode: _qrNoteFocusNode,
              controller: _qrNoteController,
              maxLines: 5,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                  ),
                ),
                hintText:
                    LocaleKeys.personalinformation_qrnotedescription.locale,
                border: const OutlineInputBorder(),
                hintStyle: AppTextStyles.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePhotoPage() {
    return Padding(
      padding: AppEdgeInset.all(value: AppSpacing.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(height: AppSpacing.spacing32),
          Text(
            LocaleKeys.personalinformation_profilephototitle.locale,
            style: AppTextStyles.titleLarge,
          ),
          Space(height: AppSpacing.spacing8),
          LocaleText(
            text: LocaleKeys.personalinformation_profilephotodescription.locale,
            style: AppTextStyles.bodyLarge,
          ),
          Space(height: AppSpacing.spacing20),
          Center(
            child: GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: _profileImage != null
                    ? FileImage(File(_profileImage!.path))
                    : null,
                child: _isUploading
                    ? CircularProgressIndicator()
                    : _profileImage == null
                        ? const Icon(Icons.add_a_photo, size: 40)
                        : null,
              ),
            ),
          ),
          Space(height: AppSpacing.spacing20),
          Center(
            child: ElevatedButton(
              onPressed: _pickImage,
              child: Text(
                LocaleKeys.personalinformation_selectimage.locale,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNamePage() {
    return Padding(
      padding: AppEdgeInset.all(value: AppSpacing.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(height: AppSpacing.spacing32),
          Text(
            LocaleKeys.personalinformation_firstnametitle.locale,
            style: AppTextStyles.titleLarge,
          ),
          Space(height: AppSpacing.spacing8),
          LocaleText(
            text: LocaleKeys.personalinformation_firstnamedescription.locale,
            style: AppTextStyles.bodyLarge,
          ),
          Space(height: AppSpacing.spacing20),
          SizedBox(
            height: 60.w,
            child: TextFormField(
              controller: _nameController,
              focusNode: _nameFocusNode,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                  ),
                ),
                hintText:
                    LocaleKeys.personalinformation_firstnamedescription.locale,
                border: const OutlineInputBorder(),
                hintStyle: AppTextStyles.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSurnamePage() {
    return Padding(
      padding: AppEdgeInset.all(value: AppSpacing.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(height: AppSpacing.spacing32),
          Text(
            LocaleKeys.personalinformation_lastnametitle.locale,
            style: AppTextStyles.titleLarge,
          ),
          Space(height: AppSpacing.spacing8),
          LocaleText(
            text: LocaleKeys.personalinformation_lastnamedescription.locale,
            style: AppTextStyles.bodyLarge,
          ),
          Space(height: AppSpacing.spacing20),
          SizedBox(
            height: 60.w,
            child: TextFormField(
              controller: _surnameController,
              focusNode: _surnameFocusNode,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                  ),
                ),
                hintText:
                    LocaleKeys.personalinformation_lastnamedescription.locale,
                border: const OutlineInputBorder(),
                hintStyle: AppTextStyles.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailPage() {
    return Padding(
      padding: AppEdgeInset.all(value: AppSpacing.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(height: AppSpacing.spacing32),
          Text(
            LocaleKeys.personalinformation_emailtitle.locale,
            style: AppTextStyles.titleLarge,
          ),
          Space(height: AppSpacing.spacing8),
          LocaleText(
            text: LocaleKeys.personalinformation_emaildescription.locale,
            style: AppTextStyles.bodyLarge,
          ),
          Space(height: AppSpacing.spacing20),
          SizedBox(
            height: 60.w,
            child: TextFormField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                  ),
                ),
                hintText:
                    LocaleKeys.personalinformation_emaildescription.locale,
                border: const OutlineInputBorder(),
                hintStyle: AppTextStyles.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhonePage() {
    return Padding(
      padding: AppEdgeInset.all(value: AppSpacing.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(height: AppSpacing.spacing32),
          Text(
            LocaleKeys.personalinformation_phonetitle.locale,
            style: AppTextStyles.titleLarge,
          ),
          Space(height: AppSpacing.spacing8),
          LocaleText(
            text: LocaleKeys.personalinformation_phonedescription.locale,
            style: AppTextStyles.bodyLarge,
          ),
          Space(height: AppSpacing.spacing20),
          SizedBox(
            child: IntlPhoneField(
              focusNode: _phoneFocusNode,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                  ),
                ),
                hintText:
                    LocaleKeys.personalinformation_phonedescription.locale,
                border: const OutlineInputBorder(),
                hintStyle: AppTextStyles.bodyMedium,
              ),
              initialCountryCode: 'TR',
              onChanged: (phone) {
                _phoneController.text = phone.completeNumber;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space(height: AppSpacing.spacing32),
            Text(
              LocaleKeys.personalinformation_socialmediatitle.locale,
              style: AppTextStyles.titleLarge,
            ),
            Space(height: AppSpacing.spacing8),
            LocaleText(
              text:
                  LocaleKeys.personalinformation_socialmediadescription.locale,
              style: AppTextStyles.bodyLarge,
            ),
            Space(height: AppSpacing.spacing20),
            if (_shareSocialMedia)
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                  hintText: LocaleKeys
                      .personalinformation_socialmediadescription.locale,
                  border: const OutlineInputBorder(),
                  hintStyle: AppTextStyles.bodyMedium,
                ),
                isExpanded: true,
                value: _selectedSocialMedia,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSocialMedia = newValue!;
                  });
                  _addSocialMediaField(_selectedSocialMedia);
                },
                items: _socialMediaOptions
                    .map<DropdownMenuItem<String>>((String value) {
                  IconData icon;
                  switch (value) {
                    case 'Instagram':
                      icon = FontAwesomeIcons.instagram;
                      break;
                    case 'Facebook':
                      icon = FontAwesomeIcons.facebook;
                      break;
                    case 'LinkedIn':
                      icon = FontAwesomeIcons.linkedin;
                      break;
                    default:
                      icon = CupertinoIcons.question;
                  }
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Icon(icon, color: AppColors.primary),
                        Space(width: AppSpacing.spacing8),
                        Text(value, style: AppTextStyles.bodyLarge),
                      ],
                    ),
                  );
                }).toList(),
              ),
            if (_shareSocialMedia)
              ..._socialMediaFields.map((field) {
                String platform = field.keys.first;
                TextEditingController controller = field.values.first;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Space(height: AppSpacing.spacing20),
                      LocaleText(
                        text:
                            "$platform${LocaleKeys.personalinformation_socialmediaaddress.locale}",
                        style: AppTextStyles.bodyLarge
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Space(height: AppSpacing.spacing8),
                      TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primary,
                            ),
                          ),
                          hintText:
                              '$platform${LocaleKeys.personalinformation_socialmediaaddress.locale}',
                          border: const OutlineInputBorder(),
                          hintStyle: AppTextStyles.bodyMedium,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.delete,
                                size: 20, color: AppColors.primary),
                            onPressed: () {
                              _removeSocialMediaField(field);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            if (_shareSocialMedia && _socialMediaFields.isEmpty)
              Space(height: AppSpacing.spacing20),
            if (!_shareSocialMedia)
              LocaleText(
                text: LocaleKeys.personalinformation_nosocialmedia.locale,
                style: AppTextStyles.bodyLarge,
              ),
            Space(height: AppSpacing.spacing20),
            if (_socialMediaFields.isEmpty)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                    LocaleKeys.personalinformation_sharenosocialmedia.locale),
                trailing: CupertinoSwitch(
                  value: !_shareSocialMedia,
                  onChanged: (val) {
                    setState(() {
                      _shareSocialMedia = !val;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacySettingsPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Space(height: AppSpacing.spacing32),
          Text(
            LocaleKeys.personalinformation_privacytitle.locale,
            style: AppTextStyles.titleLarge,
          ),
          Space(height: AppSpacing.spacing8),
          LocaleText(
            text: LocaleKeys.personalinformation_privacydescription.locale,
            style: AppTextStyles.bodyLarge,
          ),
          Space(height: AppSpacing.spacing20),
          const Divider(),
          _buildSwitchListTile(
            title: LocaleKeys.personalinformation_phonevisibility.locale,
            value: _isPhoneVisible,
            onChanged: (val) {
              setState(() => _isPhoneVisible = val);
            },
          ),
          _buildSwitchListTile(
            title: LocaleKeys.personalinformation_onlynotification.locale,
            value: _isNotificationEnabled,
            onChanged: (val) {
              if (_checkNotificationPermission()) {
                setState(() => _isNotificationEnabled = val);
              } else {
                showTopSnackBar(
                    context,
                    LocaleKeys
                        .personalinformation_notificationpermission.locale);
              }
            },
          ),
          _buildSwitchListTile(
            title: LocaleKeys.personalinformation_socialmediavisibility.locale,
            value: _isSocialMediaVisible,
            onChanged: (val) {
              setState(() => _isSocialMediaVisible = val);
            },
          ),
          _buildSwitchListTile(
            title: LocaleKeys.personalinformation_namevisibility.locale,
            value: _isNameVisible,
            onChanged: (val) {
              setState(() => _isNameVisible = val);
            },
          ),
          _buildSwitchListTile(
            title: LocaleKeys.personalinformation_profilephotoview.locale,
            value: _isProfilePhotoVisible,
            onChanged: (val) {
              setState(() => _isProfilePhotoVisible = val);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReviewPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(height: AppSpacing.spacing32),
          Text(
            LocaleKeys.personalinformation_reviewinformationtitle.locale,
            style: AppTextStyles.titleLarge,
          ),
          Space(height: AppSpacing.spacing8),
          LocaleText(
            text: LocaleKeys
                .personalinformation_reviewinformationdescription.locale,
            style: AppTextStyles.bodyLarge,
          ),
          Space(height: AppSpacing.spacing20),
          Text('İsim: ${_nameController.text}'),
          Text('Soyisim: ${_surnameController.text}'),
          Text('Telefon: ${_phoneController.text}'),
          Text('Email: ${_emailController.text}'),
          _profileImage != null
              ? Image.file(File(_profileImage!.path), height: 100)
              : Container(),
          Text('QR Notu: ${_qrNoteController.text}'),
          ..._socialMediaFields.map((field) {
            String platform = field.keys.first;
            TextEditingController controller = field.values.first;
            return Text('$platform: ${controller.text}');
          }),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Expanded(
            flex: _currentPage,
            child: Container(
              color: AppColors.primary,
            ),
          ),
          Expanded(
            flex: 9 - _currentPage,
            child: Container(
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Text(
      'Sayfa ${_currentPage + 1} / 9',
      style: const TextStyle(fontSize: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LogoWidget(
                fontsize: 60.sp,
                isWhite: false,
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: _onPageChanged,
                children: [
                  _starterPage(),
                  _buildProfilePhotoPage(),
                  _buildNamePage(),
                  _buildSurnamePage(),
                  _buildEmailPage(),
                  _buildPhonePage(),
                  _buildQRNotePage(),
                  _buildSocialMediaPage(),
                  _buildPrivacySettingsPage(),
                  _buildReviewPage(),
                ],
              ),
            ),
            _buildProgressBar(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: _previousPage,
                    icon: const Icon(Icons.arrow_back),
                    label: Text(
                        LocaleKeys.personalinformation_previousbutton.locale),
                    style: TextButton.styleFrom(
                        foregroundColor: AppColors.primary),
                  ),
                  _buildPageIndicator(),
                  _currentPage == 8
                      ? TextButton.icon(
                          onPressed: () {
                            context.router.push(const PremiumRoute());
                          },
                          icon: const Icon(Icons.check),
                          label: Text(LocaleKeys
                              .personalinformation_finishbutton.locale),
                          style: TextButton.styleFrom(
                              foregroundColor: AppColors.primary),
                        )
                      : TextButton.icon(
                          onPressed: _nextPage,
                          icon: const Icon(Icons.arrow_forward),
                          label: Text(
                              LocaleKeys.personalinformation_nextbutton.locale),
                          style: TextButton.styleFrom(
                              foregroundColor: AppColors.primary),
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
