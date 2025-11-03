import 'package:flutter/material.dart';
import 'package:vibeng/l10n/app_localizations.dart';
import 'package:vibeng/widgets/section_header.dart';

class VideoTopics extends StatelessWidget {
  const VideoTopics({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(children: [SectionHeader(title: l10n.video_topic_all)]);
  }
}
