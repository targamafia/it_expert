extension DateTimeFormatting on DateTime {
  String asSimpleDateFormat() {
    return "${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
  }
}
