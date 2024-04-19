import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_button.dart';
import 'package:aberno_test/features/common/presentation/widgets/w_text_fileld.dart';
import 'package:flutter/material.dart';

class InputReason extends StatefulWidget {
  final String title;
  const InputReason({required this.title, super.key});

  @override
  State<InputReason> createState() => _InputReasonState();
}

class _InputReasonState extends State<InputReason> {
  late TextEditingController reasonController;
  @override
  void initState() {
    super.initState();
    reasonController = TextEditingController();
  }

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.fromLTRB(
          20, 20, 20, MediaQuery.of(context).size.height * 0.35),
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      height: 280,
      child: Column(
        children: [
          Center(
            child: Text(
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          WTextField(
            controller: reasonController,
            onChanged: (value) {},
            title: "Опишите причину",
            hintText: "ssddvdvv",
            style: Theme.of(context).textTheme.titleMedium,
            titleStyle: Theme.of(context).textTheme.displaySmall,
          ),
          const Spacer(),
          WButton(
            onTap: () async {
              Navigator.pop(context);
            },
            text: "Отправить",
          ),
        ],
      ),
    );
  }
}
