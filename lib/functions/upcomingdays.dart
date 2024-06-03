import 'package:intl/intl.dart';

// Function to get upcoming 4 days' names with proper internationalization
List<String> getUpcomingDaysNames(DateTime today) {
  final days = <String>[];
  for (int i = 0; i < 5; i++) {
    // Add one day to the current date using Duration
    final nextDay = today.add(Duration(days: i));
    // Use DateFormat with EEEE for full weekdays (Monday, Tuesday, etc.)
    days.add(DateFormat('EEEE').format(nextDay));
  }
  return days;
}

List<String> getUpcomingDays(DateTime today) {
  final days = <String>[];
  for (int i = 0; i < 5; i++) {
    // Add one day to the current date using Duration
    final nextDay = today.add(Duration(days: i));

    days.add(DateFormat('dd/MM').format(nextDay));
  }
  return days;
}

// Example usage
DateTime today = DateTime.now();
List<String> upcomingDaysName = getUpcomingDaysNames(today);
List<String> upcomingDays = getUpcomingDays(today);
 // Output: [Tuesday, Wednesday, Thursday, Friday, Saturday]
