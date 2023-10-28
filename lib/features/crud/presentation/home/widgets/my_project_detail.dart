import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_project_request.dart';
import 'package:to_do_list_app/infrastructure/constants/app_color.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class MyProjectPageDetailCard extends StatelessWidget {
  const MyProjectPageDetailCard({
    required this.projectActivity,
    required this.index,
    super.key,
  });

  final ProjectActivity projectActivity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FittedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: colorSchedule[index % colorSchedule.length],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: Image.asset(
                            'assets/images/Olahraga.png',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              projectActivity
                                  .projectDataActivity[index].projectDataName,
                              style: MyTypography.bodySmallWhite
                                  .copyWith(fontSize: 12),
                            ),
                            Text(
                              projectActivity
                                  .projectDataActivity[index].projectDataName,
                              style: MyTypography.bodyMedium
                                  .copyWith(fontSize: 10),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.watch,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '''${projectActivity.projectDataActivity[index].projectStartTime} - ${projectActivity.projectDataActivity[index].projectDataName}''',
                                  style: MyTypography.labelMedium.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.listUl,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
