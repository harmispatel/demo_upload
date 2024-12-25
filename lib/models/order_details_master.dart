class OrderDetailsMaster {
  bool? _status;
  int? _statusCode;
  String? _message;
  OrderDetailsData? _data;

  OrderDetailsMaster(
      {bool? status, int? statusCode, String? message, OrderDetailsData? data}) {
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
  OrderDetailsData? get data => _data;
  set data(OrderDetailsData? data) => _data = data;

  OrderDetailsMaster.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _statusCode = json['status_code'];
    _message = json['message'];
    _data = json['data'] != null ? new OrderDetailsData.fromJson(json['data']) : null;
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

class OrderDetailsData {
  String? _activeStatus;
  String? _paymentMethod;
  int? _orderId;
  String? _orderNumber;
  String? _finalTotal;
  CustomerDetails? _customerDetails;
  List<OrderItem>? _orderItem;

  OrderDetailsData(
      {String? activeStatus,
        String? paymentMethod,
        int? orderId,
        String? orderNumber,
        String? finalTotal,
        CustomerDetails? customerDetails,
        List<OrderItem>? orderItem}) {
    if (activeStatus != null) {
      this._activeStatus = activeStatus;
    }
    if (paymentMethod != null) {
      this._paymentMethod = paymentMethod;
    }
    if (orderId != null) {
      this._orderId = orderId;
    }
    if (orderNumber != null) {
      this._orderNumber = orderNumber;
    }
    if (finalTotal != null) {
      this._finalTotal = finalTotal;
    }
    if (customerDetails != null) {
      this._customerDetails = customerDetails;
    }
    if (orderItem != null) {
      this._orderItem = orderItem;
    }
  }

  String? get activeStatus => _activeStatus;
  set activeStatus(String? activeStatus) => _activeStatus = activeStatus;
  String? get paymentMethod => _paymentMethod;
  set paymentMethod(String? paymentMethod) => _paymentMethod = paymentMethod;
  int? get orderId => _orderId;
  set orderId(int? orderId) => _orderId = orderId;
  String? get orderNumber => _orderNumber;
  set orderNumber(String? orderNumber) => _orderNumber = orderNumber;
  String? get finalTotal => _finalTotal;
  set finalTotal(String? finalTotal) => _finalTotal = finalTotal;
  CustomerDetails? get customerDetails => _customerDetails;
  set customerDetails(CustomerDetails? customerDetails) =>
      _customerDetails = customerDetails;
  List<OrderItem>? get orderItem => _orderItem;
  set orderItem(List<OrderItem>? orderItem) => _orderItem = orderItem;

  OrderDetailsData.fromJson(Map<String, dynamic> json) {
    _activeStatus = json['active_status'];
    _paymentMethod = json['payment_method'];
    _orderId = json['order_id'];
    _orderNumber = json['order_number'];
    _finalTotal = json['final_total'];
    _customerDetails = json['customer_details'] != null
        ? new CustomerDetails.fromJson(json['customer_details'])
        : null;
    if (json['order_item'] != null) {
      _orderItem = <OrderItem>[];
      json['order_item'].forEach((v) {
        _orderItem!.add(new OrderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active_status'] = this._activeStatus;
    data['payment_method'] = this._paymentMethod;
    data['order_id'] = this._orderId;
    data['order_number'] = this._orderNumber;
    data['final_total'] = this._finalTotal;
    if (this._customerDetails != null) {
      data['customer_details'] = this._customerDetails!.toJson();
    }
    if (this._orderItem != null) {
      data['order_item'] = this._orderItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerDetails {
  int? _customerId;
  String? _name;
  String? _mobile;
  String? _address;
  String? _latitude;
  String? _longitude;

  CustomerDetails(
      {int? customerId,
        String? name,
        String? mobile,
        String? address,
        String? latitude,
        String? longitude}) {
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (name != null) {
      this._name = name;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (address != null) {
      this._address = address;
    }
    if (latitude != null) {
      this._latitude = latitude;
    }
    if (longitude != null) {
      this._longitude = longitude;
    }
  }

  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get latitude => _latitude;
  set latitude(String? latitude) => _latitude = latitude;
  String? get longitude => _longitude;
  set longitude(String? longitude) => _longitude = longitude;

  CustomerDetails.fromJson(Map<String, dynamic> json) {
    _customerId = json['customer_id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this._customerId;
    data['name'] = this._name;
    data['mobile'] = this._mobile;
    data['address'] = this._address;
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    return data;
  }
}

class OrderItem {
  int? _sellerId;
  String? _sellerName;
  String? _storeName;
  String? _mobileNumber;
  String? _address;
  String? _latitude;
  String? _longitude;
  List<Item>? _item;

  OrderItem(
      {int? sellerId,
        String? sellerName,
        String? storeName,
        String? mobileNumber,
        String? address,
        String? latitude,
        String? longitude,
        List<Item>? item}) {
    if (sellerId != null) {
      this._sellerId = sellerId;
    }
    if (sellerName != null) {
      this._sellerName = sellerName;
    }
    if (storeName != null) {
      this._storeName = storeName;
    }
    if (mobileNumber != null) {
      this._mobileNumber = mobileNumber;
    }
    if (address != null) {
      this._address = address;
    }
    if (latitude != null) {
      this._latitude = latitude;
    }
    if (longitude != null) {
      this._longitude = longitude;
    }
    if (item != null) {
      this._item = item;
    }
  }

  int? get sellerId => _sellerId;
  set sellerId(int? sellerId) => _sellerId = sellerId;
  String? get sellerName => _sellerName;
  set sellerName(String? sellerName) => _sellerName = sellerName;
  String? get storeName => _storeName;
  set storeName(String? storeName) => _storeName = storeName;
  String? get mobileNumber => _mobileNumber;
  set mobileNumber(String? mobileNumber) => _mobileNumber = mobileNumber;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get latitude => _latitude;
  set latitude(String? latitude) => _latitude = latitude;
  String? get longitude => _longitude;
  set longitude(String? longitude) => _longitude = longitude;
  List<Item>? get item => _item;
  set item(List<Item>? item) => _item = item;

  OrderItem.fromJson(Map<String, dynamic> json) {
    _sellerId = json['seller_id'];
    _sellerName = json['seller_name'];
    _storeName = json['store_name'];
    _mobileNumber = json['mobile_number'];
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    if (json['item'] != null) {
      _item = <Item>[];
      json['item'].forEach((v) {
        _item!.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seller_id'] = this._sellerId;
    data['seller_name'] = this._sellerName;
    data['store_name'] = this._storeName;
    data['mobile_number'] = this._mobileNumber;
    data['address'] = this._address;
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    if (this._item != null) {
      data['item'] = this._item!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  String? _productName;
  int? _qty;
  String? _price;
  String? _discountedPrice;
  String? _image;

  Item(
      {String? productName,
        int? qty,
        String? price,
        String? discountedPrice,
        String? image}) {
    if (productName != null) {
      this._productName = productName;
    }
    if (qty != null) {
      this._qty = qty;
    }
    if (price != null) {
      this._price = price;
    }
    if (discountedPrice != null) {
      this._discountedPrice = discountedPrice;
    }
    if (image != null) {
      this._image = image;
    }
  }

  String? get productName => _productName;
  set productName(String? productName) => _productName = productName;
  int? get qty => _qty;
  set qty(int? qty) => _qty = qty;
  String? get price => _price;
  set price(String? price) => _price = price;
  String? get discountedPrice => _discountedPrice;
  set discountedPrice(String? discountedPrice) =>
      _discountedPrice = discountedPrice;
  String? get image => _image;
  set image(String? image) => _image = image;

  Item.fromJson(Map<String, dynamic> json) {
    _productName = json['product_name'];
    _qty = json['qty'];
    _price = json['price'];
    _discountedPrice = json['discounted_price'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this._productName;
    data['qty'] = this._qty;
    data['price'] = this._price;
    data['discounted_price'] = this._discountedPrice;
    data['image'] = this._image;
    return data;
  }
}
