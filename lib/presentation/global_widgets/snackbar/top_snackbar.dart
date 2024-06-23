import 'package:flutter/material.dart';
import 'package:qontact/presentation/theme/app_color.dart';
import 'package:qontact/presentation/theme/text_styles.dart';

class TopSnackBar extends StatelessWidget {
  final String message;
  final VoidCallback onClose;

  const TopSnackBar({
    Key? key,
    required this.message,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60.0,
      left: 20.0,
      right: 20.0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  message,
                  style: AppTextStyles.bodyLarge.copyWith(color: Colors.white),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: AppColors.white),
                onPressed: onClose,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showTopSnackBar(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => TopSnackBar(
      message: message,
      onClose: () {
        overlayEntry.remove();
      },
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
