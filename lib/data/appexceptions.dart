class AppExceptions implements Exception {

  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix]);

  String toString(){
    return '$_message$_prefix';
  }
 
}

class FetchdataException extends AppExceptions{
  FetchdataException([String? message]): super(message, 'Error during communication');
}

class BadrequestException extends AppExceptions{
  BadrequestException([String? message]): super(message, 'Invalid request');
}

class UnauthorisedException extends AppExceptions{
  UnauthorisedException([String? message]): super(message, 'Unauthorized request');
}

class InvalidinputException extends AppExceptions{
  InvalidinputException([String? message]): super(message, 'Invalid Input');
}