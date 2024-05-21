import 'package:get/get.dart';

import '../../../utils/api_helper.dart';
import '../model/home_model.dart';

class HomeController extends GetxController {
  // Rxn<HomeModel>  homeModel = homeModel.obs as Rxn<HomeModel>;
  // RxList questionList = [].obs;
  Rxn<HomeModel> homeModel = Rxn<HomeModel>();

  Future getData(String? qu) async {
    homeModel.value = await APIHelper.helper.getData(qu!);
  }
}
