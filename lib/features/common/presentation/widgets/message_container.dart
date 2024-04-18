import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageContainer extends StatelessWidget {
  final String message;
  final bool isSuccess;
  final bool isNotification;

  const MessageContainer({
    required this.message,
    required this.isSuccess,
    Key? key,
    required this.isNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: blackRussian.withOpacity(.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (isSuccess) ...{
            // SvgPicture.asset(AppIcons.success)
          } else if (isNotification) ...{
            // SvgPicture.asset(AppIcons.notif)
          } else ...{
            // SvgPicture.asset(AppIcons.failure)
          },
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
