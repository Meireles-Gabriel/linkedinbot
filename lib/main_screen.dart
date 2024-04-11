import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkedinbot/design.dart';
import 'package:linkedinbot/methods/functions.dart';
import 'package:linkedinbot/methods/providers.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fieldController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.baseColor,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/logo.png',
              height: 50,
            ),
            Text(
              'Connections Bot',
              style: GoogleFonts.montserrat().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColors.callToActionColor),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: myTextField('Email', 1, null, false, emailController, ref),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 40,
              child: myTextField('Senha', 1, null, true, passwordController, ref),
            ),
            const Divider(),
            SizedBox(
              height: 40,
              child: myTextField(
                  'Área de Interesse', 1, null, false, fieldController, ref),
            ),
            const SizedBox(height: 5),
            myTextField('Menssagem', null, 300, false, messageController, ref),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColors.callToActionColor)),
              onPressed: () async {
                if (emailController.text != '' &&
                    passwordController.text != '' &&
                    fieldController.text != '' &&
                    messageController.text != '') {
                  if (ref.watch(activeFieldsProvider)) {
                    ref.read(activeFieldsProvider.notifier).state = false;
                    ref.read(emailProvider.notifier).state = emailController.text;
                    ref.read(passwordProvider.notifier).state =
                        passwordController.text;
                        ref.read(fieldProvider.notifier).state =
                        fieldController.text;
                        ref.read(messageProvider.notifier).state =
                        messageController.text;
                    ref.watch(loggedInProvider)
                        ? await search(ref)
                        : await login(ref);
                  } else {
                    ref.read(activeFieldsProvider.notifier).state = true;
                  }
                } else {
                  ref.read(infoProvider.notifier).state =
                      'Preencha Todos os Campos!';
                }
              },
              child: Text(
                ref.watch(activeFieldsProvider) ? 'Iniciar' : 'Pausar',
                style: GoogleFonts.montserrat().copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: Card(
                color: AppColors.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Pedidos Enviados:',
                        style: GoogleFonts.montserrat().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${ref.watch(nRequestsProvider)}',
                        style: GoogleFonts.montserrat().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              ref.watch(infoProvider),
              style: GoogleFonts.montserrat().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  TextField myTextField(label, maxLines,maxLength, obscure, controller, ref) {
    return TextField(
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: ref.watch(activeFieldsProvider),
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: AppColors.callToActionColor,
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: AppColors.callToActionColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
