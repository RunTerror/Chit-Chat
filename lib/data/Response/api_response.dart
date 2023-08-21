import 'package:chit_chat/data/Response/status.dart';

class ApiResponses<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponses(this.status, this.data, this.message);

  ApiResponses.loading(): status=Status.loading;
  ApiResponses.completed(): status=Status.completed;
  ApiResponses.error(): status=Status.error;


  
}