import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../PROFILE/Widgets_Profile/Widgets_Profilescreen/TextHeadScreens .dart';
import 'Services_ConvertCurrency/convertCurrency.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final TextEditingController amountController =
  TextEditingController();

  bool isLoading = false;

  String fromCurrency = 'USD';
  String toCurrency = 'EUR';

  double? result;

  final List<String> currencies = [
    'USD',
    'EUR',
    'GBP',
    'JPY',
  ];

  Future<void> convert() async {
    if (amountController.text.isEmpty) return;

    setState(() {
      isLoading = true;
      result = null;
    });

    try {
      final amount =
      double.parse(amountController.text);

      final value = await convertCurrency(
        fromCurrency,
        toCurrency,
        amount,
      );

      if (!mounted) return;

      setState(() {
        result = value;
      });
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const TextHeadScreens(
                      text: 'Currency Converter',
                      size: 32,
                    ),

                    Lottie.asset(
                      'assets/animations/Cryptocurrency Lottie Animation.json',
                      height: 130,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: amountController,
                keyboardType:
                TextInputType.number,
                decoration:
                const InputDecoration(
                  labelText: 'Amount',
                  border:
                  OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              _currencyDropdown(
                title: 'From:',
                value: fromCurrency,
                onChanged: (value) {
                  setState(() {
                    fromCurrency = value!;
                  });
                },
              ),

              const SizedBox(height: 10),

              _currencyDropdown(
                title: 'To:',
                value: toCurrency,
                onChanged: (value) {
                  setState(() {
                    toCurrency = value!;
                  });
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                  isLoading
                      ? null
                      : convert,
                  child:
                  isLoading
                      ? const SizedBox(
                    height: 20,
                    width: 20,
                    child:
                    CircularProgressIndicator(
                      strokeWidth:
                      2,
                    ),
                  )
                      : const Text(
                    'Convert',
                  ),
                ),
              ),

              const SizedBox(height: 24),

              if (result != null)
                Text(
                  'Result: '
                      '${result!.toStringAsFixed(2)} '
                      '$toCurrency',
                  style:
                  const TextStyle(
                    fontSize: 22,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currencyDropdown({
    required String title,
    required String value,
    required ValueChanged<String?> onChanged,
  }) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(title),

        DropdownButton<String>(
          value: value,
          items:
          currencies
              .map(
                (currency) =>
                DropdownMenuItem(
                  value:
                  currency,
                  child:
                  Text(
                    currency,
                  ),
                ),
          )
              .toList(),

          onChanged: onChanged,
        ),
      ],
    );
  }
}