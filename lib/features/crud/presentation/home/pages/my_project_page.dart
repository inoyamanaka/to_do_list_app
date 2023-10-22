import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/infrastructure/constants/app_color.dart';
import 'package:to_do_list_app/infrastructure/theme/typography.dart';

class MyProjectPage extends StatelessWidget {
  const MyProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor:
                innerBoxIsScrolled ? Colors.white : Colors.transparent,
            elevation: innerBoxIsScrolled ? 1 : 0,
            title: Text('My Projects', style: MyTypography.bodySmall),
            expandedHeight: 240,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text('My Projects', style: MyTypography.bodySmall),
              background: Container(
                height: 240,
                color: const Color(0xffD9D9D9),
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
                            'Belajar Hacking',
                            style: MyTypography.bodySmall,
                          ),
                          Text(
                            'Belajar Hacking',
                            style: MyTypography.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pulvinar neque eu purus sollicitudin, id interdum mauris lacinia. Vivamus auctor tincidunt nisi, ac bibendum leo sagittis vitae. Aliquam erat volutpat. Nulla facilisi. Sed nec eleifend metus. Integer pellentesque arcu ac sapien condimentum, at tristique dolor tincidunt. Sed euismod ipsum vel nibh vulputate, in venenatis neque feugiat.''',
                        textAlign: TextAlign.justify,
                        style: MyTypography.bodySmall.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text('Progress', style: MyTypography.bodySmall),
                      const SizedBox(
                        height: 16,
                      ),
                      const LinearProgressIndicator(),
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
                        itemCount: 3,
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
                                                  'Test',
                                                  style: MyTypography
                                                      .bodySmallWhite
                                                      .copyWith(fontSize: 12),
                                                ),
                                                Text(
                                                  'Test',
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
                                                      'Test',
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
