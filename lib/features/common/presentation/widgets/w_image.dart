import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? iconHeight;
  final double? iconWidth;
  final BoxFit fit;
  final Color? color;
  final Widget? imageBuilder;
  final BorderRadius? borderRadius;
  final double ratio;
  final bool isPersonIcon;

  final Widget? placeHolder;
  final Widget? errorWidget;
  final BoxBorder? border;
  final Gradient? gradient;
  const WImage({
    this.imageUrl = "",
    this.width,
    this.height,
    this.iconHeight,
    this.iconWidth,
    this.fit = BoxFit.fill,
    this.color,
    this.borderRadius,
    this.imageBuilder,
    this.ratio = 16 / 9,
    this.isPersonIcon = false,
    this.errorWidget,
    this.placeHolder,
    this.border,
    this.gradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        color: color,
        fit: fit,
        imageBuilder: (context, imageProvider) => AspectRatio(
          aspectRatio: ratio,
          child: imageBuilder ??
              Container(
                width: width,
                height: height,
                foregroundDecoration: BoxDecoration(gradient: gradient),
                decoration: BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(0),
                  image: DecorationImage(image: imageProvider, fit: fit),
                  border: border,
                ),
              ),
        ),
        placeholder: (context, val) =>
            placeHolder ??
            // TODO : add placeholder
            Container(
              decoration: BoxDecoration(
                  color: disabledButton, borderRadius: borderRadius),
              // child: Center(
              //   child: SizedBox(
              //     height: 88,
              //     width: 88,
              //     child: SvgPicture.asset(AppIcons.placeholderIcon),
              //   ),
              // ),
            ),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Container(
              decoration: BoxDecoration(
                  color: disabledButton, borderRadius: borderRadius),
              // TODO : add error widget
              // child: Center(
              //   child: SizedBox(
              //     height: iconHeight ?? 88,
              //     width: iconWidth ?? 88,
              //     child: SvgPicture.asset(
              //       color: baliHai,
              //       isPersonIcon ? AppIcons.person : AppIcons.placeholderIcon,
              //     ),
              //   ),
              // ),
            ),
      ),
    );
  }
}
