part of '../register_page.dart';

class _RegisterView extends StatefulWidget {
  final RegisterCubit cubit;
  final RegisterViewModel viewModel;

  const _RegisterView({
    required this.cubit,
    required this.viewModel,
  });

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  static const _headerHeight = 250.0;
  static const _arrowBackPos = 30.0;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                  l10n.r_register_title,
                  style: AppTextStyles.headline.small.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const AppDivider(),
                const SizedBox(height: AppSpacing.spacing7x),
                AppTextField(
                  controller: _nameController,
                  leadingIcon: Assets.icons.person.svg(),
                  hintText: l10n.r_name_field,
                ),
                const SizedBox(height: AppSpacing.spacing2Dot5x),
                AppTextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  leadingIcon: Assets.icons.phone.svg(),
                  hintText: l10n.r_phone_number_field,
                ),
                const SizedBox(height: AppSpacing.spacing2Dot5x),
                AppTextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  leadingIcon: Assets.icons.mail.svg(),
                  hintText: l10n.r_email_field,
                ),
                const SizedBox(height: AppSpacing.spacing2Dot5x),
                AppTextField(
                  controller: _passwordController,
                  obscureText: true,
                  leadingIcon: Assets.icons.lock.svg(),
                  hintText: l10n.r_password_field,
                ),
                const SizedBox(height: AppSpacing.spacing2Dot5x),
                AppTextField(
                  controller: _confirmPasswordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  leadingIcon: Assets.icons.lock.svg(),
                  hintText: l10n.r_confirm_password_field,
                ),
                const SizedBox(height: AppSpacing.spacing5x),
                AppButton(
                  onTap: () {
                    if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      return;
                    }

                    widget.cubit.onRegisterTapped(
                      _nameController.text,
                      _phoneController.text,
                      _emailController.text,
                      _passwordController.text,
                    );
                  },
                  text: l10n.r_register_button,
                ),
                const SizedBox(height: AppSpacing.spacing4Dot75x),
                Center(
                  child: InkWell(
                    onTap: widget.cubit.onGoToLoginTapped,
                    child: AppHtmlRichText(
                      htmlString: l10n.r_login_hint,
                      normalStyle: AppTextStyles.title.small,
                      boldStyle: AppTextStyles.title.small.copyWith(
                        color: AppContextColors.registerHintText,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.spacing3Dot25x),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
