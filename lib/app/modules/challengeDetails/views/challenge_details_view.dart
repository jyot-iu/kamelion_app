import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kamelion/app/components/activities/challenge_details_app_bar.dart';
import 'package:kamelion/app/components/workoutDetails/workout_details_appbar.dart';
import 'package:kamelion/app/routes/app_pages.dart';
import 'package:kamelion/app/services/colors.dart';
import 'package:kamelion/app/services/custom_button.dart';
import 'package:kamelion/app/services/responsive_size.dart';
import 'package:kamelion/app/services/text_style_util.dart';
import 'package:kamelion/generated/locales.g.dart';

import '../controllers/challenge_details_controller.dart';

class ChallengeDetailsView extends GetView<ChallengeDetailsController> {
  const ChallengeDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: context.scaffoldBg,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(),
          body: controller.isLoading.value
              ? Container(
                  margin: EdgeInsets.only(top: 14.ksp),
                  child: Center(
                    child:
                        CircularProgressIndicator(color: context.brandColor1),
                  ),
                )
              : Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ChallengeDetailsAppBar(
                            isSaved:
                                (controller.challengeDetails?.value.isSaved ??
                                        false)
                                    .obs,
                            title: controller
                                    .challengeDetails?.value.challengeTitle ??
                                "",
                            days: controller
                                    .challengeDetails?.value.totalDuration
                                    .toString() ??
                                "",
                          ),
                          15.kheightBox,
                          controller.challengeDetails!.value.isJoined! &&
                                  controller.challengeDetails!.value
                                          .userChallengeProgress ==
                                      "inProgress"
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.ksp),
                                  child: Card(
                                    elevation: 5,
                                    color: context.white,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0.ksp),
                                        child: Column(
                                          children: [
                                            4.kheightBox,
                                            Row(
                                              children: [
                                                4.kwidthBox,
                                                Text(
                                                  "Challenge Progress",
                                                  style:
                                                      TextStyleUtil.genSans500(
                                                          fontSize: 14.ksp,
                                                          color: context.black),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(11.0.ksp),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child:
                                                        LinearProgressIndicator(
                                                      value: ((controller
                                                                  .challengeDetails!
                                                                  .value
                                                                  .progress ??
                                                              0) /
                                                          100),
                                                      minHeight: 8.ksp,
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        context.brandColor1,
                                                      ),
                                                      backgroundColor:
                                                          context.grey,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(
                                                            12.0.ksp),
                                                      ),
                                                    ),
                                                  ),
                                                  12.kwidthBox,
                                                  Text(
                                                      "${(controller.challengeDetails!.value.progress ?? 0)}% " +
                                                          LocaleKeys
                                                              .complete.tr),
                                                ],
                                              ),
                                            ),
                                            // Icon(
                                            //   Icons.keyboard_arrow_down,
                                            //   size: 20.ksp,
                                            // )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.challengeDetails!.value.isActive!
                              ? 15.kheightBox
                              : Container(),
                          Row(
                            children: [
                              18.kwidthBox,
                              Text(
                                "Introduction",
                                style: TextStyleUtil.genSans500(
                                  fontSize: 14.ksp,
                                  color: context.black,
                                ),
                              ),
                            ],
                          ),
                          12.kheightBox,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.ksp),
                            child: Text(
                              controller
                                      .challengeDetails?.value.challengeIntro ??
                                  "",
                              // "Building friendships is an essential part of the human experience. It involves creating bonds with others that can enrich our lives, provide support, and foster a sense of belonging. Whether through shared interests, experiences, or simply spending time together, the journey of forming friendships can lead to lasting connections that bring joy and fulfillment.",
                              style: TextStyleUtil.genSans400(
                                fontSize: 12.ksp,
                                color: ColorUtil(context).black,
                              ),
                            ),
                          ),
                          // 16.kheightBox,
                          // Row(
                          //   children: [
                          //     18.kwidthBox,
                          //     Text(
                          //       "What to do",
                          //       style: TextStyleUtil.genSans500(
                          //         fontSize: 14.ksp,
                          //         color: context.black,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // 12.kheightBox,
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 14.ksp),
                          //   child: Text(
                          //     "Capture a thought each day, or aim for 50 characters!",
                          //     style: TextStyleUtil.genSans400(
                          //       fontSize: 12.ksp,
                          //       color: ColorUtil(context).black,
                          //     ),
                          //   ),
                          // ),
                          // 16.kheightBox,
                          // Row(
                          //   children: [
                          //     18.kwidthBox,
                          //     Text(
                          //       "Why it matters",
                          //       style: TextStyleUtil.genSans500(
                          //         fontSize: 14.ksp,
                          //         color: context.black,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // 12.kheightBox,
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 14.ksp),
                          //   child: Text(
                          //     "Building friendships is an essential part of the human experience. It involves creating bonds with others that can enrich our lives, provide support, and foster a sense of belonging. Whether through shared interests, experiences, or simply spending time together, the journey of forming friendships can lead to lasting connections that bring joy and fulfillment.",
                          //     style: TextStyleUtil.genSans400(
                          //       fontSize: 12.ksp,
                          //       color: ColorUtil(context).black,
                          //     ),
                          //   ),
                          // ),

                          // 16.kheightBox,
                        ],
                      ),
                    ),
                    Spacer(),
                    controller.isLoading.value == true
                        ? Container()
                        : (controller.challengeDetails!.value
                                        .userChallengeProgress ==
                                    "completed" ||
                                controller.challengeDetails!.value
                                        .userChallengeProgress ==
                                    "quit")
                            ? Container()
                            : Container(
                                // height: 80.ksp,
                                decoration: BoxDecoration(color: context.white),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // if (controller.challengeDetails != null)
                                    // controller.challengeDetails!.value
                                    (controller.challengeDetails!.value
                                                .isJoined! &&
                                            DateTime.now()
                                                    .difference(DateTime.parse(
                                                        controller
                                                            .challengeDetails!
                                                            .value
                                                            .startedDate!))
                                                    .inDays
                                                    .toInt() >
                                                (controller.challengeDetails!
                                                        .value.totalDuration ??
                                                    0))
                                        ? Flexible(
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0.ksp),
                                              child: CustomButton.outline(
                                                onTap: () {
                                                  controller.quiteChallenge();
                                                },
                                                title: 'Quit Challenge',
                                                color: context.redBg,
                                                buttonColor: context.redBg,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    DateTime.now()
                                                .difference(DateTime.parse(
                                                    controller.challengeDetails!
                                                        .value.startedDate!))
                                                .inDays
                                                .toInt() >
                                            (controller.challengeDetails!.value
                                                    .totalDuration ??
                                                0)
                                        ? Container()
                                        : Flexible(
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0.ksp),
                                              child: CustomButton.outline(
                                                onTap: () {
                                                  controller.challengeDetails!
                                                          .value.isJoined!
                                                      ? controller
                                                          .completeChallenge()
                                                      : controller
                                                          .startChallenge();
                                                },
                                                title: controller
                                                        .challengeDetails!
                                                        .value
                                                        .isJoined!
                                                    ? 'Mark Challenge Done'
                                                    : 'Start Challenge',
                                                color: context.redBg,
                                                buttonColor: context.redBg,
                                              ),
                                            ),
                                          ),
                                    // 2.kheightBox,
                                    (controller.challengeDetails!.value
                                                .isJoined! &&
                                            DateTime.now()
                                                    .difference(DateTime.parse(
                                                        controller
                                                            .challengeDetails!
                                                            .value
                                                            .startedDate!))
                                                    .inDays
                                                    .toInt() <
                                                (controller.challengeDetails!
                                                        .value.totalDuration ??
                                                    0))
                                        ? Flexible(
                                            child: InkWell(
                                              onTap: () {
                                                controller.quiteChallenge();
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 6.0.ksp),
                                                child: Text(
                                                  "Quit Challenge",
                                                  style:
                                                      TextStyleUtil.genSans600(
                                                    fontSize: 14.ksp,
                                                    color: context.redBg,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    10.kheightBox
                                  ],
                                ),
                              ),
                  ],
                ),
        ));
  }
}
