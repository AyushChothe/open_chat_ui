// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModelStateImpl _$$ModelStateImplFromJson(Map<String, dynamic> json) =>
    _$ModelStateImpl(
      selectedModel: json['selectedModel'] == null
          ? null
          : Model.fromJson(json['selectedModel'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$ModelStatusEnumMap, json['status']) ??
          ModelStatus.idle,
      responses: (json['responses'] as List<dynamic>?)
              ?.map((e) => GenerateChatCompletionResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ModelStateImplToJson(_$ModelStateImpl instance) =>
    <String, dynamic>{
      'selectedModel': instance.selectedModel,
      'status': _$ModelStatusEnumMap[instance.status]!,
      'responses': instance.responses,
    };

const _$ModelStatusEnumMap = {
  ModelStatus.idle: 'idle',
  ModelStatus.running: 'running',
};
