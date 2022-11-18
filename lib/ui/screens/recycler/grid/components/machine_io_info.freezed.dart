// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'machine_io_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IOInfoModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() input,
    required TResult Function(String outputId) output,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? input,
    TResult? Function(String outputId)? output,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? input,
    TResult Function(String outputId)? output,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Input value) input,
    required TResult Function(_Output value) output,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Input value)? input,
    TResult? Function(_Output value)? output,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Input value)? input,
    TResult Function(_Output value)? output,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IOInfoModelCopyWith<$Res> {
  factory $IOInfoModelCopyWith(
          IOInfoModel value, $Res Function(IOInfoModel) then) =
      _$IOInfoModelCopyWithImpl<$Res, IOInfoModel>;
}

/// @nodoc
class _$IOInfoModelCopyWithImpl<$Res, $Val extends IOInfoModel>
    implements $IOInfoModelCopyWith<$Res> {
  _$IOInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InputCopyWith<$Res> {
  factory _$$_InputCopyWith(_$_Input value, $Res Function(_$_Input) then) =
      __$$_InputCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InputCopyWithImpl<$Res>
    extends _$IOInfoModelCopyWithImpl<$Res, _$_Input>
    implements _$$_InputCopyWith<$Res> {
  __$$_InputCopyWithImpl(_$_Input _value, $Res Function(_$_Input) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Input extends _Input {
  const _$_Input() : super._();

  @override
  String toString() {
    return 'IOInfoModel.input()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Input);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() input,
    required TResult Function(String outputId) output,
  }) {
    return input();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? input,
    TResult? Function(String outputId)? output,
  }) {
    return input?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? input,
    TResult Function(String outputId)? output,
    required TResult orElse(),
  }) {
    if (input != null) {
      return input();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Input value) input,
    required TResult Function(_Output value) output,
  }) {
    return input(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Input value)? input,
    TResult? Function(_Output value)? output,
  }) {
    return input?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Input value)? input,
    TResult Function(_Output value)? output,
    required TResult orElse(),
  }) {
    if (input != null) {
      return input(this);
    }
    return orElse();
  }
}

abstract class _Input extends IOInfoModel {
  const factory _Input() = _$_Input;
  const _Input._() : super._();
}

/// @nodoc
abstract class _$$_OutputCopyWith<$Res> {
  factory _$$_OutputCopyWith(_$_Output value, $Res Function(_$_Output) then) =
      __$$_OutputCopyWithImpl<$Res>;
  @useResult
  $Res call({String outputId});
}

/// @nodoc
class __$$_OutputCopyWithImpl<$Res>
    extends _$IOInfoModelCopyWithImpl<$Res, _$_Output>
    implements _$$_OutputCopyWith<$Res> {
  __$$_OutputCopyWithImpl(_$_Output _value, $Res Function(_$_Output) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outputId = null,
  }) {
    return _then(_$_Output(
      outputId: null == outputId
          ? _value.outputId
          : outputId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Output extends _Output {
  const _$_Output({required this.outputId}) : super._();

  @override
  final String outputId;

  @override
  String toString() {
    return 'IOInfoModel.output(outputId: $outputId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Output &&
            (identical(other.outputId, outputId) ||
                other.outputId == outputId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, outputId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OutputCopyWith<_$_Output> get copyWith =>
      __$$_OutputCopyWithImpl<_$_Output>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() input,
    required TResult Function(String outputId) output,
  }) {
    return output(outputId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? input,
    TResult? Function(String outputId)? output,
  }) {
    return output?.call(outputId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? input,
    TResult Function(String outputId)? output,
    required TResult orElse(),
  }) {
    if (output != null) {
      return output(outputId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Input value) input,
    required TResult Function(_Output value) output,
  }) {
    return output(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Input value)? input,
    TResult? Function(_Output value)? output,
  }) {
    return output?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Input value)? input,
    TResult Function(_Output value)? output,
    required TResult orElse(),
  }) {
    if (output != null) {
      return output(this);
    }
    return orElse();
  }
}

abstract class _Output extends IOInfoModel {
  const factory _Output({required final String outputId}) = _$_Output;
  const _Output._() : super._();

  String get outputId;
  @JsonKey(ignore: true)
  _$$_OutputCopyWith<_$_Output> get copyWith =>
      throw _privateConstructorUsedError;
}
