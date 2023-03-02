import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../_init/components/appbar/custom_appbar.dart';
import '../../../_init/components/input/kz_edit_widgets.dart';
import '../../../_init/components/toggle_button/kz_toggle_button.dart';
import '../../../_init/themes/colors.dart';
import '../viewmodel/viewmodel_add_food_list.dart';

import '../model/food_model.dart';

class PageAddFoodList extends StatefulWidget {
  PageAddFoodList({Key? key}) : super(key: key);

  ViewModelAddFoodList vm = ViewModelAddFoodList();

  @override
  State<PageAddFoodList> createState() => _PageAddFoodListState();
}

class _PageAddFoodListState extends State<PageAddFoodList>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.vm.controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(length: 3, vsync: this);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            CustomAppBar(
              innerBoxIsScrolled,
              headerWidgets: [
                Text(
                  widget.vm.page_title,
                  style: context.textTheme.displayLarge,
                ),
              ],
              isBackButton: true,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: TabBar(
                  labelColor: ThemeColors.darkPurple,
                  controller: controller,
                  tabs: [
                    Tab(text: LocaleKeys.foodListPage_breakfast.tr()),
                    Tab(text: LocaleKeys.foodListPage_lunch.tr()),
                    Tab(text: LocaleKeys.foodListPage_dinner.tr()),
                  ],
                ),
              ),
              Container(
                height: 653.0,
                width: double.maxFinite,
                child: TabBarView(
                  controller: controller,
                  children: [
                    tabView(FoodTypes.breakfast),
                    tabView(FoodTypes.lunch),
                    tabView(FoodTypes.dinner),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabView(FoodTypes food) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            KzTextEdit(
              icon: Icons.breakfast_dining,
              controller: widget.vm.breakfastController,
              labelText: LocaleKeys.foodListPage_main_course.tr(),
              onSaved: (value) {},
            ),
            KzTextEdit(
              icon: Icons.local_fire_department_rounded,
              controller: widget.vm.breakfastController,
              labelText: LocaleKeys.foodListPage_calorie.tr(),
              onSaved: (value) {},
            ),
            KzTextEdit(
              icon: Icons.water_drop_outlined,
              controller: widget.vm.breakfastController,
              labelText: LocaleKeys.foodListPage_sweet.tr(),
              onSaved: (value) {},
            ),
            KzTextEdit(
              icon: Icons.local_drink_outlined,
              controller: widget.vm.breakfastController,
              labelText: LocaleKeys.foodListPage_drink.tr(),
              onSaved: (value) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: Text(LocaleKeys.pageGroup_save.tr()),
                  onPressed: () {
                    switch(food) {
                      case FoodTypes.breakfast:
                        //TODO Sabah kahvaltısı tab bölümü seçili olduğunda kayıt fonksiyonu (doldurulacak)
                        break;
                      case FoodTypes.lunch:
                        //TODO Öğle yemeği tab bölümü seçili olduğunda kayıt fonksiyonu (doldurulacak)
                        break;
                      case FoodTypes.dinner:
                        //TODO İkindi kahvaltısı tab bölümü seçili olduğunda kayıt fonksiyonu (doldurulacak)
                        break;

                      default:
                        break;
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
