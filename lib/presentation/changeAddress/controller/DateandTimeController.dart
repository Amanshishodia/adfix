import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../summary/widgets/dateButton.dart';
import '../../summary/widgets/timeButton.dart';

class DateTimeController extends GetxController {
  var selectedDate = Rx<DateTime?>(null);
  var selectedTime = RxString('');

  final List<DateTime> availableDates = List.generate(
    4,
    (index) => DateTime.now().add(Duration(days: index)),
  );

  final List<String> timeSlots = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM',
    '07:00 PM',
    '08:00 PM',
  ];

  void setDate(DateTime date) {
    selectedDate.value = date;
  }

  void setTime(String time) {
    selectedTime.value = time;
  }

  bool isDateSelected(DateTime date) {
    return selectedDate.value?.year == date.year &&
        selectedDate.value?.month == date.month &&
        selectedDate.value?.day == date.day;
  }

  bool isTimeSelected(String time) {
    return selectedTime.value == time;
  }
}

class DateTimeSelectionSection extends StatelessWidget {
  const DateTimeSelectionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "When should the professional arrive?",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          "Your service will take approx. 1hr and 30 mins",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
        const DateSelectionRow(),
        const SizedBox(height: 24),
        const Text(
          "Choose your preferred time slot",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        const TimeSelectionGrid(),
      ],
    );
  }
}

class DateSelectionRow extends GetView<DateTimeController> {
  const DateSelectionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: controller.availableDates.map((date) {
          return Obx(() => DateButton(
                date: date,
                isSelected: controller.isDateSelected(date),
                onTap: () => controller.setDate(date),
              ));
        }).toList(),
      ),
    );
  }
}

class TimeSelectionGrid extends GetView<DateTimeController> {
  const TimeSelectionGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: controller.timeSlots.length,
      itemBuilder: (context, index) {
        final timeSlot = controller.timeSlots[index];
        return Obx(() => TimeButton(
              time: timeSlot,
              isSelected: controller.isTimeSelected(timeSlot),
              onTap: () => controller.setTime(timeSlot),
            ));
      },
    );
  }
}
