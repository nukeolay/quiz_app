import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/presentation/screens/home/view_model/home_view_model.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final state = viewModel.state;

    return DropdownButton<int>(
      items: [
        ...state.categories
            .map((category) => DropdownMenuItem<int>(
                  value: category.id,
                  child: Text(category.title),
                ))
            .toList(),
      ],
      onChanged: (value) {
        viewModel.changeCategory(value!);
      },
      value: state.selectedCategoryId,
    );
  }
}
