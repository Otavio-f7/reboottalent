import 'package:flutter/material.dart';
import 'package:reboottalent/domain/process_steps/process_steps_model.dart';

class ListSteps {
  final List<ProcessStepsModel> _steps =[
    ProcessStepsModel('Entrevista RH', Colors.blueAccent),
    ProcessStepsModel('Teste Técnico', Colors.amber),
    ProcessStepsModel('Entrevista Gestor', Colors.green),
    ProcessStepsModel('Entrevista Diretor', Colors.purple),
    ProcessStepsModel('Aprovado', Colors.blueGrey),
    ProcessStepsModel('Entrevista RH', Colors.blueAccent)
  ];

  List<ProcessStepsModel> get getsteps => [..._steps];
}