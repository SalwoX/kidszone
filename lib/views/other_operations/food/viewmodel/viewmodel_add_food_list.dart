import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../_init/view_model/base_view_model.dart';
import '../model/food_model.dart';
import '../service/repository_food.dart';
import 'package:mobx/mobx.dart';

part 'viewmodel_add_food_list.g.dart';

class ViewModelAddFoodList = _ViewModelAddFoodListBase
    with _$ViewModelAddFoodList;

abstract class _ViewModelAddFoodListBase
    extends BaseViewModel<FoodModel, RepositoryFood> with Store {
  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;

  var page_title = "Yemek Listesi Ekle";

  TabController? controller;

  TextEditingController breakfastController = TextEditingController();
  TextEditingController breakfastCalorieController = TextEditingController();
  TextEditingController breakfastDrinkController = TextEditingController();
  TextEditingController breakfastSweetController = TextEditingController();
}

enum FoodTypes {
  breakfast,
  lunch,
  dinner,
}
