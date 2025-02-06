
import 'package:flutter/material.dart';

class CandidateCard extends StatefulWidget {
  const CandidateCard({super.key, required this.usecolor});

  final Color usecolor;

  @override
  State<CandidateCard> createState() => _CandidateCardState();
}

class _CandidateCardState extends State<CandidateCard> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        color: widget.usecolor.withOpacity(0.2),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, i) {
            return SizedBox(
              height: 100,
              width: 192,
              child: Card(
                color: widget.usecolor.withOpacity(0.6),
                child: const Text('data')),
            );
          }
        ),
      ),
    );
  }
}