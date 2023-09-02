class UserModel {
  String? token;
  String? name;
  String? number;
  String? userid;

  UserModel({required this.token,required this.name,required this.number,required this.userid});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name=json['name'];
    number=json['number'];
    userid=json['userid'];
  }

  Map<String, dynamic> toJson() {
     Map<String, dynamic> data = {};
    data['token'] = token;
    data['name']=name;
    data['number']=number;
    data['userid']=userid;
    
    return data;
  }
}

