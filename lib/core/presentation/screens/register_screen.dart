import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jarir_bookstore_project/core/cubits/register_ui_cubit.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';
import 'package:jarir_bookstore_project/shared/components/components.dart';
import 'package:jarir_bookstore_project/shared/helpers/validators.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final text = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;
    final formkey = GlobalKey<FormState>();

    return BlocProvider<RegisterUICubit>(
      create: (context)=>RegisterUICubit(),
      child: BlocConsumer<RegisterUICubit,RegisterUiState>(
        listener: (context,state){},
        builder:(context,state)=> Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              //form
              child: Form(
                key:formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),

                    const SizedBox(height: 20),

                    Text(l10n.personalInformation, style: text.headlineMedium),

                    const SizedBox(height: 40),

                    Text(l10n.contactInformation, style: text.titleLarge),

                    const SizedBox(height: 24),

                    //fname + lname
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.firstName, style: text.titleMedium),
                              const SizedBox(height: 8),
                              inputField(
                                controller: firstNameController,
                                hint: l10n.firstName,
                                  onChanged: (value){
                                    context.read<RegisterUICubit>().fNameChanged(value);
                                  }
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Expanded(
                                      child:!state.formValid.fNameValid ?
                                      Text(
                                        l10n.requiredField,
                                        style: text.bodySmall?.copyWith(
                                          color: Colors.red,
                                        ),
                                      ): Container()),
                                  Text("0/50", style: text.bodySmall)
                                ],
                              )
                            ],
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.lastName, style: text.titleMedium),
                              const SizedBox(height: 8),
                              inputField(
                                controller: lastNameController,
                                hint: l10n.lastName,
                                onChanged: (value){
                                  context.read<RegisterUICubit>().lNameChanged(value);
                                }

                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Expanded(
                                    child:!state.formValid.lNameValid ?
                                    Text(
                                      l10n.requiredField,
                                      style: text.bodySmall?.copyWith(
                                      color: Colors.red,
                                    ),
                                  ): Container()),
                                  Text("0/50", style: text.bodySmall)
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Mobile Number
                    Text(l10n.mobileNumber, style: text.titleMedium),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Container(
                          width: 130,
                          height: 56,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: colors.outlineVariant),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("🇸🇦", style: TextStyle(fontSize: 24)),

                              Text("+966", style: text.titleMedium),
                            ],
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: inputField(
                            controller: phoneController,
                            hint: l10n.mobileNumber,
                            type: TextInputType.phone,
                            onChanged: (value){
                              context.read<RegisterUICubit>().phoneChanged(value);
                            }
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Expanded(
                            child:!state.formValid.phoneValid ?
                            Text(
                              l10n.invalidPhone,
                              style: text.bodySmall?.copyWith(
                                color: Colors.red,
                              ),
                            ): Container()),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Send OTP
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: FilledButton(
                        onPressed: () {},
                        child: Text(l10n.sendVerificationCode),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Email
                    Text(l10n.emailAddress, style: text.titleMedium),

                    const SizedBox(height: 8),

                    inputField(
                      controller: emailController,
                      hint: l10n.emailHint,
                      type: TextInputType.emailAddress,
                      onChanged: (value){
                        context.read<RegisterUICubit>().emailChanged(value);
                      }
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Expanded(
                            child:!state.formValid.emailValid ?
                            Text(
                              l10n.invalidEmail,
                              style: text.bodySmall?.copyWith(
                                color: Colors.red,
                              ),
                            ): Container()),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Password
                    Text(l10n.password, style: text.titleMedium),

                    const SizedBox(height: 8),

                    inputField(
                      onChanged :(value){
                        context.read<RegisterUICubit>().passwordChanged(value);
                      },
                      controller: passwordController,
                      hint: l10n.password,
                      obSecureText: state.obscurePassword,
                      prefix: const Icon(Icons.lock_outline),
                      suffix: InkWell(
                        onTap: () {
                          context.read<RegisterUICubit>().togglePassword();
                        },
                        child:  Icon(state.obscurePassword?Icons.visibility_off_outlined:Icons.visibility),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.passwordRequirementLength,
                            style: text.bodySmall?.copyWith(
                              color: state.formValid.passwordValid.hasMinLength?colors.onSurfaceVariant:Colors.red,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            l10n.passwordRequirementUppercase,
                            style: text.bodySmall?.copyWith(
                              color: state.formValid.passwordValid.hasUppercase?colors.onSurfaceVariant:Colors.red,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            l10n.passwordRequirementLowercase,
                            style: text.bodySmall?.copyWith(
                              color: state.formValid.passwordValid.hasLowercase?colors.onSurfaceVariant:Colors.red,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            l10n.passwordRequirementNumber,
                            style: text.bodySmall?.copyWith(
                              color: state.formValid.passwordValid.hasNumber?colors.onSurfaceVariant:Colors.red,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            l10n.passwordRequirementSpecial,
                            style: text.bodySmall?.copyWith(
                              color: state.formValid.passwordValid.hasSpecialCharacter?colors.onSurfaceVariant:Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Confirm Password
                    Text(l10n.confirmPassword, style: text.titleMedium),

                    const SizedBox(height: 8),

                    inputField(
                      onChanged: (value){
                        context.read<RegisterUICubit>().confirmPasswordChanged(value);
                      },
                      controller: confirmPasswordController,
                      hint: l10n.confirmPassword,
                      obSecureText: state.obscureConfirmPassword,
                      prefix: const Icon(Icons.lock_outline),
                      suffix: InkWell(
                        onTap: () {
                          context.read<RegisterUICubit>().toggleConfirmPassword();
                        },
                        child:  Icon(state.obscureConfirmPassword?Icons.visibility_off_outlined:Icons.visibility),
                      ),
                    ),

                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                            child:!state.formValid.confirmPasswordValid ?
                            Text(
                              l10n.passwordNotMatch,
                              style: text.bodySmall?.copyWith(
                                color: Colors.red,
                              ),
                            ): Container()),
                      ],
                    ),


                    // Face ID
                    CheckboxListTile(
                      value: state.faceIDEnabled,
                      onChanged: (_) {
                        context.read<RegisterUICubit>().toggleFaceID();
                      },
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(l10n.enableFaceID),
                    ),

                    const SizedBox(height: 8),

                    // Marketing Checkbox
                    CheckboxListTile(
                      value: state.marketingAccepted,
                      onChanged: (_) {
                        context.read<RegisterUICubit>().toggleMarketing();
                      },
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        l10n.marketingConsent,
                        style: text.bodyMedium,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Terms & Conditions
                    CheckboxListTile(
                      value: state.formValid.termsAccepted,
                      onChanged: (_) {
                        context.read<RegisterUICubit>().toggleTerms();
                      },
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: RichText(
                        text: TextSpan(
                          style: text.bodyMedium?.copyWith(color: state.formValid.termsAccepted?colors.onSurface:Colors.red),
                          children: [
                            TextSpan(
                              text: l10n.createAccountAgree,
                            ),
                            TextSpan(
                              text: l10n.termsAndConditions,
                              style: TextStyle(
                                color: colors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(text: l10n.and),
                            TextSpan(
                              text: l10n.privacyPolicy,
                              style: TextStyle(
                                color: colors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    Center(
                      child: Column(
                        children: [
                          Text(
                            l10n.buyingForCompany,
                            style: text.titleMedium,
                          ),

                          const SizedBox(height: 8),

                          TextButton(
                            onPressed: () {},
                            child: Text(l10n.createBusinessAccount),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Register Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: FilledButton(
                        onPressed: () {},
                        child: Text(l10n.register),
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
