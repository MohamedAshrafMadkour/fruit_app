import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/features/home/presentation/manager/item_cart/item_cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_bottom_navigation_bar.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_main_view_body_bloc_listener.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'main_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: CustomMainViewBodyBlocListener(currentIndex: currentIndex),
    );
  }
}
