import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nishauri/src/features/auth/data/providers/auth_provider.dart';
import 'package:nishauri/src/features/confirm_delivery/data/modules/confirm_delivery.dart';
import 'package:nishauri/src/features/confirm_delivery/data/providers/confirm_delivery_provider.dart';
import 'package:nishauri/src/shared/display/Logo.dart';
import 'package:nishauri/src/shared/display/verify.dart';
import 'package:nishauri/src/shared/exeptions/http_exceptions.dart';
import 'package:nishauri/src/shared/input/Button.dart';
import 'package:nishauri/src/shared/layouts/ResponsiveWidgetFormLayout.dart';
import 'package:nishauri/src/shared/styles/input_styles.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:nishauri/src/utils/helpers.dart';
import 'package:nishauri/src/utils/routes.dart';

class ConfirmDeliveryScreen extends HookConsumerWidget {
  final ConfirmDelivery? confirmDelivery;
  final int? orderId;
  const ConfirmDeliveryScreen({super.key, this.confirmDelivery, this.orderId});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController textarea = TextEditingController();
    final _formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    bool _loading = false;

    void handleSubmit() {
      if (_formKey.currentState!.validate()) {
        _loading = true;
        ref.read(confirmDeliveryProvider.notifier).confirmDelivery({
          ..._formKey.currentState!.instantValue,
          "is_received" : 1,
          "order_id" : orderId,
        }).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Drug delivery was a success!")));
              context.goNamed(RouteNames.PROGRAM_MENU);
        }).catchError((e) {
          switch (e) {
            case BadRequestException e:
              handleResponseError(context, _formKey.currentState!.fields, e,
                  ref.read(authStateProvider.notifier).logout);
              break;
            default:
              handleResponseError(context, _formKey.currentState!.fields, e,
                  ref.read(authStateProvider.notifier).logout);
              debugPrint("-->Delivery Confirmation: ${e.toString()}");
          }
        }).whenComplete(() => _loading = false);
      }
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.chevron_left),
        ),
        title: const Text("Confirm drug delivery"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ResponsiveWidgetFormLayout(
        buildPageContent: (BuildContext context, Color? color) => SafeArea(
            child: FormBuilder(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(Constants.SPACING * 2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(Constants.ROUNDNESS),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: Constants.SPACING),
                      const DecoratedBox(
                        decoration: BoxDecoration(),
                        child: Verify(),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Confirm Deliver",
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: Constants.SPACING),
                      FormBuilderTextField(
                        name: "confirmation_code",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.min(10),
                        ]),
                        decoration: inputDecoration(
                          prefixIcon: Icons.abc_outlined,
                          label: "Confirmation Code",
                          placeholder: "754WEd",
                        ),
                      ),
                      const SizedBox(height: Constants.SPACING),
                      FormBuilderTextField(
                        name: "comment",
                        controller: textarea,
                        maxLines: 4,
                        // validator: FormBuilderValidators.compose([
                        //   FormBuilderValidators.required(),
                        //   FormBuilderValidators.min(10),
                        // ]),
                        decoration: inputDecoration(
                          prefixIcon: Icons.abc_outlined,
                          label: "Feedback",
                          placeholder: "Write a feedback/comment on the delivery...",
                        ),

                      ),

                      const SizedBox(height: Constants.SPACING),
                      Consumer(
                        builder: (context, ref, child) {
                          return                               Button(
                            title: "Confirm Delivery",
                            onPress: handleSubmit,
                            loading: _loading,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
