import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_project_request.dart';
import 'package:to_do_list_app/infrastructure/constants/app_color.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class MyProjectPage extends StatelessWidget {
  const MyProjectPage({
    required this.projectActivity,
    super.key,
  });

  final ProjectActivity projectActivity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: innerBoxIsScrolled ? 1 : 1,
            title: Text(
              'My Projects',
              style: MyTypography.bodySmall,
            ),
            expandedHeight: 240,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 240,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff2b5876), Color(0xff4e4376)],
                  ),
                ),
              ),
            ),
          ),
        ],
        body: SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            projectActivity.projectName,
                            style: MyTypography.bodySmall
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            projectActivity.projectDate,
                            style: MyTypography.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        projectActivity.projectDescription,
                        textAlign: TextAlign.justify,
                        style: MyTypography.bodySmall.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text('List Activity', style: MyTypography.bodySmall),
                      const SizedBox(
                        height: 16,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: projectActivity.projectDataActivity.length,
                        itemBuilder: (context, index) => SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                // horizontal: 8,
                                vertical: 8,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: colorSchedule[
                                          index % colorSchedule.length],
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(10.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 25,
                                              child: Image.asset(
                                                'assets/images/Olahraga.png',
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  projectActivity
                                                      .projectDataActivity[
                                                          index]
                                                      .projectDataName,
                                                  style: MyTypography
                                                      .bodySmallWhite
                                                      .copyWith(fontSize: 12),
                                                ),
                                                Text(
                                                  projectActivity
                                                      .projectDataActivity[
                                                          index]
                                                      .projectDataName,
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
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Text(
                                                      '''${projectActivity.projectDataActivity[index].projectStartTime} - ${projectActivity.projectDataActivity[index].projectDataName}''',
                                                      style: MyTypography
                                                          .labelMedium
                                                          .copyWith(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15.w,
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
