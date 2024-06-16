import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoritesMealProvider extends StateNotifier<List<Meal>> {
  FavoritesMealProvider() : super([]);

  bool toggleMealFavoriteStatus(Meal meal){
    final mealsInFavorite = state.contains(meal);

    if(mealsInFavorite){
      state = state.where((m)=> m.id != meal.id).toList();
      return false;
    }else{
      state = [...state, meal];
      return true;
    }
  }
}

final favoritesMealProvider = StateNotifierProvider<FavoritesMealProvider,List<Meal>>((ref){
  return FavoritesMealProvider();
});