// lib/ui/widgets/pagination.dart

import 'package:flutter/material.dart';

class Pagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;
  final int maxPageButtons;

  const Pagination({
    super.key,
    required this.currentPage,
    required this.onPageChanged,
    this.totalPages = 1,
    this.maxPageButtons = 5,
  });

  @override
  Widget build(BuildContext context) {
    if (totalPages <= 1) return const SizedBox.shrink();

    // Determine start and end page for buttons
    int startPage = (currentPage - (maxPageButtons ~/ 2)).clamp(1, totalPages - maxPageButtons + 1);
    int endPage = (startPage + maxPageButtons - 1).clamp(1, totalPages);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
        ),
        ...List.generate(endPage - startPage + 1, (i) {
          final page = startPage + i;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: TextButton(
              onPressed: page == currentPage ? null : () => onPageChanged(page),
              style: TextButton.styleFrom(
                backgroundColor: page == currentPage ? Theme.of(context).primaryColor : null,
                minimumSize: const Size(36, 36),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              child: Text(
                '$page',
                style: TextStyle(
                  color: page == currentPage ? Colors.white : Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ),
          );
        }),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
        ),
      ],
    );
  }
}
