import 'package:flutter/material.dart';
import 'TextTicket.dart';

class ButtonPassenger extends StatefulWidget {
  const ButtonPassenger({super.key});

  @override
  State<ButtonPassenger> createState() => _ButtonPassengerState();
}

class _ButtonPassengerState extends State<ButtonPassenger> {
  int adultCount = 0;
  int childCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPassengerTile(
          title: 'Adult',
          subtitle: 'Age 15 or above',
          count: adultCount,
          onAdd: () => setState(() => adultCount++),
          onRemove: () {
            if (adultCount > 0) setState(() => adultCount--);
          },
        ),
        _buildPassengerTile(
          title: 'Child',
          subtitle: '2 - 10 years',
          count: childCount,
          onAdd: () => setState(() => childCount++),
          onRemove: () {
            if (childCount > 0) setState(() => childCount--);
          },
        ),
      ],
    );
  }

  Widget _buildPassengerTile({
    required String title,
    required String subtitle,
    required int count,
    required VoidCallback onAdd,
    required VoidCallback onRemove,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// LEFT SIDE
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTicket(
                name: title,
                size: 20,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          /// RIGHT SIDE COUNTER
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            child: Row(
              children: [

                _circleButton(
                  icon: Icons.remove,
                  onTap: onRemove,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    '$count',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                _circleButton(
                  icon: Icons.add,
                  onTap: onAdd,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          icon,
          size: 18,
          color: Colors.blue,
        ),
      ),
    );
  }
}