/*
{
count: 10,
start: 25,
total: 250,
subjects: [
{
rating: {
max: 10,
average: 9.1,
details: {

},
stars: "45",
min: 0
},
genres: [
"剧情",
"动作",
"科幻"
],
title: "蝙蝠侠：黑暗骑士",
casts: [
{
avatars: {
small: "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1004.webp",
large: "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1004.webp",
medium: "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1004.webp"
},
name_en: "Christian Bale",
name: "克里斯蒂安·贝尔",
alt: "https://movie.douban.com/celebrity/1005773/",
id: "1005773"
},
{
avatars: {
small: "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p13801.webp",
large: "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p13801.webp",
medium: "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p13801.webp"
},
name_en: "Heath Ledger",
name: "希斯·莱杰",
alt: "https://movie.douban.com/celebrity/1006957/",
id: "1006957"
},
{
avatars: {
small: "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p522.webp",
large: "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p522.webp",
medium: "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p522.webp"
},
name_en: "Aaron Eckhart",
name: "艾伦·艾克哈特",
alt: "https://movie.douban.com/celebrity/1053577/",
id: "1053577"
}
],
durations: [
"152分钟"
],
collect_count: 813292,
mainland_pubdate: "",
has_video: true,
original_title: "The Dark Knight",
subtype: "movie",
directors: [
{
avatars: {
small: "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p673.webp",
large: "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p673.webp",
medium: "http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p673.webp"
},
name_en: "Christopher Nolan",
name: "克里斯托弗·诺兰",
alt: "https://movie.douban.com/celebrity/1054524/",
id: "1054524"
}
],
pubdates: [
"2008-07-14(纽约首映)",
"2008-07-18(美国)"
],
year: "2008",
images: {
small: "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p462657443.webp",
large: "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p462657443.webp",
medium: "http://img1.doubanio.com/view/photo/s_ratio_poster/public/p462657443.webp"
},
alt: "https://movie.douban.com/subject/1851857/",
id: "1851857"
}],
title: "豆瓣电影Top250"
}
 */
class MovelBean {
  String title;
  int count;
  int start;
  int total;
  List<SubjectsListBean> subjects;

  MovelBean({this.title, this.count, this.start, this.total, this.subjects});

  MovelBean.fromJson(Map<String, dynamic> json) {    
    this.title = json['title'];
    this.count = json['count'];
    this.start = json['start'];
    this.total = json['total'];
    this.subjects = (json['subjects'] as List)!=null?(json['subjects'] as List).map((i) => SubjectsListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['count'] = this.count;
    data['start'] = this.start;
    data['total'] = this.total;
    data['subjects'] = this.subjects != null?this.subjects.map((i) => i.toJson()).toList():null;
    return data;
  }

}

class SubjectsListBean {
  String title;
  String mainlandPubdate;
  String originalTitle;
  String subtype;
  String year;
  String alt;
  String id;
  bool hasVideo;
  int collectCount;
  ImagesBean images;
  RatingBean rating;
  List<String> durations;
  List<String> genres;
  List<String> pubdates;
  List<CastsListBean> casts;
  List<DirectorsListBean> directors;

  SubjectsListBean({this.title, this.mainlandPubdate, this.originalTitle, this.subtype, this.year, this.alt, this.id, this.hasVideo, this.collectCount, this.images, this.rating, this.casts, this.directors, this.durations, this.genres, this.pubdates});

  SubjectsListBean.fromJson(Map<String, dynamic> json) {    
    this.title = json['title'];
    this.mainlandPubdate = json['mainland_pubdate'];
    this.originalTitle = json['original_title'];
    this.subtype = json['subtype'];
    this.year = json['year'];
    this.alt = json['alt'];
    this.id = json['id'];
    this.hasVideo = json['has_video'];
    this.collectCount = json['collect_count'];
    this.images = json['images'] != null ? ImagesBean.fromJson(json['images']) : null;
    this.rating = json['rating'] != null ? RatingBean.fromJson(json['rating']) : null;
    this.casts = (json['casts'] as List)!=null?(json['casts'] as List).map((i) => CastsListBean.fromJson(i)).toList():null;
    this.directors = (json['directors'] as List)!=null?(json['directors'] as List).map((i) => DirectorsListBean.fromJson(i)).toList():null;

    List<dynamic> durationsList = json['durations'];
    this.durations = new List();
    this.durations.addAll(durationsList.map((o) => o.toString()));

    List<dynamic> genresList = json['genres'];
    this.genres = new List();
    this.genres.addAll(genresList.map((o) => o.toString()));

    List<dynamic> pubdatesList = json['pubdates'];
    this.pubdates = new List();
    this.pubdates.addAll(pubdatesList.map((o) => o.toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['mainland_pubdate'] = this.mainlandPubdate;
    data['original_title'] = this.originalTitle;
    data['subtype'] = this.subtype;
    data['year'] = this.year;
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['has_video'] = this.hasVideo;
    data['collect_count'] = this.collectCount;
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['casts'] = this.casts != null?this.casts.map((i) => i.toJson()).toList():null;
    data['directors'] = this.directors != null?this.directors.map((i) => i.toJson()).toList():null;
    data['durations'] = this.durations;
    data['genres'] = this.genres;
    data['pubdates'] = this.pubdates;
    return data;
  }
}

class ImagesBean {
  String small;
  String large;
  String medium;

  ImagesBean({this.small, this.large, this.medium});

  ImagesBean.fromJson(Map<String, dynamic> json) {    
    this.small = json['small'];
    this.large = json['large'];
    this.medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}

class RatingBean {
  String stars;
  double average;
  int max;
  int min;
  DetailsBean details;

  RatingBean({this.stars, this.average, this.max, this.min, this.details});

  RatingBean.fromJson(Map<String, dynamic> json) {    
    this.stars = json['stars'];
    this.average = json['average'];
    this.max = json['max'];
    this.min = json['min'];
    this.details = json['details'] != null ? DetailsBean.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stars'] = this.stars;
    data['average'] = this.average;
    data['max'] = this.max;
    data['min'] = this.min;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    return data;
  }
}

class CastsListBean {
  String nameEn;
  String name;
  String alt;
  String id;
  AvatarsBean avatars;

  CastsListBean({this.nameEn, this.name, this.alt, this.id, this.avatars});

  CastsListBean.fromJson(Map<String, dynamic> json) {    
    this.nameEn = json['name_en'];
    this.name = json['name'];
    this.alt = json['alt'];
    this.id = json['id'];
    this.avatars = json['avatars'] != null ? AvatarsBean.fromJson(json['avatars']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_en'] = this.nameEn;
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    return data;
  }
}

class DirectorsListBean {
  String nameEn;
  String name;
  String alt;
  String id;
  AvatarsBean avatars;

  DirectorsListBean({this.nameEn, this.name, this.alt, this.id, this.avatars});

  DirectorsListBean.fromJson(Map<String, dynamic> json) {    
    this.nameEn = json['name_en'];
    this.name = json['name'];
    this.alt = json['alt'];
    this.id = json['id'];
    this.avatars = json['avatars'] != null ? AvatarsBean.fromJson(json['avatars']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_en'] = this.nameEn;
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    return data;
  }
}

class AvatarsBean {
  String small;
  String large;
  String medium;

  AvatarsBean({this.small, this.large, this.medium});

  AvatarsBean.fromJson(Map<String, dynamic> json) {    
    this.small = json['small'];
    this.large = json['large'];
    this.medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}

class DetailsBean {

  DetailsBean();

  DetailsBean.fromJson(Map<String, dynamic> json) {    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
