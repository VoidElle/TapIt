import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tapit/global/utils/global_constants.dart';

class NewGameOnlineJoinLobbyPin extends StatelessWidget {

  final List<TextEditingController> textEditingControllers;

  NewGameOnlineJoinLobbyPin({
    required this.textEditingControllers,
    super.key,
  });

  final List<Widget> _pinInputs = [];
  final List<FocusNode> _focusNodes = List.generate(6, (int _) => FocusNode());

  Widget _buildSinglePinInput(int index) {
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
        child: TextFormField(
          controller: textEditingControllers[index],
          onChanged: (String? value) {

            // Get the current focus
            final FocusScopeNode currentFocus = FocusScope.of(GlobalConstants.navigatorKey.currentContext!);

            // If index+1 overflows the focus nodes list,
            // cancel the next focus and close the keyboard
            if (index+1 >= _focusNodes.length) {
              currentFocus.unfocus();
              return;
            }

            // Request focus of the new FormTextField
            currentFocus.requestFocus(_focusNodes[index+1]);

          },
          focusNode: _focusNodes[index],
          textAlign: TextAlign.center,
          maxLength: 1,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            height: .95,
            fontFamily: "CircularStd",
            fontWeight: FontWeight.w900,
            fontSize: 40,
            color: Color(0xFF000000),
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: "",
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    for (int i = 0; i < 6; i++) {
      _pinInputs.add(_buildSinglePinInput(i));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        2,
        (int index) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _pinInputs.getRange(index == 0 ? 0 : 3, index == 0 ? 3 : 6).toList(),
        ),
      ),
    )
        .animate()
        .fadeIn(
          delay: const Duration(milliseconds: 100),
        )
        .slideX(
          delay: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
  }

}
