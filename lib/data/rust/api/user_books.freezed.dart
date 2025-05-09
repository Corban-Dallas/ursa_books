// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_books.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlatEventUserBook {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FlatEventUserBook);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FlatEventUserBook()';
  }
}

/// @nodoc
class $FlatEventUserBookCopyWith<$Res> {
  $FlatEventUserBookCopyWith(
      FlatEventUserBook _, $Res Function(FlatEventUserBook) __);
}

/// @nodoc

class FlatEventUserBook_BeginTasnsaction extends FlatEventUserBook {
  const FlatEventUserBook_BeginTasnsaction() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlatEventUserBook_BeginTasnsaction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FlatEventUserBook.beginTasnsaction()';
  }
}

/// @nodoc

class FlatEventUserBook_FinishTransaction extends FlatEventUserBook {
  const FlatEventUserBook_FinishTransaction() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlatEventUserBook_FinishTransaction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FlatEventUserBook.finishTransaction()';
  }
}

/// @nodoc

class FlatEventUserBook_Reset extends FlatEventUserBook {
  const FlatEventUserBook_Reset({required final List<UserBook> items})
      : _items = items,
        super._();

  final List<UserBook> _items;
  List<UserBook> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of FlatEventUserBook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlatEventUserBook_ResetCopyWith<FlatEventUserBook_Reset> get copyWith =>
      _$FlatEventUserBook_ResetCopyWithImpl<FlatEventUserBook_Reset>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlatEventUserBook_Reset &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'FlatEventUserBook.reset(items: $items)';
  }
}

/// @nodoc
abstract mixin class $FlatEventUserBook_ResetCopyWith<$Res>
    implements $FlatEventUserBookCopyWith<$Res> {
  factory $FlatEventUserBook_ResetCopyWith(FlatEventUserBook_Reset value,
          $Res Function(FlatEventUserBook_Reset) _then) =
      _$FlatEventUserBook_ResetCopyWithImpl;
  @useResult
  $Res call({List<UserBook> items});
}

/// @nodoc
class _$FlatEventUserBook_ResetCopyWithImpl<$Res>
    implements $FlatEventUserBook_ResetCopyWith<$Res> {
  _$FlatEventUserBook_ResetCopyWithImpl(this._self, this._then);

  final FlatEventUserBook_Reset _self;
  final $Res Function(FlatEventUserBook_Reset) _then;

  /// Create a copy of FlatEventUserBook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
  }) {
    return _then(FlatEventUserBook_Reset(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<UserBook>,
    ));
  }
}

/// @nodoc

class FlatEventUserBook_Delete extends FlatEventUserBook {
  const FlatEventUserBook_Delete({required this.start, required this.end})
      : super._();

  final BigInt start;
  final BigInt end;

  /// Create a copy of FlatEventUserBook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlatEventUserBook_DeleteCopyWith<FlatEventUserBook_Delete> get copyWith =>
      _$FlatEventUserBook_DeleteCopyWithImpl<FlatEventUserBook_Delete>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlatEventUserBook_Delete &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @override
  String toString() {
    return 'FlatEventUserBook.delete(start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class $FlatEventUserBook_DeleteCopyWith<$Res>
    implements $FlatEventUserBookCopyWith<$Res> {
  factory $FlatEventUserBook_DeleteCopyWith(FlatEventUserBook_Delete value,
          $Res Function(FlatEventUserBook_Delete) _then) =
      _$FlatEventUserBook_DeleteCopyWithImpl;
  @useResult
  $Res call({BigInt start, BigInt end});
}

/// @nodoc
class _$FlatEventUserBook_DeleteCopyWithImpl<$Res>
    implements $FlatEventUserBook_DeleteCopyWith<$Res> {
  _$FlatEventUserBook_DeleteCopyWithImpl(this._self, this._then);

  final FlatEventUserBook_Delete _self;
  final $Res Function(FlatEventUserBook_Delete) _then;

  /// Create a copy of FlatEventUserBook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(FlatEventUserBook_Delete(
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as BigInt,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class FlatEventUserBook_Insert extends FlatEventUserBook {
  const FlatEventUserBook_Insert(
      {required this.index, required final List<UserBook> items})
      : _items = items,
        super._();

  final BigInt index;
  final List<UserBook> _items;
  List<UserBook> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of FlatEventUserBook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlatEventUserBook_InsertCopyWith<FlatEventUserBook_Insert> get copyWith =>
      _$FlatEventUserBook_InsertCopyWithImpl<FlatEventUserBook_Insert>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlatEventUserBook_Insert &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, index, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'FlatEventUserBook.insert(index: $index, items: $items)';
  }
}

/// @nodoc
abstract mixin class $FlatEventUserBook_InsertCopyWith<$Res>
    implements $FlatEventUserBookCopyWith<$Res> {
  factory $FlatEventUserBook_InsertCopyWith(FlatEventUserBook_Insert value,
          $Res Function(FlatEventUserBook_Insert) _then) =
      _$FlatEventUserBook_InsertCopyWithImpl;
  @useResult
  $Res call({BigInt index, List<UserBook> items});
}

/// @nodoc
class _$FlatEventUserBook_InsertCopyWithImpl<$Res>
    implements $FlatEventUserBook_InsertCopyWith<$Res> {
  _$FlatEventUserBook_InsertCopyWithImpl(this._self, this._then);

  final FlatEventUserBook_Insert _self;
  final $Res Function(FlatEventUserBook_Insert) _then;

  /// Create a copy of FlatEventUserBook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? index = null,
    Object? items = null,
  }) {
    return _then(FlatEventUserBook_Insert(
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as BigInt,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<UserBook>,
    ));
  }
}

/// @nodoc

class FlatEventUserBook_Update extends FlatEventUserBook {
  const FlatEventUserBook_Update({required this.index, required this.item})
      : super._();

  final BigInt index;
  final UserBook item;

  /// Create a copy of FlatEventUserBook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlatEventUserBook_UpdateCopyWith<FlatEventUserBook_Update> get copyWith =>
      _$FlatEventUserBook_UpdateCopyWithImpl<FlatEventUserBook_Update>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlatEventUserBook_Update &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, item);

  @override
  String toString() {
    return 'FlatEventUserBook.update(index: $index, item: $item)';
  }
}

/// @nodoc
abstract mixin class $FlatEventUserBook_UpdateCopyWith<$Res>
    implements $FlatEventUserBookCopyWith<$Res> {
  factory $FlatEventUserBook_UpdateCopyWith(FlatEventUserBook_Update value,
          $Res Function(FlatEventUserBook_Update) _then) =
      _$FlatEventUserBook_UpdateCopyWithImpl;
  @useResult
  $Res call({BigInt index, UserBook item});
}

/// @nodoc
class _$FlatEventUserBook_UpdateCopyWithImpl<$Res>
    implements $FlatEventUserBook_UpdateCopyWith<$Res> {
  _$FlatEventUserBook_UpdateCopyWithImpl(this._self, this._then);

  final FlatEventUserBook_Update _self;
  final $Res Function(FlatEventUserBook_Update) _then;

  /// Create a copy of FlatEventUserBook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? index = null,
    Object? item = null,
  }) {
    return _then(FlatEventUserBook_Update(
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as BigInt,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as UserBook,
    ));
  }
}

/// @nodoc

class FlatEventUserBook_Move extends FlatEventUserBook {
  const FlatEventUserBook_Move(
      {required this.start, required this.end, required this.offset})
      : super._();

  final BigInt start;
  final BigInt end;
  final PlatformInt64 offset;

  /// Create a copy of FlatEventUserBook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlatEventUserBook_MoveCopyWith<FlatEventUserBook_Move> get copyWith =>
      _$FlatEventUserBook_MoveCopyWithImpl<FlatEventUserBook_Move>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlatEventUserBook_Move &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end, offset);

  @override
  String toString() {
    return 'FlatEventUserBook.move(start: $start, end: $end, offset: $offset)';
  }
}

/// @nodoc
abstract mixin class $FlatEventUserBook_MoveCopyWith<$Res>
    implements $FlatEventUserBookCopyWith<$Res> {
  factory $FlatEventUserBook_MoveCopyWith(FlatEventUserBook_Move value,
          $Res Function(FlatEventUserBook_Move) _then) =
      _$FlatEventUserBook_MoveCopyWithImpl;
  @useResult
  $Res call({BigInt start, BigInt end, PlatformInt64 offset});
}

/// @nodoc
class _$FlatEventUserBook_MoveCopyWithImpl<$Res>
    implements $FlatEventUserBook_MoveCopyWith<$Res> {
  _$FlatEventUserBook_MoveCopyWithImpl(this._self, this._then);

  final FlatEventUserBook_Move _self;
  final $Res Function(FlatEventUserBook_Move) _then;

  /// Create a copy of FlatEventUserBook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? offset = null,
  }) {
    return _then(FlatEventUserBook_Move(
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as BigInt,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as BigInt,
      offset: null == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as PlatformInt64,
    ));
  }
}

// dart format on
