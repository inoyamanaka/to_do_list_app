import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/crud/data/models/request/local/local_project_request.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/my_project_detail.dart';
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
                        itemBuilder: (context, index) =>
                            MyProjectPageDetailCard(
                          projectActivity: projectActivity,
                          index: index,
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
