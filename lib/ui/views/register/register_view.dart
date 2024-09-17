import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/text/text_labellarge_black.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/auth_footer.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/auth_textfield.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/textfield_title.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/logo.dart';
import 'package:whatsapp_stacked/base/common/app_strings.dart';
import 'package:whatsapp_stacked/base/common/validators.dart';
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
          const TextFieldTitleText(text: name),
          // Name controller
          AuthTextField(controller: fullNameController),
          if (viewModel.hasFullNameValidationMessage) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                viewModel.fullNameValidationMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            )
          ],
          const TextFieldTitleText(text: email),
          // Email controller
          AuthTextField(controller: emailController),
          if (viewModel.hasEmailValidationMessage) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                viewModel.emailValidationMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            )
          ],
          const TextFieldTitleText(text: password),
          // Password controller
          AuthTextField(controller: passwordController),
          if (viewModel.hasPasswordValidationMessage) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                viewModel.passwordValidationMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            )
          ],
          const SizedBox(
            height: 20,
          ),

          /// Register Button
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    viewModel.registerFirebase();
                    syncFormWithViewModel(viewModel);
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
              button: login),
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
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
