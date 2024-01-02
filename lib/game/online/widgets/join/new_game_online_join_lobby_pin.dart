import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tapit/global/utils/global_constants.dart';

class NewGameOnlineJoinLobbyPin extends StatefulWidget {

  final List<TextEditingController> textEditingControllers;

  const NewGameOnlineJoinLobbyPin({
    required this.textEditingControllers,
    super.key,
  });

  @override
  State<NewGameOnlineJoinLobbyPin> createState() => _NewGameOnlineJoinLobbyPinState();
}

class _NewGameOnlineJoinLobbyPinState extends State<NewGameOnlineJoinLobbyPin> {

  static const int _pinSize = 6;

  final List<Widget> _pinInputs = [];
  final List<FocusNode> _focusNodes = List.generate(_pinSize, (int _) => FocusNode());

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
          controller: widget.textEditingControllers[index],
          onChanged: (String? value) {

            // Get the current focus
            final FocusScopeNode currentFocus = FocusScope.of(GlobalConstants.navigatorKey.currentContext!);

            // If index+1 overflows the focus nodes list, or if the user removes the first inserted number
            // cancel the next focus and close the keyboard
            final bool unfocusOnStartPinPut = (index-1 < 0 && value == "");
            final bool unfocusOnEndPinPut = (index+1 >= _focusNodes.length && value != "");
            if (unfocusOnStartPinPut || unfocusOnEndPinPut) {
              currentFocus.unfocus();
              return;
            }

            // If the value is empty, it means that the player deleted the current number
            // so redirect his focus to the previous focus node (index-1), if not it means the user
            // put a number, so redirect his focus to the next focus node (index+1)
            currentFocus.requestFocus(_focusNodes[
                value != null && value != ""
                    ? index + 1
                    : index - 1
            ]);

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
  void initState() {

    for (int i = 0; i < _pinSize; i++) {
      _pinInputs.add(_buildSinglePinInput(i));
    }

    super.initState();
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
