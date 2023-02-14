import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:working_with_bloc/data/api_service/api_service.dart';
import 'package:working_with_bloc/data/models/banking/banking_model.dart';
import 'package:working_with_bloc/data/models/my_response/my_response.dart';
import 'package:working_with_bloc/data/repositories/banking_repository.dart';

class IsolateApiCall extends StatefulWidget {
  const IsolateApiCall({Key? key}) : super(key: key);

  @override
  State<IsolateApiCall> createState() => _IsolateApiCallState();
}

class _IsolateApiCallState extends State<IsolateApiCall> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Isolate"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                final receiverPort = ReceivePort();
                await Isolate.spawn(
                  (Object? args) async {
                    MyResponse myResponse =
                        await BankingRepository(apiService: ApiService())
                            .getAllCards();
                    Isolate.exit(args as SendPort, myResponse);
                  },
                  receiverPort.sendPort,
                );
                MyResponse myResponse = await receiverPort.first as MyResponse;
                if (myResponse.error.isEmpty) {
                  debugPrint(
                      "DATA BORRRRR:${(myResponse.data as List<CardModel>)[0].bankName}");
                }else{
                  debugPrint(
                      "ERROR BORRRRR:${(myResponse.error)}");

                }
              },
              child: const Text("Get Cards")),
          ElevatedButton(
              onPressed: () async {
                for (int i = 1; i < 10; i++) {
                  await Future.delayed(const Duration(seconds: 1));
                  setState(() {
                    text = (10 - i).toString();
                  });
                }
              },
              child: Text("Do another task :$text")),
        ],
      ),
    );
  }
}
