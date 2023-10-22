import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:to_do_list_app/features/crud/presentation/home/pages/home_page.dart';
import 'package:to_do_list_app/features/crud/presentation/home/widgets/my_project_card.dart';

class ShowAllProject extends StatelessWidget {
  const ShowAllProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Today Projects',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ShowUpAnimation(
            delayStart: const Duration(milliseconds: 200),
            child: ValueListenableBuilder(
              valueListenable: isEmptyList,
              builder: (context, value, child) => SizedBox(
                height: MediaQuery.of(context).size.height +
                    AppBar().preferredSize.height,
                child: value
                    ? ShowUpAnimation(
                        child: SizedBox(
                          height: 220,
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FittedBox(child: MyProjectCard()),
                                SizedBox(height: 10.w),
                              ],
                            ),
                          ),
                        ),
                      )
                    : ShowUpAnimation(
                        child: SizedBox(
                          height: 220,
                          child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FittedBox(child: MyProjectCard()),
                                SizedBox(width: 10.w),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
