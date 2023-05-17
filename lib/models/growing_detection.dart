class Growingdetect {
  String? message;
  Response? response;

  Growingdetect({this.message, this.response});

  Growingdetect.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  String? solutionsInSinhala;
  String? solutionsInEnglish;

  Response({this.solutionsInSinhala, this.solutionsInEnglish});

  Response.fromJson(Map<String, dynamic> json) {
    solutionsInSinhala = json['SolutionsInSinhala'];
    solutionsInEnglish = json['SolutionsInEnglish'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SolutionsInSinhala'] = this.solutionsInSinhala;
    data['SolutionsInEnglish'] = this.solutionsInEnglish;
    return data;
  }
}
