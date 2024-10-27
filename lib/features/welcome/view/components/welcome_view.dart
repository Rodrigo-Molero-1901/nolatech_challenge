part of '../welcome_page.dart';

class _WelcomeView extends StatelessWidget {
  final WelcomeCubit cubit;
  final WelcomeViewModel viewModel;

  const _WelcomeView({
    required this.cubit,
    required this.viewModel,
  });

  static const _logoPos = 90.0;
  static const _loginBtnPos = 124.0;
  static const _registerBtnPos = 51.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Stack(
      children: [
        Positioned.fill(
          child: Assets.images.welcomeBackground.image(fit: BoxFit.fill),
        ),
        Positioned(
          top: _logoPos,
          left: 0,
          right: 0,
          child: Assets.icons.logo.svg(),
        ),
        Positioned(
          bottom: _loginBtnPos,
          left: AppDimensions.horizontalPadding,
          right: AppDimensions.horizontalPadding,
          child: AppButton(
            onTap: cubit.onLoginTapped,
            text: l10n.w_login_button,
          ),
        ),
        Positioned(
          bottom: _registerBtnPos,
          left: AppDimensions.horizontalPadding,
          right: AppDimensions.horizontalPadding,
          child: AppButton(
            onTap: cubit.onRegisterTapped,
            text: l10n.w_register_button,
            color: AppContextColors.registerButton,
          ),
        ),
      ],
    );
  }
}
