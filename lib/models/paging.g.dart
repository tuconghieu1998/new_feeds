// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paging _$PagingFromJson(Map<String, dynamic> json) => Paging(
      cursor: json['cursor'] as String?,
      nextCursor: json['next_cursor'] as String?,
      limit: json['limit'] as int?,
      total: json['total'] as int?,
      page: json['page'] as int?,
      hasNext: json['has_next'] as bool? ?? false,
    );

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
      'cursor': instance.cursor,
      'next_cursor': instance.nextCursor,
      'limit': instance.limit,
      'total': instance.total,
      'page': instance.page,
      'has_next': instance.hasNext,
    };
