import 'package:flutter/material.dart';
import 'package:reboottalent/data/repositories/list_steps.dart';
import 'package:reboottalent/ui/widgets/candidate_card.dart';

class SelectionProcessPage extends StatefulWidget {
  const SelectionProcessPage({super.key});

  @override
  State<SelectionProcessPage> createState() => _SelectionProcessPageState();
}

class _SelectionProcessPageState extends State<SelectionProcessPage> {
  final steps = ListSteps().getsteps;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Card(
                child: IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.filter_alt)),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: steps.length,
              shrinkWrap: true,
              itemBuilder: (ctx, i){
                return SizedBox(
                  height: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        child: Card(
                          color: steps[i].color.withOpacity(0.6),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(width: 10,),
                              const Icon(Icons.radio_button_checked),
                              const SizedBox(width: 15,),
                              Text(steps[i].name),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: CandidateCard(usecolor: steps[i].color)
                      ),
                    ],
                  ),
                );
              }),
          )
        ],
      ),
    );
  }
}