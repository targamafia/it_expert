import 'package:flutter/material.dart';

import '../../../style.dart';

class AnswerCardWidget extends StatefulWidget {
  final String id;
  final String answer;
  final bool isSelected;
  final VoidCallback onSelect;
  final String letter;

  const AnswerCardWidget(
      {Key? key,
      required this.id,
      required this.answer,
      required this.isSelected,
      required this.onSelect,
      required this.letter})
      : super(key: key);

  @override
  State<AnswerCardWidget> createState() => _AnswerCardWidgetState();
}

class _AnswerCardWidgetState extends State<AnswerCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onSelect,
      child: Stack(
        children: [
          if (widget.isSelected)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              color: Theme.of(context).primaryColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.letter})",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  Flexible(
                    child: Text(
                      " ${widget.answer}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          if (!widget.isSelected)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.letter})"),
                  Flexible(
                    child: Text(" ${widget.answer}"),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
