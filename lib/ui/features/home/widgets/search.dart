import 'package:flutter/material.dart';
import 'package:myapp/ui/core/resources/app_colors.dart';
import 'package:myapp/ui/core/resources/app_icons.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 7, right: 12),
        child: AppIcons.iconSearch,
      ),
      hintText: 'Search Task Here',
      backgroundColor: WidgetStateProperty.all(AppColors.hex1E1E1E),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
