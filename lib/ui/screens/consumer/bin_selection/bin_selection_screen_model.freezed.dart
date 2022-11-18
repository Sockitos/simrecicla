// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bin_selection_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BinSelectionScreenModel {
  Package get package => throw _privateConstructorUsedError;
  Map<Component, Where> get whereComponents =>
      throw _privateConstructorUsedError;
  bool get isBinning => throw _privateConstructorUsedError;
  bool get showResults => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BinSelectionScreenModelCopyWith<BinSelectionScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BinSelectionScreenModelCopyWith<$Res> {
  factory $BinSelectionScreenModelCopyWith(BinSelectionScreenModel value,
          $Res Function(BinSelectionScreenModel) then) =
      _$BinSelectionScreenModelCopyWithImpl<$Res, BinSelectionScreenModel>;
  @useResult
  $Res call(
      {Package package,
      Map<Component, Where> whereComponents,
      bool isBinning,
      bool showResults});

  $PackageCopyWith<$Res> get package;
}

/// @nodoc
class _$BinSelectionScreenModelCopyWithImpl<$Res,
        $Val extends BinSelectionScreenModel>
    implements $BinSelectionScreenModelCopyWith<$Res> {
  _$BinSelectionScreenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? package = null,
    Object? whereComponents = null,
    Object? isBinning = null,
    Object? showResults = null,
  }) {
    return _then(_value.copyWith(
      package: null == package
          ? _value.package
          : package // ignore: cast_nullable_to_non_nullable
              as Package,
      whereComponents: null == whereComponents
          ? _value.whereComponents
          : whereComponents // ignore: cast_nullable_to_non_nullable
              as Map<Component, Where>,
      isBinning: null == isBinning
          ? _value.isBinning
          : isBinning // ignore: cast_nullable_to_non_nullable
              as bool,
      showResults: null == showResults
          ? _value.showResults
          : showResults // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PackageCopyWith<$Res> get package {
    return $PackageCopyWith<$Res>(_value.package, (value) {
      return _then(_value.copyWith(package: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BinSelectionScreenModelCopyWith<$Res>
    implements $BinSelectionScreenModelCopyWith<$Res> {
  factory _$$_BinSelectionScreenModelCopyWith(_$_BinSelectionScreenModel value,
          $Res Function(_$_BinSelectionScreenModel) then) =
      __$$_BinSelectionScreenModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Package package,
      Map<Component, Where> whereComponents,
      bool isBinning,
      bool showResults});

  @override
  $PackageCopyWith<$Res> get package;
}

/// @nodoc
class __$$_BinSelectionScreenModelCopyWithImpl<$Res>
    extends _$BinSelectionScreenModelCopyWithImpl<$Res,
        _$_BinSelectionScreenModel>
    implements _$$_BinSelectionScreenModelCopyWith<$Res> {
  __$$_BinSelectionScreenModelCopyWithImpl(_$_BinSelectionScreenModel _value,
      $Res Function(_$_BinSelectionScreenModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? package = null,
    Object? whereComponents = null,
    Object? isBinning = null,
    Object? showResults = null,
  }) {
    return _then(_$_BinSelectionScreenModel(
      package: null == package
          ? _value.package
          : package // ignore: cast_nullable_to_non_nullable
              as Package,
      whereComponents: null == whereComponents
          ? _value._whereComponents
          : whereComponents // ignore: cast_nullable_to_non_nullable
              as Map<Component, Where>,
      isBinning: null == isBinning
          ? _value.isBinning
          : isBinning // ignore: cast_nullable_to_non_nullable
              as bool,
      showResults: null == showResults
          ? _value.showResults
          : showResults // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BinSelectionScreenModel implements _BinSelectionScreenModel {
  const _$_BinSelectionScreenModel(
      {required this.package,
      final Map<Component, Where> whereComponents = const <Component, Where>{},
      this.isBinning = false,
      this.showResults = false})
      : _whereComponents = whereComponents;

  @override
  final Package package;
  final Map<Component, Where> _whereComponents;
  @override
  @JsonKey()
  Map<Component, Where> get whereComponents {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_whereComponents);
  }

  @override
  @JsonKey()
  final bool isBinning;
  @override
  @JsonKey()
  final bool showResults;

  @override
  String toString() {
    return 'BinSelectionScreenModel(package: $package, whereComponents: $whereComponents, isBinning: $isBinning, showResults: $showResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BinSelectionScreenModel &&
            (identical(other.package, package) || other.package == package) &&
            const DeepCollectionEquality()
                .equals(other._whereComponents, _whereComponents) &&
            (identical(other.isBinning, isBinning) ||
                other.isBinning == isBinning) &&
            (identical(other.showResults, showResults) ||
                other.showResults == showResults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      package,
      const DeepCollectionEquality().hash(_whereComponents),
      isBinning,
      showResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BinSelectionScreenModelCopyWith<_$_BinSelectionScreenModel>
      get copyWith =>
          __$$_BinSelectionScreenModelCopyWithImpl<_$_BinSelectionScreenModel>(
              this, _$identity);
}

abstract class _BinSelectionScreenModel implements BinSelectionScreenModel {
  const factory _BinSelectionScreenModel(
      {required final Package package,
      final Map<Component, Where> whereComponents,
      final bool isBinning,
      final bool showResults}) = _$_BinSelectionScreenModel;

  @override
  Package get package;
  @override
  Map<Component, Where> get whereComponents;
  @override
  bool get isBinning;
  @override
  bool get showResults;
  @override
  @JsonKey(ignore: true)
  _$$_BinSelectionScreenModelCopyWith<_$_BinSelectionScreenModel>
      get copyWith => throw _privateConstructorUsedError;
}
