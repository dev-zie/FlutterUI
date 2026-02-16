import 'package:flutter/material.dart';
import 'package:uiwidgets/basics/extension/date_time_extension.dart';

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime? startDate;
  DateTime? endDate;
  String result = '';

  void calculate() {
    if (startDate != null && endDate != null) {
      final days = startDate!.daysBetween(endDate!);
      result = '🗓️ Difference: $days days';
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'Select date';
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<void> pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        startDate = picked;
        calculate();
      });
    }
  }

  Future<void> pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        endDate = picked;
        calculate();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Date Difference Calculator',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: pickStartDate,
            child: Text('Start Date: ${formatDate(startDate)}'),
          ),

          const SizedBox(height: 12),

          ElevatedButton(
            onPressed: pickEndDate,
            child: Text('End Date: ${formatDate(endDate)}'),
          ),

          const SizedBox(height: 24),

          Text(result, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
