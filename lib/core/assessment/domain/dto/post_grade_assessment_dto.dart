import 'dart:ffi';

import 'package:flutter/material.dart';

class PostGradeAssessmentDto {
  final String id;
  final DateTime startDate;
  final DateTime endDate;
  final double grade;
  final int correctAnswers;
  final int wrongAnswers;

  PostGradeAssessmentDto(
      {required this.id,
      required this.startDate,
      required this.endDate,
      required this.grade,
      required this.correctAnswers,
      required this.wrongAnswers});
}
