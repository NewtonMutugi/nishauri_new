import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nishauri/src/utils/routes.dart';

import '../../data/providers/announcements_provider.dart';
import 'AnnouncementCard.dart';

class Announcements extends HookConsumerWidget {
  const Announcements({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final screenSize = MediaQuery.of(context).size;
  final currentIndex = useState(0);
    final theme = Theme.of(context);
   final announcementsAsync =
   ref.watch(announcementsProvider);
   return announcementsAsync.when(
     data: (data) => Column(
       children: [
         CarouselSlider(
           options: CarouselOptions(
               height: screenSize.height * 0.20,
               autoPlay: false,
               autoPlayInterval:
               const Duration(seconds: 3),
               enlargeCenterPage: true,
               enlargeFactor: 0.3,
               autoPlayCurve: Curves.fastOutSlowIn,
               onPageChanged: (index, reason) {
                 currentIndex.value = index;
               }),
           items: data.map((announcement) {
             return Builder(
               builder: (BuildContext context) {
                 return AnnouncementCard(
                   height: 200,
                   width: 336,
                   svgPath: announcement.image,
                   title: announcement.title,
                    onTap: (){
                     context.goNamed(RouteNames.BLOG_POST, extra: announcement);
                    },
                 );
               },
             );
           }).toList(),
         ),
         DotsIndicator(
           dotsCount: data.length,
           position: currentIndex.value,
           decorator: DotsDecorator(
               size: const Size.square(9.0),
               activeSize: const Size(18.0, 9.0),
               activeShape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(5.0),
               ),
               activeColor: theme.colorScheme.primary),
         )
       ],
     ),
     error: (error, _) => Container(),
     loading: () => const Center(
       child: CircularProgressIndicator(),
     ),
   );
  }
}
