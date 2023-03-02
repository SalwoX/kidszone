import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../_init/view_model/base_view_model.dart';
import '../model/food_model.dart';
import '../service/repository_food.dart';

part 'viewmodel_food_list.g.dart';

class ViewModelFoodList = _ViewModelFoodListBase with _$ViewModelFoodList;

abstract class _ViewModelFoodListBase extends BaseViewModel<FoodModel, RepositoryFood> with Store{

  @override
  void setContext(BuildContext ctx) => this.ctx = ctx;
}