class MessagesResponse {
  List<MessageData>? data;

  MessagesResponse({this.data});

  MessagesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MessageData>[];
      json['data'].forEach((v) {
        data!.add(MessageData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MessageData {
  String? createdAt;
  String? message;
  String? type;
  bool? ownMessage;
  CounterOffer? counterOffer;

  MessageData(
      {this.createdAt,
      this.message,
      this.type,
      this.ownMessage,
      this.counterOffer});

  MessageData.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    message = json['message'];
    type = json['type'];
    ownMessage = json['ownMessage'];
    counterOffer = json['counterOffer'] != null
        ? CounterOffer.fromJson(json['counterOffer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['message'] = message;
    data['type'] = type;
    data['ownMessage'] = ownMessage;
    if (counterOffer != null) {
      data['counterOffer'] = counterOffer!.toJson();
    }
    return data;
  }
}

class CounterOffer {
  String? banner;
  String? title;
  String? location;
  String? offered;
  List<String>? attachments;
  List<String>? actions;

  CounterOffer(
      {this.banner,
      this.title,
      this.location,
      this.offered,
      this.attachments,
      this.actions});

  CounterOffer.fromJson(Map<String, dynamic> json) {
    banner = json['banner'];
    title = json['title'];
    location = json['location'];
    offered = json['offered'];
    attachments = json['attachments'].cast<String>();
    actions = json['actions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner'] = banner;
    data['title'] = title;
    data['location'] = location;
    data['offered'] = offered;
    data['attachments'] = attachments;
    data['actions'] = actions;
    return data;
  }
}
