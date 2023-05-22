import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_todos/core/strings.dart';

import '../../ui/themes/app_theme.dart';

class HomeButtonModel {
  final String label;
  final IconData icon;
  final List<Color> color;

  HomeButtonModel({
    required this.label,
    required this.icon,
    required this.color,
  });

  HomeButtonModel copyWith({
    String? label,
    IconData? icon,
    List<Color>? color,
  }) {
    return HomeButtonModel(
      label: label ?? this.label,
      icon: icon ?? this.icon,
      color: color ?? this.color,
    );
  }

  static List<HomeButtonModel> get getColor => [
        HomeButtonModel(
            label: Strings.learn, icon: Icons.menu_book, color: AppTheme.sky),
        HomeButtonModel(
            label: Strings.bank,
            icon: Icons.maps_home_work,
            color: AppTheme.sunset),
        HomeButtonModel(
            label: Strings.questionBank,
            icon: Icons.question_answer,
            color: AppTheme.sea),
        HomeButtonModel(
            label: Strings.vocabulary,
            icon: Icons.search,
            color: AppTheme.mango),
        HomeButtonModel(
            label: Strings.currentAffairs,
            icon: Icons.event_note,
            color: AppTheme.fire),
        HomeButtonModel(
            label: Strings.newsPaper,
            icon: Icons.newspaper,
            color: AppTheme.nightFade),
        HomeButtonModel(
            label: Strings.eBook,
            icon: Icons.book_online,
            color: AppTheme.temptingAzure),
        HomeButtonModel(
            label: Strings.subjectiveExam,
            icon: Icons.text_snippet,
            color: AppTheme.trueSunset),
        HomeButtonModel(
            label: Strings.quiz, icon: Icons.quiz, color: AppTheme.purpleLake),
        HomeButtonModel(
            label: Strings.modelTest,
            icon: Icons.model_training,
            color: AppTheme.mixedHopes),
      ];

  @override
  String toString() =>
      'HomeButtonModel(label: $label, icon: $icon, color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeButtonModel &&
        other.label == label &&
        other.icon == icon &&
        listEquals(other.color, color);
  }

  @override
  int get hashCode => label.hashCode ^ icon.hashCode ^ color.hashCode;
}
