import 'package:flutter/material.dart';
import 'package:projeto_target_sistemas/routes/app_routes.dart';
import 'package:projeto_target_sistemas/theme/app_colors.dart';
import 'package:projeto_target_sistemas/widgets/footer.dart';
import 'package:projeto_target_sistemas/widgets/custom_text_filed.dart';
import 'package:projeto_target_sistemas/widgets/vertical_spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String? error;
  String email = '';
  String password = '';

  // Submeter formulário
  onSubmit() {
    setState(() {
      error = null;
    });

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (email == 'admin' && password == '1234') {
        Navigator.pushNamed(context, AppRoutes.home);
      } else {
        setState(() {
          error = 'Login ou senha inválidos!';
        });
      }
    }
  }

  // Validações de senha
  String? passwordValidator(String? value) {
    String? result = generalValidator('senha', value);
    if (result != null) {
      return result;
    }

    if (value!.length < 2) {
      return 'O campo senha não pode ter menos que dois caracteres.';
    }

    if (!value.contains(RegExp(r'^[a-zA-Z0-9]+$'))) {
      return 'O campo senha não pode ter caracteres especiais';
    }

    return null;
  }

  // Validações gerais
  String? generalValidator(String field, String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo $field não pode estar vazio.';
    }

    if (value.length > 20) {
      return 'O campo $field não pode ultrapassar 20 caracteres';
    }

    if (value.endsWith(' ')) {
      return 'O campo $field não pode terminar com espaço';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24).copyWith(bottom: 8),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF1C4C44), Color(0xFF40A882)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Stack(
          children: [
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    label: 'Usuário',
                    onlyBorderError: error != null,
                    prefix: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.person),
                    ),
                    validator: (value) => generalValidator('usuário', value),
                    onSaved: (value) {
                      setState(() {
                        email = value ?? '';
                      });
                    },
                  ),
                  const VerticalSpacing(spacing: 16),
                  CustomTextField(
                    label: 'Senha',
                    onlyBorderError: error != null,
                    prefix: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.lock),
                    ),
                    validator: (value) => passwordValidator(value),
                    onSaved: (value) {
                      setState(() {
                        password = value ?? '';
                      });
                    },
                  ),
                  if (error != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        error!,
                        style: const TextStyle(
                          color: AppColors.error,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  const VerticalSpacing(spacing: 24),
                  ElevatedButton(
                    onPressed: onSubmit,
                    child: Text(
                      'Entrar',
                      style: TextStyle(color: AppColors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        backgroundColor: AppColors.primary),
                  )
                ],
              ),
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}
