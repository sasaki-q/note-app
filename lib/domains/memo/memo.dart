// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo.freezed.dart';
part 'memo.g.dart';

@freezed
class Memo with _$Memo {
  const factory Memo({
    required String id,
    required String uid,
    required String title,
    required String contents,
    @JsonKey(name: 'category_id') required String categoryId,
  }) = _Memo;

  factory Memo.fromJson(Map<String, Object?> json) => _$MemoFromJson(json);
}
