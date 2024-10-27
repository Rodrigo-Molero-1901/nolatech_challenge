part of 'app_widgets.dart';

class AppHtmlRichText extends StatelessWidget {
  final String htmlString;
  final TextStyle normalStyle;
  final TextStyle? boldStyle;
  final TextStyle? italicStyle;
  final TextStyle? superscriptStyle;
  final TextStyle? subscriptStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow textOverflow;

  const AppHtmlRichText({
    required this.htmlString,
    required this.normalStyle,
    this.boldStyle,
    this.italicStyle,
    this.superscriptStyle,
    this.subscriptStyle,
    this.textAlign,
    this.maxLines,
    this.textOverflow = TextOverflow.ellipsis,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);
    final systemTextAlign =
        (textDirection == TextDirection.ltr) ? TextAlign.left : TextAlign.right;

    return RichText(
      textScaler: MediaQuery.textScalerOf(context),
      maxLines: maxLines,
      text: _parseText(htmlString),
      textAlign: textAlign ?? systemTextAlign,
      overflow: textOverflow,
    );
  }

  TextSpan _parseText(String input) {
    final List<TextSpan> children = [];
    final RegExp tagRegExp = RegExp(r'<(/?)([bi]|sup|sub)>');

    final boldStyle =
        this.boldStyle ?? normalStyle.copyWith(fontWeight: FontWeight.bold);

    final italicStyle =
        this.italicStyle ?? normalStyle.copyWith(fontStyle: FontStyle.italic);

    final superscriptStyle = this.superscriptStyle ??
        normalStyle.copyWith(fontFeatures: [const FontFeature.superscripts()]);

    final subscriptStyle = this.subscriptStyle ??
        normalStyle.copyWith(fontFeatures: [const FontFeature.subscripts()]);

    int currentIndex = 0;
    bool isBold = false;
    bool isItalic = false;
    bool isSuperscript = false;
    bool isSubscript = false;

    tagRegExp.allMatches(input).forEach((match) {
      final matchStart = match.start;
      final matchEnd = match.end;
      final tag = match.group(2);
      final text = input.substring(currentIndex, matchStart);

      TextStyle style = normalStyle;

      if (isBold) {
        style = style.merge(boldStyle);
      }
      if (isItalic) {
        style = style.merge(italicStyle);
      }
      if (isSuperscript) {
        style = style.merge(superscriptStyle);
      }
      if (isSubscript) {
        style = style.merge(subscriptStyle);
      }

      children.add(TextSpan(text: text, style: style));

      if (tag == 'b') {
        isBold = !isBold;
      } else if (tag == 'i') {
        isItalic = !isItalic;
      } else if (tag == 'sup') {
        isSuperscript = !isSuperscript;
      } else if (tag == 'sub') {
        isSubscript = !isSubscript;
      }

      currentIndex = matchEnd;
    });

    TextStyle style = normalStyle;

    if (isBold) {
      style = style.merge(boldStyle);
    }
    if (isItalic) {
      style = style.merge(italicStyle);
    }
    if (isSuperscript) {
      style = style.merge(superscriptStyle);
    }
    if (isSubscript) {
      style = style.merge(subscriptStyle);
    }

    final remainingText = input.substring(currentIndex);

    children.add(TextSpan(text: remainingText, style: style));

    return TextSpan(children: children);
  }
}
