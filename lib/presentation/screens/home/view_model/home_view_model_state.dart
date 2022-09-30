import 'package:quiz_app/domain/entities/category_entity.dart';
import 'package:quiz_app/domain/entities/difficulty_entity.dart';

class HomeViewModelState {
  final int selectedCategoryId;
  final int selectedDifficultyId;
  final List<Category> categories;
  final List<Difficulty> difficulties;
  final bool isLoading;
  final bool isError;

  HomeViewModelState({
    this.selectedCategoryId = 0,
    this.selectedDifficultyId = 0,
    this.categories = const [],
    this.difficulties = const [],
    this.isLoading = false,
    this.isError = false,
  });

  HomeViewModelState copyWith({
    int? selectedCategoryId,
    int? selectedDifficultyId,
    List<Category>? categories,
    List<Difficulty>? difficulties,
    bool? isLoading,
    bool? isError,
  }) {
    return HomeViewModelState(
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      selectedDifficultyId: selectedDifficultyId ?? this.selectedDifficultyId,
      categories: categories ?? this.categories,
      difficulties: difficulties ?? this.difficulties,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }
}
