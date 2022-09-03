class LeadListModel {
  int? status;
  String? message;
  int? locationTrackingFrequency;
  String? timeStamp;
  List<Details>? details;

  LeadListModel(
      {this.status,
        this.message,
        this.locationTrackingFrequency,
        this.timeStamp,
        this.details});

  LeadListModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    locationTrackingFrequency = json['LocationTrackingFrequency'];
    timeStamp = json['TimeStamp'];
    if (json['Details'] != null) {
      details = <Details>[];
      json['Details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    data['LocationTrackingFrequency'] = this.locationTrackingFrequency;
    data['TimeStamp'] = this.timeStamp;
    if (this.details != null) {
      data['Details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String? mobileNo1;
  String? mobileNo2;
  String? mobileNo3;
  String? emailId1;
  String? emailId2;
  String? emailId3;
  String? leadNo;
  String? type;
  int? id;
  String? name;
  String? image;

  Details(
      {this.mobileNo1,
        this.mobileNo2,
        this.mobileNo3,
        this.emailId1,
        this.emailId2,
        this.emailId3,
        this.leadNo,
        this.type,
        this.id,
        this.name,
        this.image});

  Details.fromJson(Map<String, dynamic> json) {
    mobileNo1 = json['MobileNo1'];
    mobileNo2 = json['MobileNo2'];
    mobileNo3 = json['MobileNo3'];
    emailId1 = json['EmailId1'];
    emailId2 = json['EmailId2'];
    emailId3 = json['EmailId3'];
    leadNo = json['LeadNo'];
    type = json['Type'];
    id = json['Id'];
    name = json['Name'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MobileNo1'] = this.mobileNo1;
    data['MobileNo2'] = this.mobileNo2;
    data['MobileNo3'] = this.mobileNo3;
    data['EmailId1'] = this.emailId1;
    data['EmailId2'] = this.emailId2;
    data['EmailId3'] = this.emailId3;
    data['LeadNo'] = this.leadNo;
    data['Type'] = this.type;
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Image'] = this.image;
    return data;
  }
}
