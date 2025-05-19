import 'package:flutter/material.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/resources/app_icons.dart';

class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You have got 5 tasks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Text(
                  'today to complete',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 8),
                SizedBox(width: 24, height: 24, child: AppIcons.iconPen),
              ],
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.hexBA83DE, AppColors.hexD9D9D900],
                ),
              ),
              child: Image.asset('assets/image.png', fit: BoxFit.cover),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 15,
                height: 15,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.hexFF763B,
                ),
                child: const Center(
                  child: Text('5', style: TextStyle(
                      color: Colors.white,
                      fontSize: 9
                  )),
                )
              ),
            ),
          ],
        ),
      ],
    );
  }
}
