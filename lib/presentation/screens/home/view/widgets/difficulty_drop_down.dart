import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/presentation/screens/home/view_model/home_view_model.dart';

class DifficultyDropDown extends StatelessWidget {
  const DifficultyDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final state = viewModel.state;

    return DropdownButton<int>(
      items: [
        ...state.difficulties
            .map((difficulty) => DropdownMenuItem<int>(
                  value: difficulty.id,
                  child: Text(difficulty.title),
                ))
            .toList(),
      ],
      onChanged: (value) {
        viewModel.changeDifficulty(value!);
      },
      value: state.selectedDifficultyId,
    );
  }
}
