// Flutter imports:
import 'package:crepto/Customs/CustomText.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:


import '../color/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? icon;
  final String? imageAsset;
  final bool? refresh;
  final VoidCallback? onRefresh;

  const CustomAppBar({
    super.key,
    required this.title,
    this.icon,
    this.imageAsset,
    this.refresh,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: const SizedBox.shrink(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(title),
      actions: [
        refresh ?? false
            ? InkWell(
                onTap: onRefresh,
                child: const Icon(Icons.refresh),
              )
            : const SizedBox.shrink(),
        const SizedBox(
          width: 10,
        ),
        // InkWell(
        //     onTap: () {
        //       Get.to(() => const NotificationScreen());
        //     },
        //     child: const Padding(
        //       padding: EdgeInsets.only(right: 10),
        //       child: Icon(Icons.notifications_none_outlined,color: NatureColor.primary,),
        //     )),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomSimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool onlyTitle;
  const CustomSimpleAppBar({
    super.key,
    required this.title,
     this.onlyTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: InkWell(
        onTap: (){
          Get.back();
        },
          child: Icon(Icons.arrow_back_ios,size: 17,)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: CustomText(
        text: title,
        fontSize: 4.5,
        fontWeight: FontWeight.bold,
      ),

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}