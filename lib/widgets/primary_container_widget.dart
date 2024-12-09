part of 'widgets.dart';

class PrimaryContainerWidget extends StatelessWidget {
  const PrimaryContainerWidget({
    super.key,
    required this.value,
    this.isLock,
    this.color,
    this.fontColor,
    this.fontSize,
    this.padding,
    this.borderRadius,
  });
  final String value;
  final bool? isLock;
  final Color? color;
  final Color? fontColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color ??
              (isLock == null
                  ? primaryColor
                  : isLock!
                      ? whiteColor
                      : primaryColor),
          borderRadius: borderRadius ?? mediumBorderRadius(),
        ),
        child: Row(
          children: [
            Text(
              '${isLock == null ? '' : isLock! ? '🔐' : '🔓'} $value',
              style: TextStyle(
                color: fontColor ??
                    (isLock == null
                        ? whiteColor
                        : isLock!
                            ? Colors.grey
                            : whiteColor),
                fontSize: fontSize ?? 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
