// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectionResults {
  bool get isCorrect => throw _privateConstructorUsedError;
  SelectionImpacts get userImpacts => throw _privateConstructorUsedError;
  SelectionImpacts get alternativeImpacts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectionResultsCopyWith<SelectionResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectionResultsCopyWith<$Res> {
  factory $SelectionResultsCopyWith(
          SelectionResults value, $Res Function(SelectionResults) then) =
      _$SelectionResultsCopyWithImpl<$Res, SelectionResults>;
  @useResult
  $Res call(
      {bool isCorrect,
      SelectionImpacts userImpacts,
      SelectionImpacts alternativeImpacts});

  $SelectionImpactsCopyWith<$Res> get userImpacts;
  $SelectionImpactsCopyWith<$Res> get alternativeImpacts;
}

/// @nodoc
class _$SelectionResultsCopyWithImpl<$Res, $Val extends SelectionResults>
    implements $SelectionResultsCopyWith<$Res> {
  _$SelectionResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCorrect = null,
    Object? userImpacts = null,
    Object? alternativeImpacts = null,
  }) {
    return _then(_value.copyWith(
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      userImpacts: null == userImpacts
          ? _value.userImpacts
          : userImpacts // ignore: cast_nullable_to_non_nullable
              as SelectionImpacts,
      alternativeImpacts: null == alternativeImpacts
          ? _value.alternativeImpacts
          : alternativeImpacts // ignore: cast_nullable_to_non_nullable
              as SelectionImpacts,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectionImpactsCopyWith<$Res> get userImpacts {
    return $SelectionImpactsCopyWith<$Res>(_value.userImpacts, (value) {
      return _then(_value.copyWith(userImpacts: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SelectionImpactsCopyWith<$Res> get alternativeImpacts {
    return $SelectionImpactsCopyWith<$Res>(_value.alternativeImpacts, (value) {
      return _then(_value.copyWith(alternativeImpacts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SelectionResultsCopyWith<$Res>
    implements $SelectionResultsCopyWith<$Res> {
  factory _$$_SelectionResultsCopyWith(
          _$_SelectionResults value, $Res Function(_$_SelectionResults) then) =
      __$$_SelectionResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isCorrect,
      SelectionImpacts userImpacts,
      SelectionImpacts alternativeImpacts});

  @override
  $SelectionImpactsCopyWith<$Res> get userImpacts;
  @override
  $SelectionImpactsCopyWith<$Res> get alternativeImpacts;
}

/// @nodoc
class __$$_SelectionResultsCopyWithImpl<$Res>
    extends _$SelectionResultsCopyWithImpl<$Res, _$_SelectionResults>
    implements _$$_SelectionResultsCopyWith<$Res> {
  __$$_SelectionResultsCopyWithImpl(
      _$_SelectionResults _value, $Res Function(_$_SelectionResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCorrect = null,
    Object? userImpacts = null,
    Object? alternativeImpacts = null,
  }) {
    return _then(_$_SelectionResults(
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      userImpacts: null == userImpacts
          ? _value.userImpacts
          : userImpacts // ignore: cast_nullable_to_non_nullable
              as SelectionImpacts,
      alternativeImpacts: null == alternativeImpacts
          ? _value.alternativeImpacts
          : alternativeImpacts // ignore: cast_nullable_to_non_nullable
              as SelectionImpacts,
    ));
  }
}

/// @nodoc

class _$_SelectionResults implements _SelectionResults {
  const _$_SelectionResults(
      {required this.isCorrect,
      required this.userImpacts,
      required this.alternativeImpacts});

  @override
  final bool isCorrect;
  @override
  final SelectionImpacts userImpacts;
  @override
  final SelectionImpacts alternativeImpacts;

  @override
  String toString() {
    return 'SelectionResults(isCorrect: $isCorrect, userImpacts: $userImpacts, alternativeImpacts: $alternativeImpacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectionResults &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.userImpacts, userImpacts) ||
                other.userImpacts == userImpacts) &&
            (identical(other.alternativeImpacts, alternativeImpacts) ||
                other.alternativeImpacts == alternativeImpacts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isCorrect, userImpacts, alternativeImpacts);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectionResultsCopyWith<_$_SelectionResults> get copyWith =>
      __$$_SelectionResultsCopyWithImpl<_$_SelectionResults>(this, _$identity);
}

abstract class _SelectionResults implements SelectionResults {
  const factory _SelectionResults(
          {required final bool isCorrect,
          required final SelectionImpacts userImpacts,
          required final SelectionImpacts alternativeImpacts}) =
      _$_SelectionResults;

  @override
  bool get isCorrect;
  @override
  SelectionImpacts get userImpacts;
  @override
  SelectionImpacts get alternativeImpacts;
  @override
  @JsonKey(ignore: true)
  _$$_SelectionResultsCopyWith<_$_SelectionResults> get copyWith =>
      throw _privateConstructorUsedError;
}
