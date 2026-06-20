import 'package:flutter/material.dart';

class AmountBox extends StatefulWidget {
  const AmountBox({super.key});

  @override
  State<AmountBox> createState() => _AmountBoxState();
}

class _AmountBoxState extends State<AmountBox> {
  final TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 120,

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,


        children: [

          SizedBox(height: 15,),

          Text("ENTER AMOUNT",
            style: TextTheme.of(context).labelLarge
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                const Text(
                  "",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  width: 180,
                  child: TextField(
                    controller: amountController,

                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),

                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),

                    decoration: const InputDecoration(
                      hintText: "৳0.00",

                      hintStyle: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),

                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}