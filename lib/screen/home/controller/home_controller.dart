import 'package:gemini_ai_app/screen/history/model/history_model.dart';
import 'package:gemini_ai_app/utils/database_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../utils/api_helper.dart';
import '../model/home_model.dart';

class HomeController extends GetxController {
  RxList<HistoryModel> questionList = <HistoryModel>[].obs;
  Rxn<HomeModel> homeModel = Rxn<HomeModel>();
  RxBool isLoad = false.obs;
  RxBool isUser = false.obs;

  Future<void> getData(String qu) async {
    isLoad.value = true;
    homeModel.value = await APIHelper.helper.getData(qu);
    HistoryModel h1 = HistoryModel(
      question: qu,
      ans: homeModel.value!.candidates![0].content!.parts![0].text,
    );
    questionList.add(h1);
    print(questionList);
    DataBaseHelper.dataBaseHelper.addData(h1);
    isLoad.value = false;
  }
}
