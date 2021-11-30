import 'dart:async';

import 'package:final_app/model/history_model.dart';
import 'package:final_app/model/history_provider.dart';
import 'package:final_app/services/history_service.dart';

class HistoryController {
  final HistoryCalServices service ;
  List <History> history = List.empty();

StreamController<bool> onSyncController = 
  StreamController();

  HistoryController(this.service);
Stream<bool> get onSync => onSyncController.stream;


Future<List<History>> fecthistory() async {
  onSyncController.add(true);
  history = await service.gethistory();
  onSyncController.add(false);
  return history;
 } 
}