import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/core/notification/presentation/notification_view.dart';
import 'package:fruit_app/features/Auth/presentation/manager/verify_cubit/verify_cubit.dart';
import 'package:fruit_app/features/Auth/presentation/view/forget_password_view.dart';
import 'package:fruit_app/features/Auth/presentation/view/login_view.dart';
import 'package:fruit_app/features/Auth/presentation/view/register_view.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/verify_section.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/new_password_section.dart';
import 'package:fruit_app/features/best_selling/presentation/view/best_selling_view.dart';
import 'package:fruit_app/features/check_out/presentation/check_out_view.dart';
import 'package:fruit_app/features/home/domain/entities/cart_entity.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_app/features/home/presentation/view/details_view.dart';
import 'package:fruit_app/features/home/presentation/view/main_view.dart';
import 'package:fruit_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:fruit_app/features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(dynamic settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnboardingView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (_) => const BestSellingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (_) => const MainView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (_) => const RegisterView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
    case VerifyCodeSection.routeName:
      final args = settings.arguments as Map<String, dynamic>;
      final String verificationId = args['verificationId'];
      final VerifyCubit cubit = args['cubit'];
      return MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: cubit,
          child: VerifyCodeSection(verificationId: verificationId),
        ),
      );
    case DetailsView.routeName:
      return MaterialPageRoute(
        builder: (_) =>
            DetailsView(product: settings.arguments as ProductEntity),
      );
    case NewPasswordSection.routeName:
      return MaterialPageRoute(builder: (_) => const NewPasswordSection());
    case NotificationView.routeName:
      return MaterialPageRoute(builder: (_) => const NotificationView());
    case CheckOutView.routeName:
      return MaterialPageRoute(
        builder: (_) =>
            CheckOutView(cartEntity: settings.arguments as CartEntity),
      );
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
