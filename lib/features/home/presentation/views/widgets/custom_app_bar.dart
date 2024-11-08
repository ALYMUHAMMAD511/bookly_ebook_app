import 'package:bookly_ebook_app/core/utils/app_router.dart';
import 'package:bookly_ebook_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
              Assets.logo,
              width: 75,
              height: 16.1,
            ),
          IconButton(
            onPressed: ()
            {
              GoRouter.of(context).push(
                AppRouter.kSearchView,
              );
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}