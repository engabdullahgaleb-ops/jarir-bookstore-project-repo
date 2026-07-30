import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';
import 'package:jarir_bookstore_project/shared/components/components.dart';

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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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

              /// First + Last Name
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
                        ),

                        const SizedBox(height: 6),

                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text("0/50", style: text.bodySmall),
                        ),
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
                        ),

                        const SizedBox(height: 6),

                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text("0/50", style: text.bodySmall),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// Mobile Number
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
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text("0/15", style: text.bodySmall),
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

              /// Email
              Text(l10n.emailAddress, style: text.titleMedium),

              const SizedBox(height: 8),

              inputField(
                controller: emailController,
                hint: l10n.emailHint,
                type: TextInputType.emailAddress,
              ),

              const SizedBox(height: 6),

              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text("0/50", style: text.bodySmall),
              ),

              const SizedBox(height: 24),

              /// Password
              Text(l10n.password, style: text.titleMedium),

              const SizedBox(height: 8),

              inputField(
                controller: passwordController,
                hint: l10n.password,
                obSecureText: true,
                prefix: const Icon(Icons.lock_outline),
                suffix: InkWell(
                  onTap: () {},
                  child: const Icon(Icons.visibility_off_outlined),
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
                        color: colors.onSurfaceVariant,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      l10n.passwordRequirementUppercase,
                      style: text.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      l10n.passwordRequirementLowercase,
                      style: text.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      l10n.passwordRequirementNumber,
                      style: text.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      l10n.passwordRequirementSpecial,
                      style: text.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// Confirm Password
              Text(l10n.confirmPassword, style: text.titleMedium),

              const SizedBox(height: 8),

              inputField(
                controller: confirmPasswordController,
                hint: l10n.confirmPassword,
                obSecureText: true,
                prefix: const Icon(Icons.lock_outline),
                suffix: InkWell(
                  onTap: () {},
                  child: const Icon(Icons.visibility_off_outlined),
                ),
              ),

              const SizedBox(height: 24),

              /// Face ID
              CheckboxListTile(
                value: false,
                onChanged: (_) {},
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(l10n.enableFaceID),
              ),

              const SizedBox(height: 8),

              /// Marketing Checkbox
              CheckboxListTile(
                value: false,
                onChanged: (_) {},
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  l10n.marketingConsent,
                  style: text.bodyMedium,
                ),
              ),

              const SizedBox(height: 20),

              /// Terms & Conditions
              CheckboxListTile(
                value: true,
                onChanged: (_) {},
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: RichText(
                  text: TextSpan(
                    style: text.bodyMedium?.copyWith(color: colors.onSurface),
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

              /// Business Account
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

              /// Register Button
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
    );
  }
}
