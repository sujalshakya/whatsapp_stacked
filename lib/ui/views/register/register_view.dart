import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/text/text_labellarge_black.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/auth_footer.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/logo.dart';
import 'package:whatsapp_stacked/ui/common/app_strings.dart';
import 'package:whatsapp_stacked/ui/common/validators.dart';
import 'package:whatsapp_stacked/ui/views/register/register_view.form.dart';

import 'register_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: Validators.validateEmail),
  FormTextField(name: 'password', validator: Validators.validatePassword),
  FormTextField(name: 'fullName', validator: Validators.validateLogin)
])
class RegisterView extends StackedView<RegisterViewModel> with $RegisterView {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      /// Register Form
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Logo(),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(name),
          ),
          // Name controller
          TextFormField(controller: fullNameController),
          if (viewModel.hasFullNameValidationMessage) ...[
            Text(viewModel.validationMessage ?? "Requires text")
          ],
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(email),
          ),

          // Email controller
          TextFormField(controller: emailController),
          if (viewModel.hasEmailValidationMessage) ...[
            Text(viewModel.validationMessage ?? "Requires @ and .")
          ],
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(password),
          ),
          // Password controller
          TextFormField(controller: passwordController),
          if (viewModel.hasPasswordValidationMessage) ...[
            Text(viewModel.validationMessage ??
                "Requires small letter, capital letter, integers and symbols.")
          ],
          const SizedBox(
            height: 20,
          ),

          /// Register Button
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    viewModel.registerApiRequest();
                  },
                  child: const TextLabellargeBlack(text: register))),
          const SizedBox(
            height: 20,
          ),

          /// Line at the bottom which helps navigate to login page.

          AuthFooter(
              message: 'Already have an account?  ',
              ontap: () {
                viewModel.ontap();
              },
              tap: login),
        ],
      ),
    );
  }

  @override
  void onDispose(RegisterViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(RegisterViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
