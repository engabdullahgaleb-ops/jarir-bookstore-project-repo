import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jarir_bookstore_project/core/cubits/login_ui_cubit.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';
import 'package:jarir_bookstore_project/shared/components/components.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return
      //cubit
      BlocProvider<LoginUICubit>(
      create: (context)=>LoginUICubit(),
      child: BlocConsumer<LoginUICubit,LoginUIState>(
        listener: (context,state){},//listener
        builder:(context,state)=> Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //back
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),

                  const SizedBox(height: 20),

                  // Logo
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 55,
                    ),
                  ),

                  const SizedBox(height: 36),

                  Text(
                    l10n.welcome,
                    style: theme.textTheme.headlineMedium,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    l10n.loginDescription,
                    style: theme.textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 32),

                  // Login Type
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: FilledButton(
                            style: state.method==LoginMethod.password?buildUnSelectedFilledButtonStyle(theme):null,
                            onPressed: () {
                              context.read<LoginUICubit>().changeMethod(LoginMethod.otp);
                            },
                            child:  Text(l10n.loginWithOTP),
                          ),
                        ),
                         SizedBox(width: 6),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              context.read<LoginUICubit>().changeMethod(LoginMethod.password);
                            },
                            style: state.method==LoginMethod.otp?buildUnSelectedFilledButtonStyle(theme):null,
                            child:  Text(l10n.loginWithPassword),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                  // id
                  Text(
                    l10n.phoneOrEmail,
                    style: theme.textTheme.titleMedium,
                  ),

                  const SizedBox(height: 8),

                  inputField(
                    controller: id,
                    hint: l10n.phoneOrEmailHint,
                  ),

                  const SizedBox(height: 24),


                  ConditionalBuilder(
                    condition: state.method==LoginMethod.password,
                    builder: (context) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                          l10n.password,
                          style: theme.textTheme.titleMedium,
                        ),

                        const SizedBox(height: 8),

                        // Password
                        inputField(
                          obSecureText: state.obscurePassword,
                          controller: password,
                          type: TextInputType.visiblePassword,
                          hint: l10n.password,
                          prefix: Icon(Icons.lock_outline),
                          suffix: InkWell(
                              onTap: (){
                                context.read<LoginUICubit>().togglePassword();
                              },
                              child: Icon(state.obscurePassword?Icons.visibility_off_outlined:Icons.visibility_outlined)
                          ),

                        ),

                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(l10n.forgetPassword),
                          ),
                        ),

                        CheckboxListTile(
                          value: state.faceIDEnabled,
                          onChanged: (_) {
                            context.read<LoginUICubit>().toggleFaceID();
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                          title:  Text(l10n.enableFaceID),
                        ),
                      ]);
                    },
                    fallback: (BuildContext context)=>SizedBox(),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ConditionalBuilder(
                      condition: state.method==LoginMethod.password,
                      builder: (context)=>FilledButton(
                        onPressed: () {},
                        child:  Text(l10n.login),
                      ),
                      fallback: (context)=>FilledButton(
                        onPressed: () {},
                        child:  Text(l10n.sendOTP),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child:  Text(l10n.register),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            l10n.agreeTerms,
                          ),

                          InkWell(
                            onTap: () {  },
                            child: Text(
                              l10n.privacyPolicy,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.blue
                              ),
                            ),
                          ),
                        ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}