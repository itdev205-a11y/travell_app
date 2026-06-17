import 'package:flutter/material.dart';
import '../../../../Services/convertCurrency.dart';
import '../../../PROFILE/WIDGETS/TextHeadScreens .dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  bool isLoading = false;

  final TextEditingController amountController = TextEditingController();

  String fromCurrency = "USD";
  String toCurrency = "EUR";

  double? result;

  List<String> currencies = ["USD", "EUR", "GBP", "JPY"];

  Future<void> convert() async {
    if (amountController.text.isEmpty) return;

    setState(() {
      isLoading = true;
      result = null;
    });

    try {
      final amount = double.parse(amountController.text);

      final value = await convertCurrency(
        fromCurrency,
        toCurrency,
        amount,
      );

      setState(() {
        result = value;
      });
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextHeadScreens(
                text: 'Currency Converter',
                size: 32,
              ),

              const SizedBox(height: 20),

              // Amount input
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Amount",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              // From currency
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("From:"),
                  DropdownButton<String>(
                    value: fromCurrency,
                    items: currencies
                        .map((c) => DropdownMenuItem(
                      value: c,
                      child: Text(c),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        fromCurrency = value!;
                      });
                    },
                  ),
                ],
              ),

              // To currency
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("To:"),
                  DropdownButton<String>(
                    value: toCurrency,
                    items: currencies
                        .map((c) => DropdownMenuItem(
                      value: c,
                      child: Text(c),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        toCurrency = value!;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Convert button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : convert,
                  child: isLoading
                      ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : const Text("Convert"),
                ),
              ),

              const SizedBox(height: 20),

              // Result
              if (result != null)
                Text(
                  "Result: $result $toCurrency",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}