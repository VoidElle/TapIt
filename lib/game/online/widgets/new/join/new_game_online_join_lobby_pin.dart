import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NewGameOnlineJoinLobbyPin extends StatelessWidget {

  const NewGameOnlineJoinLobbyPin({super.key});

  Widget _buildSinglePinInput() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xFFD9D9D9),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.5)
          ),
          border: Border.all(
            color: Colors.black,
            width: 4.5,
          ),
        ),
        child: const TextField(
          textAlign: TextAlign.center,
          maxLength: 1,
          keyboardType: TextInputType.number,
          style: TextStyle(
            height: .95,
            fontFamily: "CircularStd",
            fontWeight: FontWeight.w900,
            fontSize: 40,
            color: Color(0xFF000000),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        2,
        (int index) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            3,
            (int index) => _buildSinglePinInput(),
          ),
        ),
      ),
    ).animate()
        .fadeIn(
      delay: const Duration(milliseconds: 100),
    )
        .slideX(
      delay: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

}
