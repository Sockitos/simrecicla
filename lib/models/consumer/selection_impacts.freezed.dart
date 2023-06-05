// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection_impacts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectionImpacts {
  double get economical => throw _privateConstructorUsedError;
  double get environmental => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectionImpactsCopyWith<SelectionImpacts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectionImpactsCopyWith<$Res> {
  factory $SelectionImpactsCopyWith(
          SelectionImpacts value, $Res Function(SelectionImpacts) then) =
      _$SelectionImpactsCopyWithImpl<$Res, SelectionImpacts>;
  @useResult
  $Res call({double economical, double environmental});
}

/// @nodoc
class _$SelectionImpactsCopyWithImpl<$Res, $Val extends SelectionImpacts>
    implements $SelectionImpactsCopyWith<$Res> {
  _$SelectionImpactsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? economical = null,
    Object? environmental = null,
  }) {
    return _then(_value.copyWith(
      economical: null == economical
          ? _value.economical
          : economical // ignore: cast_nullable_to_non_nullable
              as double,
      environmental: null == environmental
          ? _value.environmental
          : environmental // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectionImpactsCopyWith<$Res>
    implements $SelectionImpactsCopyWith<$Res> {
  factory _$$_SelectionImpactsCopyWith(
          _$_SelectionImpacts value, $Res Function(_$_SelectionImpacts) then) =
      __$$_SelectionImpactsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double economical, double environmental});
}

/// @nodoc
class __$$_SelectionImpactsCopyWithImpl<$Res>
    extends _$SelectionImpactsCopyWithImpl<$Res, _$_SelectionImpacts>
    implements _$$_SelectionImpactsCopyWith<$Res> {
  __$$_SelectionImpactsCopyWithImpl(
      _$_SelectionImpacts _value, $Res Function(_$_SelectionImpacts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? economical = null,
    Object? environmental = null,
  }) {
    return _then(_$_SelectionImpacts(
      economical: null == economical
          ? _value.economical
          : economical // ignore: cast_nullable_to_non_nullable
              as double,
      environmental: null == environmental
          ? _value.environmental
          : environmental // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_SelectionImpacts implements _SelectionImpacts {
  const _$_SelectionImpacts(
      {required this.economical, required this.environmental});

  @override
  final double economical;
  @override
  final double environmental;

  @override
  String toString() {
    return 'SelectionImpacts(economical: $economical, environmental: $environmental)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectionImpacts &&
            (identical(other.economical, economical) ||
                other.economical == economical) &&
            (identical(other.environmental, environmental) ||
                other.environmental == environmental));
  }

  @override
  int get hashCode => Object.hash(runtimeType, economical, environmental);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectionImpactsCopyWith<_$_SelectionImpacts> get copyWith =>
      __$$_SelectionImpactsCopyWithImpl<_$_SelectionImpacts>(this, _$identity);
}

abstract class _SelectionImpacts implements SelectionImpacts {
  const factory _SelectionImpacts(
      {required final double economical,
      required final double environmental}) = _$_SelectionImpacts;

  @override
  double get economical;
  @override
  double get environmental;
  @override
  @JsonKey(ignore: true)
  _$$_SelectionImpactsCopyWith<_$_SelectionImpacts> get copyWith =>
      throw _privateConstructorUsedError;
}
