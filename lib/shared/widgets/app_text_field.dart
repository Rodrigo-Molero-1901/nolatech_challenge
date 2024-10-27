part of 'app_widgets.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool obscureText;
  final String startingText;
  final String? labelText;
  final String? hintText;
  final Widget? trailingIcon;
  final Widget? leadingIcon;
  final int minLines;
  final int maxLines;

  const AppTextField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.startingText = '',
    this.labelText,
    this.hintText,
    this.trailingIcon,
    this.leadingIcon,
    this.minLines = 1,
    this.maxLines = 1,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _controller;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller != null
        ? widget.controller!
        : TextEditingController(text: widget.startingText);
    _obscureText = widget.obscureText;
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimensions.textFieldLabelHorizontalPadding,
            ),
            child: Text(
              widget.labelText!,
              style: AppTextStyles.body.small.copyWith(
                color: AppContextColors.textFieldLabelText,
              ),
            ),
          ),
        TextField(
          controller: _controller,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          style: AppTextStyles.title.small,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.only(
              top: AppDimensions.textFieldInnerTopPadding,
            ),
            hintText: widget.hintText,
            hintStyle: AppTextStyles.body.small.copyWith(
              color: AppContextColors.textFieldHintText,
            ),
            prefixIcon: _prefixIcon(),
            suffixIcon: _suffixIcon(),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppContextColors.textFieldUnderline,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppContextColors.textFieldUnderline,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget? _prefixIcon() {
    if (widget.leadingIcon == null) return null;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: AppSpacing.spacing1Dot5x),
        widget.leadingIcon!,
        const SizedBox(width: AppSpacing.spacing1x),
        const AppVerticalDivider(),
        const SizedBox(width: AppSpacing.spacing1x),
      ],
    );
  }

  Widget? _suffixIcon() {
    return widget.obscureText
        ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            focusNode: FocusNode(skipTraversal: true),
          )
        : widget.trailingIcon;
  }
}
