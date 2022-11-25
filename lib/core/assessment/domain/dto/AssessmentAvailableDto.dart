import 'dart:convert';
/// isAvailable : true

AssessmentAvailableDto assessmentAvailableDtoFromJson(String str) => AssessmentAvailableDto.fromJson(json.decode(str));
String assessmentAvailableDtoToJson(AssessmentAvailableDto data) => json.encode(data.toJson());

class AssessmentAvailableDto {
  AssessmentAvailableDto({
      String? assessmentId, 
      num? attempts, 
      num? attemptsLeft, 
      bool? isPremium, 
      bool? isAvailable,}){
    _assessmentId = assessmentId;
    _attempts = attempts;
    _attemptsLeft = attemptsLeft;
    _isPremium = isPremium;
    _isAvailable = isAvailable;
}

  AssessmentAvailableDto.fromJson(dynamic json) {
    _assessmentId = json['assessmentId'];
    _attempts = json['attempts'];
    _attemptsLeft = json['attemptsLeft'];
    _isPremium = json['isPremium'];
    _isAvailable = json['isAvailable'];
  }
  String? _assessmentId;
  num? _attempts;
  num? _attemptsLeft;
  bool? _isPremium;
  bool? _isAvailable;
AssessmentAvailableDto copyWith({  String? assessmentId,
  num? attempts,
  num? attemptsLeft,
  bool? isPremium,
  bool? isAvailable,
}) => AssessmentAvailableDto(  assessmentId: assessmentId ?? _assessmentId,
  attempts: attempts ?? _attempts,
  attemptsLeft: attemptsLeft ?? _attemptsLeft,
  isPremium: isPremium ?? _isPremium,
  isAvailable: isAvailable ?? _isAvailable,
);
  String? get assessmentId => _assessmentId;
  num? get attempts => _attempts;
  num? get attemptsLeft => _attemptsLeft;
  bool? get isPremium => _isPremium;
  bool? get isAvailable => _isAvailable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['assessmentId'] = _assessmentId;
    map['attempts'] = _attempts;
    map['attemptsLeft'] = _attemptsLeft;
    map['isPremium'] = _isPremium;
    map['isAvailable'] = _isAvailable;
    return map;
  }

  @override
  String toString() {
    return 'AssessmentAvailableDto{_assessmentId: $_assessmentId, _attempts: $_attempts, _attemptsLeft: $_attemptsLeft, _isPremium: $_isPremium, _isAvailable: $_isAvailable}';
  }
}