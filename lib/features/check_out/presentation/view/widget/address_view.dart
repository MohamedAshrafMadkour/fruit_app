import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/check_out/domain/entity/order_entity.dart';

class AddressView extends StatelessWidget {
  const AddressView({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          autovalidateMode: value,
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.name = value!;
                },
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.email = value!;
                },
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.address = value!;
                },

                hintText: 'العنوان',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.city = value!;
                },
                hintText: 'المدينه',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),

              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.floor = value!;
                },

                hintText: 'رقم الطابق , رقم الشقه ..',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),

              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.phone = value!;
                },
                hintText: 'رقم الهاتف',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
