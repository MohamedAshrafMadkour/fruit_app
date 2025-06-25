import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/core/util/app_image.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/features/home/presentation/view/main_view.dart';

class CustomAnimatedDialog extends StatefulWidget {
  final Animation<double> animation;

  const CustomAnimatedDialog({super.key, required this.animation});

  @override
  State<CustomAnimatedDialog> createState() => _CustomAnimatedDialogState();
}

class _CustomAnimatedDialogState extends State<CustomAnimatedDialog> {
  @override
  void initState() {
    super.initState();
    navigationExecution();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: widget.animation.value,
      child: Opacity(
        opacity: widget.animation.value,
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 40,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(Assets.imagesCongratulation, fit: BoxFit.fill),
              const SizedBox(height: 30),
              FittedBox(
                child: Text(
                  'تم تغيير الباسورد بنجاح',
                  style: Styles.textBold16.copyWith(
                    color: const Color(0xFF0C0D0D),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigationExecution() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.of(context, rootNavigator: true).pop();

        Navigator.pushNamedAndRemoveUntil(
          context,
          MainView.routeName,
          (route) => false,
        );
      }
    });
  }
}

void showCongratulationDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "AnimatedDialog",
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) {
      return const SizedBox.shrink();
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return CustomAnimatedDialog(animation: animation);
    },
  );
}
