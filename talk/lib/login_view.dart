import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isLoginForm = true; // Флаг для отслеживания текущей формы
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Ваши действия по обработке отправки формы
      if (isLoginForm) {
        // Логика для формы входа
      } else {
        // Логика для формы регистрации
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            if (!isLoginForm)
              TextFormField(
                key: Key('fieldFirstName'),
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
            if (!isLoginForm)
              TextFormField(
                key: Key('fieldLastName'),
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
            TextFormField(
              key: Key('fieldEmail'),
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            TextFormField(
              key: Key('fieldPhone'),
              controller: _phoneController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
              validator: (value) {
                if (value!.isEmpty || value.length != 10) {
                  return 'Please enter a valid 10-digit phone number';
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: _submit, child: Text('Submit')),
            TextButton(
              onPressed: () {
                setState(() {
                  isLoginForm = !isLoginForm;
                });
              },
              child: Text(isLoginForm ? 'Switch to Registration' : 'Switch to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
