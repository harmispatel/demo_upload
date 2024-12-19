class LoginMaster {
  bool? _status;
  int? _statusCode;
  String? _message;
  UserData? _data;

  LoginMaster({bool? status, int? statusCode, String? message, UserData? data}) {
    if (status != null) {
      this._status = status;
    }
    if (statusCode != null) {
      this._statusCode = statusCode;
    }
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
  }

  bool? get status => _status;
  set status(bool? status) => _status = status;
  int? get statusCode => _statusCode;
  set statusCode(int? statusCode) => _statusCode = statusCode;
  String? get message => _message;
  set message(String? message) => _message = message;
  UserData? get data => _data;
  set data(UserData? data) => _data = data;

  LoginMaster.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _statusCode = json['status_code'];
    _message = json['message'];
    _data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['status_code'] = this._statusCode;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class UserData {
  int? _userId;
  String? _mobile;
  String? _token;

  UserData({int? userId, String? mobile, String? token}) {
    if (userId != null) {
      this._userId = userId;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (token != null) {
      this._token = token;
    }
  }

  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get token => _token;
  set token(String? token) => _token = token;

  UserData.fromJson(Map<String, dynamic> json) {
    _userId = json['user_id'];
    _mobile = json['mobile'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this._userId;
    data['mobile'] = this._mobile;
    data['token'] = this._token;
    return data;
  }
}
