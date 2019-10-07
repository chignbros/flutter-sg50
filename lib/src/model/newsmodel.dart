class NewsModel {
  int id;
  String content;
  String secUser;
  String writer;
  String updateAt;
  String postDate;
  String subContent;
  String createAt;
  List<NewsImages> newsImages;
  String title;

  NewsModel(
      {this.id,
      this.content,
      this.secUser,
      this.writer,
      this.updateAt,
      this.postDate,
      this.subContent,
      this.createAt,
      this.newsImages,
      this.title});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    secUser = json['secUser'];
    writer = json['writer'];
    updateAt = json['updateAt'];
    postDate = json['postDate'];
    subContent = json['subContent'];
    createAt = json['createAt'];
    if (json['newsImages'] != null) {
      newsImages = new List<NewsImages>();
      json['newsImages'].forEach((v) {
        newsImages.add(new NewsImages.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['secUser'] = this.secUser;
    data['writer'] = this.writer;
    data['updateAt'] = this.updateAt;
    data['postDate'] = this.postDate;
    data['subContent'] = this.subContent;
    data['createAt'] = this.createAt;
    if (this.newsImages != null) {
      data['newsImages'] = this.newsImages.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    return data;
  }
}

class NewsImages {
  int id;
  String imageURL;
  int sequenceNumber;
  News news;

  NewsImages({this.id, this.imageURL, this.sequenceNumber, this.news});

  NewsImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageURL = json['imageURL'];
    sequenceNumber = json['sequenceNumber'];
    news = json['news'] != null ? new News.fromJson(json['news']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageURL'] = this.imageURL;
    data['sequenceNumber'] = this.sequenceNumber;
    if (this.news != null) {
      data['news'] = this.news.toJson();
    }
    return data;
  }
}

class News {
  int id;

  News({this.id});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
