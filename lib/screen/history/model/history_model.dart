class HistoryModel{
  String? question,ans;
  int? id;

  HistoryModel({this.question, this.ans,this.id});

  factory HistoryModel.mapToModel(Map m1)
  {
    return HistoryModel(question:m1['question'],id: m1['id'],ans: m1['ans'],);
  }
}