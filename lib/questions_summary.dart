import 'package:flutter/material.dart';
import 'package:quiz_app/summary/summary_items.dart';

class QuestionsSummary extends StatelessWidget {
  // Constructor that takes a list of summary data
  const QuestionsSummary(this.summaryData, {super.key});

  // List containing summary data for questions
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summaryData.map(
            (data) {
              return SummaryItems(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
