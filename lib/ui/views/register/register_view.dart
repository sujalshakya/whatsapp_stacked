import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/text/text_labellarge_black.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/auth_footer.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/from_title.dart';
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
          const FormTitle(text: name),
          // Name controller
          TextFormField(
            controller: fullNameController,
            decoration:
                const InputDecoration(contentPadding: EdgeInsets.all(8)),
          ),
          if (viewModel.hasFullNameValidationMessage) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                viewModel.fullNameValidationMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            )
          ],
          const FormTitle(text: email),

          // Email controller
          TextFormField(
            controller: emailController,
            decoration:
                const InputDecoration(contentPadding: EdgeInsets.all(8)),
          ),
          if (viewModel.hasEmailValidationMessage) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                viewModel.emailValidationMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            )
          ],
          const FormTitle(text: password),

          // Password controller
          TextFormField(
            controller: passwordController,
            decoration:
                const InputDecoration(contentPadding: EdgeInsets.all(8)),
          ),
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
                    viewModel.registerApiRequest();
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
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
