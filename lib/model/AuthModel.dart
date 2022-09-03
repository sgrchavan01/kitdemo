class AuthModel {
  int? status;
  String? message;
  int? locationTrackingFrequency;
  String? timeStamp;
  Details? details;

  AuthModel(
      {this.status,
        this.message,
        this.locationTrackingFrequency,
        this.timeStamp,
        this.details});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    locationTrackingFrequency = json['LocationTrackingFrequency'];
    timeStamp = json['TimeStamp'];
    details =
    json['Details'] != null ? new Details.fromJson(json['Details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    data['LocationTrackingFrequency'] = this.locationTrackingFrequency;
    data['TimeStamp'] = this.timeStamp;
    if (this.details != null) {
      data['Details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  int? token;
  String? eMail;
  String? fName;
  String? lName;
  String? mobile;
  String? timezone;

  Details(
      {this.token,
        this.eMail,
        this.fName,
        this.lName,
        this.mobile,
        this.timezone});

  Details.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    eMail = json['EMail'];
    fName = json['FName'];
    lName = json['LName'];
    mobile = json['Mobile'];
    timezone = json['Timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Token'] = this.token;
    data['EMail'] = this.eMail;
    data['FName'] = this.fName;
    data['LName'] = this.lName;
    data['Mobile'] = this.mobile;
    data['Timezone'] = this.timezone;
    return data;
  }
}
