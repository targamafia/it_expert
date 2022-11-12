extension DateTimeFormatting on DateTime {
  String asSimpleDateFormat() {
    return "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year.toString()}";
  }
}
