class DashBoardMaster {
  bool? _status;
  int? _statusCode;
  String? _message;
  DashboardData? _data;

  DashBoardMaster(
      {bool? status, int? statusCode, String? message, DashboardData? data}) {
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
  DashboardData? get data => _data;
  set data(DashboardData? data) => _data = data;

  DashBoardMaster.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _statusCode = json['status_code'];
    _message = json['message'];
    _data = json['data'] != null ? new DashboardData.fromJson(json['data']) : null;
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

class DashboardData {
  String? _pending;
  String? _onTheWay;
  String? _delivered;
  String? _cancel;
  String? _walletAmount;

  DashboardData(
      {String? pending,
        String? onTheWay,
        String? delivered,
        String? cancel,
        String? walletAmount}) {
    if (pending != null) {
      this._pending = pending;
    }
    if (onTheWay != null) {
      this._onTheWay = onTheWay;
    }
    if (delivered != null) {
      this._delivered = delivered;
    }
    if (cancel != null) {
      this._cancel = cancel;
    }
    if (walletAmount != null) {
      this._walletAmount = walletAmount;
    }
  }

  String? get pending => _pending;
  set pending(String? pending) => _pending = pending;
  String? get onTheWay => _onTheWay;
  set onTheWay(String? onTheWay) => _onTheWay = onTheWay;
  String? get delivered => _delivered;
  set delivered(String? delivered) => _delivered = delivered;
  String? get cancel => _cancel;
  set cancel(String? cancel) => _cancel = cancel;
  String? get walletAmount => _walletAmount;
  set walletAmount(String? walletAmount) => _walletAmount = walletAmount;

  DashboardData.fromJson(Map<String, dynamic> json) {
    _pending = json['pending'];
    _onTheWay = json['on_the_way'];
    _delivered = json['delivered'];
    _cancel = json['cancel'];
    _walletAmount = json['wallet_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pending'] = this._pending;
    data['on_the_way'] = this._onTheWay;
    data['delivered'] = this._delivered;
    data['cancel'] = this._cancel;
    data['wallet_amount'] = this._walletAmount;
    return data;
  }
}
