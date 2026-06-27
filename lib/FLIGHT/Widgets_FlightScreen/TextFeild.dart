import 'package:flutter/material.dart';

class TicketTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool isDateField;

  const TicketTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.isDateField = false,
  });

  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      controller.text =
      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: TextField(
        controller: controller,
        readOnly: isDateField,

        onTap: isDateField ? () => _pickDate(context) : null, // 🔥 هنا أهم تعديل

        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),

        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,

          prefixIcon: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.blue,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}