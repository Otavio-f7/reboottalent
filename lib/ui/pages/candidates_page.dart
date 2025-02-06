import 'package:flutter/material.dart';

class CandidatesPage extends StatefulWidget {
  const CandidatesPage({super.key});

  @override
  State<CandidatesPage> createState() => _CandidatesPageState();
}

class _CandidatesPageState extends State<CandidatesPage> {
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
                  icon: Icon(Icons.filter_alt)),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (ctx, i){
                return SizedBox(
                  height: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        child: Card(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                          child: const Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.radio_button_checked),
                              SizedBox(width: 15,),
                              Text('Nome da etapa'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 200,
                          child: Card(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                            child: const Text('data'),
                          ),
                        ),
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