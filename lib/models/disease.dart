class Diseasedetect {
  String? message;
  Disease? disease;

  Diseasedetect({this.message, this.disease});

  Diseasedetect.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    disease =
    json['disease'] != null ? new Disease.fromJson(json['disease']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.disease != null) {
      data['disease'] = this.disease!.toJson();
    }
    return data;
  }
}

class Disease {
  String? diseaseNameSinhala;
  String? diseaseNameEnglish;
  String? treatmentInSinhala;
  String? treatmentInEnglish;

  Disease(
      {this.diseaseNameSinhala,
        this.diseaseNameEnglish,
        this.treatmentInSinhala,
        this.treatmentInEnglish});

  Disease.fromJson(Map<String, dynamic> json) {
    diseaseNameSinhala = json['DiseaseNameSinhala'];
    diseaseNameEnglish = json['DiseaseNameEnglish'];
    treatmentInSinhala = json['TreatmentInSinhala'];
    treatmentInEnglish = json['TreatmentInEnglish'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DiseaseNameSinhala'] = this.diseaseNameSinhala;
    data['DiseaseNameEnglish'] = this.diseaseNameEnglish;
    data['TreatmentInSinhala'] = this.treatmentInSinhala;
    data['TreatmentInEnglish'] = this.treatmentInEnglish;
    return data;
  }
}
