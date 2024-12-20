part of 'widgets.dart';

class CircleContainerWidget<T> extends StatelessWidget {
  const CircleContainerWidget({
    super.key,
    this.onTap,
    this.margin,
    this.iconColor,
    this.backgroundColor,
    this.size,
    this.iconSize,
    required this.asset,
  });

  final EdgeInsetsGeometry? margin;
  final Function()? onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? size;
  final double? iconSize;

  final T asset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: size ?? 42.0,
        width: size ?? 42.0,
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            color:
                backgroundColor ?? (asset is IconData ? greyColor : whiteColor),
            shape: BoxShape.circle,
            border: Border.all(
                color: backgroundColor != null ? Colors.transparent : greyColor,
                width: 1)),
        child: Container(
          padding: asset is IconData && asset == Icons.arrow_back_ios
              ? const EdgeInsets.only(left: 6)
              : EdgeInsets.zero,
          decoration: BoxDecoration(
              color: backgroundColor ?? whiteColor,
              shape: BoxShape.circle,
              border: Border.all(
                  color:
                      backgroundColor != null ? Colors.transparent : greyColor,
                  width: 1)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: asset is String
                ? Image.asset(
                    asset as String,
                    fit: BoxFit.fill,
                  )
                : Icon(asset as IconData,
                    size: iconSize ?? 18, color: iconColor),
          ),
        ),
      ),
    );
  }
}
