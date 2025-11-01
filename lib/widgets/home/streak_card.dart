import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/models/user_model.dart';
import 'package:vibeng/repositories/user_repository.dart';
import 'package:vibeng/theme.dart';
import 'package:vibeng/widgets/section_header.dart';

class StreakCard extends StatefulWidget {
  const StreakCard({super.key});

  @override
  State<StreakCard> createState() => _StreakCardState();
}

class _StreakCardState extends State<StreakCard> {
  final UserRepository repository = UserRepository();
  UserDataModel? _userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final data = await repository.getUserData();
    if (mounted) {
      setState(() {
        _userData = data.isNotEmpty ? data[0] : null;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_userData == null) {
      return Container(child: Text(l10n.home_error));
    }

    final userData = _userData!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: l10n.home_streakProgress),
        Card(
          margin: defaultMargin,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/icons/steak.png',
                              width: 48,
                              height: 48,
                              color: Colors.orange,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,

                            child: Text(
                              "${userData.streak}",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.home_streakMessage,
                            style: theme.textTheme.titleMedium,
                          ),
                          Text(
                            l10n.home_streakDetail,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: userData.streakDays.map((day) {
                    final int currentWeekday = DateTime.now().weekday;
                    final List<String> weekdayStrings = [
                      "Mon",
                      "Tue",
                      "Wed",
                      "Thu",
                      "Fri",
                      "Sat",
                      "Sun",
                    ];
                    final int todayIndex = currentWeekday - 1;
                    final int dayIndex = weekdayStrings.indexOf(day.day);

                    final bool isToday = dayIndex == todayIndex;
                    final bool isPast = dayIndex < todayIndex;

                    Widget dayWidget;
                    if (isPast) {
                      dayWidget = Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        child: Container(
                          height: 4,
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    } else if (isToday) {
                      dayWidget = Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                      );
                    } else {
                      dayWidget = Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: secondaryColor.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      );
                    }

                    return Column(
                      children: [
                        Text(
                          day.day,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: isToday
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 8),
                        dayWidget,
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
