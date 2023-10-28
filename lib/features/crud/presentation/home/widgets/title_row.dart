import 'package:flutter/material.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({
    required this.title,
    required this.onPress,
    super.key,
  });

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: MyTypography.bodySmall,
          ),
          TextButton(
            onPressed: onPress,
            child: Text(
              'Show all',
              style: MyTypography.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
