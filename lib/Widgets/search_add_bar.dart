import 'package:erp12k/src/app_color.dart';
import 'package:flutter/material.dart';

class SearchAddBar extends StatelessWidget {
  const SearchAddBar({
    super.key,
    required this.filter,
  });
  final VoidCallback filter;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: filter,
            icon: const Icon(Icons.filter_alt),
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.primary)),
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  labelText: 'Search',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
            ),
          ),
        ],
      ),
    );
  }
}
