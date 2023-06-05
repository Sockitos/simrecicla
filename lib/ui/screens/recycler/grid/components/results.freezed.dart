// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResultsModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() efficiency,
    required TResult Function(int productId) product,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? efficiency,
    TResult? Function(int productId)? product,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? efficiency,
    TResult Function(int productId)? product,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Efficiency value) efficiency,
    required TResult Function(_Product value) product,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Efficiency value)? efficiency,
    TResult? Function(_Product value)? product,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Efficiency value)? efficiency,
    TResult Function(_Product value)? product,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultsModelCopyWith<$Res> {
  factory $ResultsModelCopyWith(
          ResultsModel value, $Res Function(ResultsModel) then) =
      _$ResultsModelCopyWithImpl<$Res, ResultsModel>;
}

/// @nodoc
class _$ResultsModelCopyWithImpl<$Res, $Val extends ResultsModel>
    implements $ResultsModelCopyWith<$Res> {
  _$ResultsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_EfficiencyCopyWith<$Res> {
  factory _$$_EfficiencyCopyWith(
          _$_Efficiency value, $Res Function(_$_Efficiency) then) =
      __$$_EfficiencyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EfficiencyCopyWithImpl<$Res>
    extends _$ResultsModelCopyWithImpl<$Res, _$_Efficiency>
    implements _$$_EfficiencyCopyWith<$Res> {
  __$$_EfficiencyCopyWithImpl(
      _$_Efficiency _value, $Res Function(_$_Efficiency) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Efficiency extends _Efficiency {
  const _$_Efficiency() : super._();

  @override
  String toString() {
    return 'ResultsModel.efficiency()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Efficiency);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() efficiency,
    required TResult Function(int productId) product,
  }) {
    return efficiency();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? efficiency,
    TResult? Function(int productId)? product,
  }) {
    return efficiency?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? efficiency,
    TResult Function(int productId)? product,
    required TResult orElse(),
  }) {
    if (efficiency != null) {
      return efficiency();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Efficiency value) efficiency,
    required TResult Function(_Product value) product,
  }) {
    return efficiency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Efficiency value)? efficiency,
    TResult? Function(_Product value)? product,
  }) {
    return efficiency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Efficiency value)? efficiency,
    TResult Function(_Product value)? product,
    required TResult orElse(),
  }) {
    if (efficiency != null) {
      return efficiency(this);
    }
    return orElse();
  }
}

abstract class _Efficiency extends ResultsModel {
  const factory _Efficiency() = _$_Efficiency;
  const _Efficiency._() : super._();
}

/// @nodoc
abstract class _$$_ProductCopyWith<$Res> {
  factory _$$_ProductCopyWith(
          _$_Product value, $Res Function(_$_Product) then) =
      __$$_ProductCopyWithImpl<$Res>;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class __$$_ProductCopyWithImpl<$Res>
    extends _$ResultsModelCopyWithImpl<$Res, _$_Product>
    implements _$$_ProductCopyWith<$Res> {
  __$$_ProductCopyWithImpl(_$_Product _value, $Res Function(_$_Product) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_$_Product(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Product extends _Product {
  const _$_Product({required this.productId}) : super._();

  @override
  final int productId;

  @override
  String toString() {
    return 'ResultsModel.product(productId: $productId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      __$$_ProductCopyWithImpl<_$_Product>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() efficiency,
    required TResult Function(int productId) product,
  }) {
    return product(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? efficiency,
    TResult? Function(int productId)? product,
  }) {
    return product?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? efficiency,
    TResult Function(int productId)? product,
    required TResult orElse(),
  }) {
    if (product != null) {
      return product(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Efficiency value) efficiency,
    required TResult Function(_Product value) product,
  }) {
    return product(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Efficiency value)? efficiency,
    TResult? Function(_Product value)? product,
  }) {
    return product?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Efficiency value)? efficiency,
    TResult Function(_Product value)? product,
    required TResult orElse(),
  }) {
    if (product != null) {
      return product(this);
    }
    return orElse();
  }
}

abstract class _Product extends ResultsModel {
  const factory _Product({required final int productId}) = _$_Product;
  const _Product._() : super._();

  int get productId;
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
