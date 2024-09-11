import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'package:whatsapp_stacked/base/ui_toolkits/text/text_labellarge_black.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/auth_footer.dart';
import 'package:whatsapp_stacked/base/ui_toolkits/widgets/logo.dart';
import 'package:whatsapp_stacked/base/common/app_strings.dart';
import 'package:whatsapp_stacked/base/common/validators.dart';
import 'package:whatsapp_stacked/ui/views/login/login_view.form.dart';

import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: Validators.validateEmail),
  FormTextField(name: 'password', validator: Validators.validateLogin)
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
              child: Text(email),
            ),
            // Email Textfield
            TextFormField(
              controller: emailController,
              decoration:
                  const InputDecoration(contentPadding: EdgeInsets.all(8)),
            ),
            if (viewModel.hasEmailValidationMessage) ...[
              Text(viewModel.validationMessage ?? "Requires @ and .")
            ],
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(password),
            ),

            // Password textfield
            TextFormField(
              controller: passwordController,
              decoration:
                  const InputDecoration(contentPadding: EdgeInsets.all(8)),
            ),
            if (viewModel.hasPasswordValidationMessage) ...[
              Text(viewModel.validationMessage ?? "Empty Field")
            ],
            const SizedBox(
              height: 20,
            ),
            // Login Button
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      viewModel.loginApiRequest();
                    },
                    child: const TextLabellargeBlack(text: login))),
            const SizedBox(
              height: 20,
            ),

            // Line at the bottom which helps navigate to register page.
            AuthFooter(
                message: "Don't have an account?  ",
                ontap: () {
                  viewModel.ontap();
                },
                tap: register),
          ]),
    );
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
