import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/build_app_bar.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const routeName = 'notification_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        text: 'الاشعارات',
        isActionActive: false,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const NotificationViewBody(),
    );
  }
}

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(5, (index) => const NotificationItem()),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('');
  }
}
