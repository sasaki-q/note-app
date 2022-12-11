// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Memo _$MemoFromJson(Map<String, dynamic> json) {
  return _Memo.fromJson(json);
}

/// @nodoc
mixin _$Memo {
  String get uid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String get categoryId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemoCopyWith<Memo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoCopyWith<$Res> {
  factory $MemoCopyWith(Memo value, $Res Function(Memo) then) =
      _$MemoCopyWithImpl<$Res, Memo>;
  @useResult
  $Res call(
      {String uid,
      String title,
      String contents,
      @JsonKey(name: 'category_id') String categoryId});
}

/// @nodoc
class _$MemoCopyWithImpl<$Res, $Val extends Memo>
    implements $MemoCopyWith<$Res> {
  _$MemoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? title = null,
    Object? contents = null,
    Object? categoryId = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemoCopyWith<$Res> implements $MemoCopyWith<$Res> {
  factory _$$_MemoCopyWith(_$_Memo value, $Res Function(_$_Memo) then) =
      __$$_MemoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String title,
      String contents,
      @JsonKey(name: 'category_id') String categoryId});
}

/// @nodoc
class __$$_MemoCopyWithImpl<$Res> extends _$MemoCopyWithImpl<$Res, _$_Memo>
    implements _$$_MemoCopyWith<$Res> {
  __$$_MemoCopyWithImpl(_$_Memo _value, $Res Function(_$_Memo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? title = null,
    Object? contents = null,
    Object? categoryId = null,
  }) {
    return _then(_$_Memo(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Memo implements _Memo {
  const _$_Memo(
      {required this.uid,
      required this.title,
      required this.contents,
      @JsonKey(name: 'category_id') required this.categoryId});

  factory _$_Memo.fromJson(Map<String, dynamic> json) => _$$_MemoFromJson(json);

  @override
  final String uid;
  @override
  final String title;
  @override
  final String contents;
  @override
  @JsonKey(name: 'category_id')
  final String categoryId;

  @override
  String toString() {
    return 'Memo(uid: $uid, title: $title, contents: $contents, categoryId: $categoryId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Memo &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, title, contents, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemoCopyWith<_$_Memo> get copyWith =>
      __$$_MemoCopyWithImpl<_$_Memo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemoToJson(
      this,
    );
  }
}

abstract class _Memo implements Memo {
  const factory _Memo(
          {required final String uid,
          required final String title,
          required final String contents,
          @JsonKey(name: 'category_id') required final String categoryId}) =
      _$_Memo;

  factory _Memo.fromJson(Map<String, dynamic> json) = _$_Memo.fromJson;

  @override
  String get uid;
  @override
  String get title;
  @override
  String get contents;
  @override
  @JsonKey(name: 'category_id')
  String get categoryId;
  @override
  @JsonKey(ignore: true)
  _$$_MemoCopyWith<_$_Memo> get copyWith => throw _privateConstructorUsedError;
}
