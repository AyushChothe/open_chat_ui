// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ModelState _$ModelStateFromJson(Map<String, dynamic> json) {
  return _ModelState.fromJson(json);
}

/// @nodoc
mixin _$ModelState {
  Model? get selectedModel => throw _privateConstructorUsedError;
  ModelStatus get status => throw _privateConstructorUsedError;
  List<GenerateChatCompletionResponse> get responses =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelStateCopyWith<ModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelStateCopyWith<$Res> {
  factory $ModelStateCopyWith(
          ModelState value, $Res Function(ModelState) then) =
      _$ModelStateCopyWithImpl<$Res, ModelState>;
  @useResult
  $Res call(
      {Model? selectedModel,
      ModelStatus status,
      List<GenerateChatCompletionResponse> responses});

  $ModelCopyWith<$Res>? get selectedModel;
}

/// @nodoc
class _$ModelStateCopyWithImpl<$Res, $Val extends ModelState>
    implements $ModelStateCopyWith<$Res> {
  _$ModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedModel = freezed,
    Object? status = null,
    Object? responses = null,
  }) {
    return _then(_value.copyWith(
      selectedModel: freezed == selectedModel
          ? _value.selectedModel
          : selectedModel // ignore: cast_nullable_to_non_nullable
              as Model?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ModelStatus,
      responses: null == responses
          ? _value.responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<GenerateChatCompletionResponse>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ModelCopyWith<$Res>? get selectedModel {
    if (_value.selectedModel == null) {
      return null;
    }

    return $ModelCopyWith<$Res>(_value.selectedModel!, (value) {
      return _then(_value.copyWith(selectedModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ModelStateImplCopyWith<$Res>
    implements $ModelStateCopyWith<$Res> {
  factory _$$ModelStateImplCopyWith(
          _$ModelStateImpl value, $Res Function(_$ModelStateImpl) then) =
      __$$ModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Model? selectedModel,
      ModelStatus status,
      List<GenerateChatCompletionResponse> responses});

  @override
  $ModelCopyWith<$Res>? get selectedModel;
}

/// @nodoc
class __$$ModelStateImplCopyWithImpl<$Res>
    extends _$ModelStateCopyWithImpl<$Res, _$ModelStateImpl>
    implements _$$ModelStateImplCopyWith<$Res> {
  __$$ModelStateImplCopyWithImpl(
      _$ModelStateImpl _value, $Res Function(_$ModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedModel = freezed,
    Object? status = null,
    Object? responses = null,
  }) {
    return _then(_$ModelStateImpl(
      selectedModel: freezed == selectedModel
          ? _value.selectedModel
          : selectedModel // ignore: cast_nullable_to_non_nullable
              as Model?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ModelStatus,
      responses: null == responses
          ? _value._responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<GenerateChatCompletionResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelStateImpl implements _ModelState {
  const _$ModelStateImpl(
      {this.selectedModel,
      this.status = ModelStatus.idle,
      final List<GenerateChatCompletionResponse> responses = const []})
      : _responses = responses;

  factory _$ModelStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelStateImplFromJson(json);

  @override
  final Model? selectedModel;
  @override
  @JsonKey()
  final ModelStatus status;
  final List<GenerateChatCompletionResponse> _responses;
  @override
  @JsonKey()
  List<GenerateChatCompletionResponse> get responses {
    if (_responses is EqualUnmodifiableListView) return _responses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_responses);
  }

  @override
  String toString() {
    return 'ModelState(selectedModel: $selectedModel, status: $status, responses: $responses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelStateImpl &&
            (identical(other.selectedModel, selectedModel) ||
                other.selectedModel == selectedModel) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._responses, _responses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, selectedModel, status,
      const DeepCollectionEquality().hash(_responses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelStateImplCopyWith<_$ModelStateImpl> get copyWith =>
      __$$ModelStateImplCopyWithImpl<_$ModelStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelStateImplToJson(
      this,
    );
  }
}

abstract class _ModelState implements ModelState {
  const factory _ModelState(
      {final Model? selectedModel,
      final ModelStatus status,
      final List<GenerateChatCompletionResponse> responses}) = _$ModelStateImpl;

  factory _ModelState.fromJson(Map<String, dynamic> json) =
      _$ModelStateImpl.fromJson;

  @override
  Model? get selectedModel;
  @override
  ModelStatus get status;
  @override
  List<GenerateChatCompletionResponse> get responses;
  @override
  @JsonKey(ignore: true)
  _$$ModelStateImplCopyWith<_$ModelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
