import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kamelion/app/components/activities/support_app_bar.dart';
import 'package:kamelion/app/services/colors.dart';
import 'package:kamelion/app/services/responsive_size.dart';
import 'package:kamelion/app/services/text_style_util.dart';

import '../controllers/faqs_controller.dart';

class FaqsView extends GetView<FaqsController> {
  const FaqsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SupportAppBar(
              title: "   FAQs",
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 12.0.ksp, vertical: 8.ksp),
              child: Column(
                children: [
                  ...controller.faqQuestions.asMap().entries.map((entry) {
                    int index = entry.key;
                    String item = entry.value;
                    final question = entry.value;
                    final answer = controller.answers[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.0.ksp),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.ksp),
                            border: Border.all(
                                width: 1.5.ksp, color: context.greyBorder),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.black.withOpacity(0.1),
                            //     blurRadius: 10,
                            //     offset: Offset(0, 4),
                            //   )
                            // ],
                          ),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.symmetric(
                                horizontal: 10.ksp, vertical: 0),
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Q." + (index + 1).toString() + " "),
                                Expanded(
                                    child: Text(
                                  controller.faqQuestions[index],
                                  style: TextStyleUtil.genSans500(
                                      fontSize: 12.ksp, color: context.black),
                                )),
                              ],
                            ),
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.0.ksp),
                                child: Row(
                                  children: [
                                    26.kwidthBox,
                                    Flexible(
                                      child: () {
                                        final answer = controller.answers[index];

                                        if (answer is String) {
                                          // Plain‐text answer
                                          return Text(
                                            answer,
                                            style: TextStyleUtil.genSans400(fontSize: 10.5.ksp, color: context.black),
                                          );
                                        } else if (answer is Map<String, Object>) {
                                          final header = answer['header'] as String;
                                          final bullets = answer['bullets'] as List<String>;
                                          final footer = answer['footer'] as String?;
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // Header line
                                              Text(
                                                header,
                                                style: TextStyleUtil.genSans500(fontSize: 11.ksp, color: context.black),
                                              ),
                                              SizedBox(height: 6.ksp),
                                              // Bullet list
                                              ...bullets.map((b) => Padding(
                                                padding: EdgeInsets.only(bottom: 4.ksp),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("• ", style: TextStyleUtil.genSans400(fontSize: 10.5.ksp, color: context.black)),
                                                    Expanded(
                                                      child: Text(
                                                        b,
                                                        style: TextStyleUtil.genSans400(fontSize: 10.5.ksp, color: context.black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),

                                              if (footer != null) ...[
                                                SizedBox(height: 8.ksp),
                                                Text(footer,                                                 style: TextStyleUtil.genSans500(fontSize: 11.ksp, color: context.black),
                                                ),
                                              ],
                                            ],
                                          );
                                        } else {
                                          return const SizedBox.shrink();
                                        }
                                      }(),
                                    ),
                                    10.kwidthBox,
                                  ],
                                ),
                              ),
                              10.kheightBox,
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
