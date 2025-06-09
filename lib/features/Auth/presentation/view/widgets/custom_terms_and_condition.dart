import 'package:flutter/material.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_container_check_box.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_text_span_condition.dart';

class CustomTermsAndCondition extends StatefulWidget {
  const CustomTermsAndCondition({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<CustomTermsAndCondition> createState() =>
      _CustomTermsAndConditionState();
}

class _CustomTermsAndConditionState extends State<CustomTermsAndCondition> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomAnimatedContainerCheckBox(
          onChanged: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        SizedBox(width: 16),
        Expanded(child: CustomTextSpanConditions()),
      ],
    );
  }
}
