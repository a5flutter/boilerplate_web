// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Token _$$_TokenFromJson(Map<String, dynamic> json) => _$_Token(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiredDate: DateTime.parse(json['expiredDate'] as String),
      idToken: json['idToken'] as String,
    );

Map<String, dynamic> _$$_TokenToJson(_$_Token instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiredDate': instance.expiredDate.toIso8601String(),
      'idToken': instance.idToken,
    };
