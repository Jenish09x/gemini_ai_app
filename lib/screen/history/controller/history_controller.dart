import 'package:gemini_ai_app/screen/history/model/history_model.dart';
import 'package:get/get.dart';

import '../../../utils/database_helper.dart';

class HistoryController extends GetxController
{
  RxList<HistoryModel> historyList = <HistoryModel>[].obs;

  Future<void> getData()
  async {
    historyList.value = await DataBaseHelper.dataBaseHelper.readData();
  }
}