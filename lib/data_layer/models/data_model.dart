class DataModel {
  SeoSettings? seoSettings;
  List<Deals>? deals;
  Event? event;

  DataModel({this.seoSettings, this.deals, this.event});

  DataModel.fromJson(Map<String, dynamic> json) {
    seoSettings = json['seo_settings'] != null
        ? new SeoSettings.fromJson(json['seo_settings'])
        : null;
    if (json['deals'] != null) {
      deals = <Deals>[];
      json['deals'].forEach((v) {
        deals!.add(new Deals.fromJson(v));
      });
    }
    event = json['event'] != null ? new Event.fromJson(json['event']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seoSettings != null) {
      data['seo_settings'] = this.seoSettings!.toJson();
    }
    if (this.deals != null) {
      data['deals'] = this.deals!.map((v) => v.toJson()).toList();
    }
    if (this.event != null) {
      data['event'] = this.event!.toJson();
    }
    return data;
  }
}

class SeoSettings {
  String? seoTitle;
  String? seoDescription;
  String? webUrl;

  SeoSettings({this.seoTitle, this.seoDescription, this.webUrl});

  SeoSettings.fromJson(Map<String, dynamic> json) {
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    webUrl = json['web_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['web_url'] = this.webUrl;
    return data;
  }
}

class Deals {
  int? commentsCount;
  String? createdAt;
  int? createdAtInMillis;
  String? imageMedium;

  Deals(
      {this.commentsCount,
      this.createdAt,
      this.createdAtInMillis,
      this.imageMedium});

  Deals.fromJson(Map<String, dynamic> json) {
    commentsCount = json['comments_count'];
    createdAt = json['created_at'];
    createdAtInMillis = json['created_at_in_millis'];
    imageMedium = json['image_medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comments_count'] = this.commentsCount;
    data['created_at'] = this.createdAt;
    data['created_at_in_millis'] = this.createdAtInMillis;
    data['image_medium'] = this.imageMedium;
    return data;
  }
}

class Event {
  int? id;
  String? imageUrl;
  String? pageUrl;

  Event({this.id, this.imageUrl, this.pageUrl});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    pageUrl = json['page_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['page_url'] = this.pageUrl;
    return data;
  }
}
