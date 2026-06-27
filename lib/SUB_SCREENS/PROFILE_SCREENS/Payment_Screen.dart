import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  int selected = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    )..forward();

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slide = Tween(
      begin: const Offset(0, .12),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(

      body: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,

          child: Container(
            width: double.infinity,

            decoration: BoxDecoration(
              gradient: isDark
                  ? null
                  : LinearGradient(
                colors: [
                  Colors.blue.shade50,
                  Colors.purple.shade50,
                  Colors.pink.shade50,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),

            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: context.pop,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: colors.onSurface,
                          ),
                        ),

                        Expanded(
                          child: Text(
                            "Payment",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight:
                              FontWeight.bold,
                              color:
                              colors.onSurface,
                            ),
                          ),
                        ),

                        const SizedBox(width: 40),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Text(
                      "Choose Payment Method",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight:
                        FontWeight.bold,
                        color: colors.onSurface,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Select your preferred payment option",
                      style: TextStyle(
                        color:
                        colors.onSurfaceVariant,
                      ),
                    ),

                    const SizedBox(height: 28),

                    _paymentCard(
                      index: 0,
                      icon: Icons.credit_card,
                      title:
                      "Credit / Debit Card",
                      subtitle:
                      "Pay using Visa or MasterCard",
                    ),

                    const SizedBox(height: 16),

                    _paymentCard(
                      index: 1,
                      icon:
                      Icons.account_balance_wallet,
                      title: "Wallet",
                      subtitle:
                      "Pay using your wallet balance",
                    ),

                    const SizedBox(height: 16),

                    _paymentCard(
                      index: 2,
                      icon: Icons.paypal,
                      title: "PayPal",
                      subtitle:
                      "Pay using PayPal account",
                    ),

                    const Spacer(),

                    SizedBox(
                      width: double.infinity,

                      child: FilledButton(
                        style:
                        FilledButton.styleFrom(
                          padding:
                          const EdgeInsets
                              .symmetric(
                            vertical: 18,
                          ),
                        ),

                        onPressed: () {},

                        child: const Text(
                          "Continue",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _paymentCard({
    required int index,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final colors =
        Theme.of(context).colorScheme;

    final active = selected == index;

    return InkWell(
      borderRadius:
      BorderRadius.circular(20),

      onTap: () {
        setState(() {
          selected = index;
        });
      },

      child: AnimatedContainer(
        duration:
        const Duration(milliseconds: 250),

        padding:
        const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: active
              ? colors.primaryContainer
              : colors.surfaceContainer,

          borderRadius:
          BorderRadius.circular(20),

          border: Border.all(
            color: active
                ? colors.primary
                : Colors.transparent,
            width: 2,
          ),

          boxShadow: [
            BoxShadow(
              color:
              colors.shadow.withOpacity(
                .08,
              ),
              blurRadius: 12,
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              padding:
              const EdgeInsets.all(14),

              decoration: BoxDecoration(
                color:
                colors.primaryContainer,

                borderRadius:
                BorderRadius.circular(
                    16),
              ),

              child: Icon(
                icon,
                color: colors.primary,
                size: 28,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight:
                      FontWeight.bold,
                      fontSize: 17,
                      color:
                      colors.onSurface,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: TextStyle(
                      color: colors
                          .onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            AnimatedSwitcher(
              duration:
              const Duration(
                  milliseconds:
                  250),

              child: active
                  ? Icon(
                Icons.check_circle,
                key:
                const ValueKey(1),
                color:
                colors.primary,
              )
                  : Icon(
                Icons
                    .arrow_forward_ios,
                key:
                const ValueKey(2),
                color: colors
                    .onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}