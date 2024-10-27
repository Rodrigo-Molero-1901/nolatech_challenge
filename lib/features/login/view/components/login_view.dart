part of '../login_page.dart';

class _LoginView extends StatefulWidget {
  final LoginCubit cubit;
  final LoginViewModel viewModel;

  const _LoginView({
    required this.cubit,
    required this.viewModel,
  });

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  static const _headerHeight = 250.0;
  static const _arrowBackPos = 30.0;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: _headerHeight,
          width: double.infinity,
          color: AppContextColors.background,
          child: Stack(
            children: [
              Positioned.fill(
                child: Assets.images.loginHeader.image(
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                top: _arrowBackPos,
                left: AppDimensions.horizontalPadding,
                child: InkWell(
                  onTap: context.pop,
                  child: Assets.icons.customArrowBack.svg(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.spacing5x),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.horizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.l_login_title,
                  style: AppTextStyles.headline.small.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const AppDivider(),
                const SizedBox(height: AppSpacing.spacing5dot75x),
                AppTextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelText: l10n.l_email_field,
                  leadingIcon: Assets.icons.mail.svg(),
                ),
                const SizedBox(height: AppSpacing.spacing2Dot5x),
                AppTextField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  labelText: l10n.l_password_field,
                  leadingIcon: Assets.icons.lock.svg(),
                ),
                const SizedBox(height: AppSpacing.spacing1Dot5x),
                // checkbox
                const SizedBox(height: AppSpacing.spacing2Dot5x),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      l10n.l_forgot_password_hint,
                      style: AppTextStyles.title.small.copyWith(
                        color: AppContextColors.forgotPasswordHintText,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.spacing5x),
                AppButton(
                  onTap: () {
                    widget.cubit.onLoginTapped(
                      _emailController.text,
                      _passwordController.text,
                    );
                  },
                  text: l10n.l_login_button,
                ),
                const SizedBox(height: AppSpacing.spacing8x),
                Center(
                  child: InkWell(
                    onTap: widget.cubit.onGoToRegisterTapped,
                    child: AppHtmlRichText(
                      htmlString: l10n.l_register_hint,
                      normalStyle: AppTextStyles.title.small,
                      boldStyle: AppTextStyles.title.small.copyWith(
                        color: AppContextColors.registerHintText,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.spacing10x),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
