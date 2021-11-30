import 'package:final_app/controllers/history_controller.dart';
import 'package:final_app/model/history_model.dart';
import 'package:final_app/model/history_provider.dart';
import 'package:final_app/services/history_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HistoryServices? services;
  HistoryController? controller;
  List<History> historylist = List.empty();
  bool isLoading = false;

  void initState() {
    super.initState();

    gethistory();
    controller!.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
  }

  void gethistory() async {
    var newhistorylist = await controller!.fecthistory();

    setState(() {
      historylist = newhistorylist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
                strokeWidth: 5.0, color: Colors.grey.shade500),
          ):
         Scaffold(
            appBar: AppBar(title: Text("History")),
            body: Consumer<HistoryProvider>(builder: (context, show, child) {
              return ListView.separated(
                  itemCount: historylist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: Icon(
                          Icons.calculate,
                          color: Colors.white,
                        ),
                        title: Text(
                          historylist[index].number + "=",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        subtitle: Text(
                          historylist[index].equal,
                          style: TextStyle
                          (color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.right,
                        )
                      );
                  },
                  separatorBuilder: 
                  (context, index) => Divider());
                 }
              ),
          );
    }
}