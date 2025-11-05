import 'package:flutter/material.dart';
import 'package:vibeng/theme.dart';

class WeeklyProgressChart extends StatelessWidget {
  final List<int> weeklyData;

  const WeeklyProgressChart({super.key, required this.weeklyData});

  @override
  Widget build(BuildContext context) {
    final maxValue = weeklyData.reduce((a, b) => a > b ? a : b);
    final days = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

    return Container(
      height: 180,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(7, (index) {
          final value = index < weeklyData.length ? weeklyData[index] : 0;
          final heightRatio = maxValue > 0 ? value / maxValue : 0.0;
          final isToday = index == DateTime.now().weekday - 1;

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (value > 0)
                    Text(
                      '$value',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isToday ? primaryColor : Colors.grey,
                      ),
                    ),
                  const SizedBox(height: 4),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 100 * heightRatio,
                    decoration: BoxDecoration(
                      color: isToday
                          ? primaryColor
                          : primaryColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: isToday
                          ? [
                              BoxShadow(
                                color: primaryColor.withOpacity(0.3),
                                blurRadius: 4,
                              ),
                            ]
                          : null,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    days[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                      color: isToday ? primaryColor : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
