// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Package _$PackageFromJson(Map<String, dynamic> json) {
  return _Package.fromJson(json);
}

/// @nodoc
class _$PackageTearOff {
  const _$PackageTearOff();

  _Package call(
      {required String package,
      @JsonKey(defaultValue: 'assets/svgs/test_package.svg')
          required String svgPath,
      required List<Component> components}) {
    return _Package(
      package: package,
      svgPath: svgPath,
      components: components,
    );
  }

  Package fromJson(Map<String, Object?> json) {
    return Package.fromJson(json);
  }
}

/// @nodoc
const $Package = _$PackageTearOff();

/// @nodoc
mixin _$Package {
  String get package => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 'assets/svgs/test_package.svg')
  String get svgPath => throw _privateConstructorUsedError;
  List<Component> get components => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackageCopyWith<Package> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageCopyWith<$Res> {
  factory $PackageCopyWith(Package value, $Res Function(Package) then) =
      _$PackageCopyWithImpl<$Res>;
  $Res call(
      {String package,
      @JsonKey(defaultValue: 'assets/svgs/test_package.svg') String svgPath,
      List<Component> components});
}

/// @nodoc
class _$PackageCopyWithImpl<$Res> implements $PackageCopyWith<$Res> {
  _$PackageCopyWithImpl(this._value, this._then);

  final Package _value;
  // ignore: unused_field
  final $Res Function(Package) _then;

  @override
  $Res call({
    Object? package = freezed,
    Object? svgPath = freezed,
    Object? components = freezed,
  }) {
    return _then(_value.copyWith(
      package: package == freezed
          ? _value.package
          : package // ignore: cast_nullable_to_non_nullable
              as String,
      svgPath: svgPath == freezed
          ? _value.svgPath
          : svgPath // ignore: cast_nullable_to_non_nullable
              as String,
      components: components == freezed
          ? _value.components
          : components // ignore: cast_nullable_to_non_nullable
              as List<Component>,
    ));
  }
}

/// @nodoc
abstract class _$PackageCopyWith<$Res> implements $PackageCopyWith<$Res> {
  factory _$PackageCopyWith(_Package value, $Res Function(_Package) then) =
      __$PackageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String package,
      @JsonKey(defaultValue: 'assets/svgs/test_package.svg') String svgPath,
      List<Component> components});
}

/// @nodoc
class __$PackageCopyWithImpl<$Res> extends _$PackageCopyWithImpl<$Res>
    implements _$PackageCopyWith<$Res> {
  __$PackageCopyWithImpl(_Package _value, $Res Function(_Package) _then)
      : super(_value, (v) => _then(v as _Package));

  @override
  _Package get _value => super._value as _Package;

  @override
  $Res call({
    Object? package = freezed,
    Object? svgPath = freezed,
    Object? components = freezed,
  }) {
    return _then(_Package(
      package: package == freezed
          ? _value.package
          : package // ignore: cast_nullable_to_non_nullable
              as String,
      svgPath: svgPath == freezed
          ? _value.svgPath
          : svgPath // ignore: cast_nullable_to_non_nullable
              as String,
      components: components == freezed
          ? _value.components
          : components // ignore: cast_nullable_to_non_nullable
              as List<Component>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Package extends _Package {
  const _$_Package(
      {required this.package,
      @JsonKey(defaultValue: 'assets/svgs/test_package.svg')
          required this.svgPath,
      required this.components})
      : super._();

  factory _$_Package.fromJson(Map<String, dynamic> json) =>
      _$$_PackageFromJson(json);

  @override
  final String package;
  @override
  @JsonKey(defaultValue: 'assets/svgs/test_package.svg')
  final String svgPath;
  @override
  final List<Component> components;

  @override
  String toString() {
    return 'Package(package: $package, svgPath: $svgPath, components: $components)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Package &&
            const DeepCollectionEquality().equals(other.package, package) &&
            const DeepCollectionEquality().equals(other.svgPath, svgPath) &&
            const DeepCollectionEquality()
                .equals(other.components, components));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(package),
      const DeepCollectionEquality().hash(svgPath),
      const DeepCollectionEquality().hash(components));

  @JsonKey(ignore: true)
  @override
  _$PackageCopyWith<_Package> get copyWith =>
      __$PackageCopyWithImpl<_Package>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageToJson(this);
  }
}

abstract class _Package extends Package {
  const factory _Package(
      {required String package,
      @JsonKey(defaultValue: 'assets/svgs/test_package.svg')
          required String svgPath,
      required List<Component> components}) = _$_Package;
  const _Package._() : super._();

  factory _Package.fromJson(Map<String, dynamic> json) = _$_Package.fromJson;

  @override
  String get package;
  @override
  @JsonKey(defaultValue: 'assets/svgs/test_package.svg')
  String get svgPath;
  @override
  List<Component> get components;
  @override
  @JsonKey(ignore: true)
  _$PackageCopyWith<_Package> get copyWith =>
      throw _privateConstructorUsedError;
}
