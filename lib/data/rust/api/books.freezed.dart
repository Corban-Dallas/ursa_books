// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlatEventBook {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FlatEventBook);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FlatEventBook()';
  }
}

/// @nodoc
class $FlatEventBookCopyWith<$Res> {
  $FlatEventBookCopyWith(FlatEventBook _, $Res Function(FlatEventBook) __);
}

/// Adds pattern-matching-related methods to [FlatEventBook].
extension FlatEventBookPatterns on FlatEventBook {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlatEventBook_BeginTasnsaction value)? beginTasnsaction,
    TResult Function(FlatEventBook_FinishTransaction value)? finishTransaction,
    TResult Function(FlatEventBook_Reset value)? reset,
    TResult Function(FlatEventBook_Delete value)? delete,
    TResult Function(FlatEventBook_Insert value)? insert,
    TResult Function(FlatEventBook_Update value)? update,
    TResult Function(FlatEventBook_Move value)? move,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FlatEventBook_BeginTasnsaction() when beginTasnsaction != null:
        return beginTasnsaction(_that);
      case FlatEventBook_FinishTransaction() when finishTransaction != null:
        return finishTransaction(_that);
      case FlatEventBook_Reset() when reset != null:
        return reset(_that);
      case FlatEventBook_Delete() when delete != null:
        return delete(_that);
      case FlatEventBook_Insert() when insert != null:
        return insert(_that);
      case FlatEventBook_Update() when update != null:
        return update(_that);
      case FlatEventBook_Move() when move != null:
        return move(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlatEventBook_BeginTasnsaction value)
        beginTasnsaction,
    required TResult Function(FlatEventBook_FinishTransaction value)
        finishTransaction,
    required TResult Function(FlatEventBook_Reset value) reset,
    required TResult Function(FlatEventBook_Delete value) delete,
    required TResult Function(FlatEventBook_Insert value) insert,
    required TResult Function(FlatEventBook_Update value) update,
    required TResult Function(FlatEventBook_Move value) move,
  }) {
    final _that = this;
    switch (_that) {
      case FlatEventBook_BeginTasnsaction():
        return beginTasnsaction(_that);
      case FlatEventBook_FinishTransaction():
        return finishTransaction(_that);
      case FlatEventBook_Reset():
        return reset(_that);
      case FlatEventBook_Delete():
        return delete(_that);
      case FlatEventBook_Insert():
        return insert(_that);
      case FlatEventBook_Update():
        return update(_that);
      case FlatEventBook_Move():
        return move(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FlatEventBook_BeginTasnsaction value)? beginTasnsaction,
    TResult? Function(FlatEventBook_FinishTransaction value)? finishTransaction,
    TResult? Function(FlatEventBook_Reset value)? reset,
    TResult? Function(FlatEventBook_Delete value)? delete,
    TResult? Function(FlatEventBook_Insert value)? insert,
    TResult? Function(FlatEventBook_Update value)? update,
    TResult? Function(FlatEventBook_Move value)? move,
  }) {
    final _that = this;
    switch (_that) {
      case FlatEventBook_BeginTasnsaction() when beginTasnsaction != null:
        return beginTasnsaction(_that);
      case FlatEventBook_FinishTransaction() when finishTransaction != null:
        return finishTransaction(_that);
      case FlatEventBook_Reset() when reset != null:
        return reset(_that);
      case FlatEventBook_Delete() when delete != null:
        return delete(_that);
      case FlatEventBook_Insert() when insert != null:
        return insert(_that);
      case FlatEventBook_Update() when update != null:
        return update(_that);
      case FlatEventBook_Move() when move != null:
        return move(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? beginTasnsaction,
    TResult Function()? finishTransaction,
    TResult Function(List<Book> items)? reset,
    TResult Function(BigInt start, BigInt end)? delete,
    TResult Function(BigInt index, List<Book> items)? insert,
    TResult Function(BigInt index, Book item)? update,
    TResult Function(BigInt start, BigInt end, PlatformInt64 offset)? move,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FlatEventBook_BeginTasnsaction() when beginTasnsaction != null:
        return beginTasnsaction();
      case FlatEventBook_FinishTransaction() when finishTransaction != null:
        return finishTransaction();
      case FlatEventBook_Reset() when reset != null:
        return reset(_that.items);
      case FlatEventBook_Delete() when delete != null:
        return delete(_that.start, _that.end);
      case FlatEventBook_Insert() when insert != null:
        return insert(_that.index, _that.items);
      case FlatEventBook_Update() when update != null:
        return update(_that.index, _that.item);
      case FlatEventBook_Move() when move != null:
        return move(_that.start, _that.end, _that.offset);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() beginTasnsaction,
    required TResult Function() finishTransaction,
    required TResult Function(List<Book> items) reset,
    required TResult Function(BigInt start, BigInt end) delete,
    required TResult Function(BigInt index, List<Book> items) insert,
    required TResult Function(BigInt index, Book item) update,
    required TResult Function(BigInt start, BigInt end, PlatformInt64 offset)
        move,
  }) {
    final _that = this;
    switch (_that) {
      case FlatEventBook_BeginTasnsaction():
        return beginTasnsaction();
      case FlatEventBook_FinishTransaction():
        return finishTransaction();
      case FlatEventBook_Reset():
        return reset(_that.items);
      case FlatEventBook_Delete():
        return delete(_that.start, _that.end);
      case FlatEventBook_Insert():
        return insert(_that.index, _that.items);
      case FlatEventBook_Update():
        return update(_that.index, _that.item);
      case FlatEventBook_Move():
        return move(_that.start, _that.end, _that.offset);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? beginTasnsaction,
    TResult? Function()? finishTransaction,
    TResult? Function(List<Book> items)? reset,
    TResult? Function(BigInt start, BigInt end)? delete,
    TResult? Function(BigInt index, List<Book> items)? insert,
    TResult? Function(BigInt index, Book item)? update,
    TResult? Function(BigInt start, BigInt end, PlatformInt64 offset)? move,
  }) {
    final _that = this;
    switch (_that) {
      case FlatEventBook_BeginTasnsaction() when beginTasnsaction != null:
        return beginTasnsaction();
      case FlatEventBook_FinishTransaction() when finishTransaction != null:
        return finishTransaction();
      case FlatEventBook_Reset() when reset != null:
        return reset(_that.items);
      case FlatEventBook_Delete() when delete != null:
        return delete(_that.start, _that.end);
      case FlatEventBook_Insert() when insert != null:
        return insert(_that.index, _that.items);
      case FlatEventBook_Update() when update != null:
        return update(_that.index, _that.item);
      case FlatEventBook_Move() when move != null:
        return move(_that.start, _that.end, _that.offset);
      case _:
        return null;
    }
  }
}

/// @nodoc

class FlatEventBook_BeginTasnsaction extends FlatEventBook {
  const FlatEventBook_BeginTasnsaction() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlatEventBook_BeginTasnsaction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FlatEventBook.beginTasnsaction()';
  }
}

/// @nodoc

class FlatEventBook_FinishTransaction extends FlatEventBook {
  const FlatEventBook_FinishTransaction() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlatEventBook_FinishTransaction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FlatEventBook.finishTransaction()';
  }
}

/// @nodoc

class FlatEventBook_Reset extends FlatEventBook {
  const FlatEventBook_Reset({required final List<Book> items})
      : _items = items,
        super._();

  final List<Book> _items;
  List<Book> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of FlatEventBook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlatEventBook_ResetCopyWith<FlatEventBook_Reset> get copyWith =>
      _$FlatEventBook_ResetCopyWithImpl<FlatEventBook_Reset>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlatEventBook_Reset &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'FlatEventBook.reset(items: $items)';
  }
}

/// @nodoc
abstract mixin class $FlatEventBook_ResetCopyWith<$Res>
    implements $FlatEventBookCopyWith<$Res> {
  factory $FlatEventBook_ResetCopyWith(
          FlatEventBook_Reset value, $Res Function(FlatEventBook_Reset) _then) =
      _$FlatEventBook_ResetCopyWithImpl;
  @useResult
  $Res call({List<Book> items});
}

/// @nodoc
class _$FlatEventBook_ResetCopyWithImpl<$Res>
    implements $FlatEventBook_ResetCopyWith<$Res> {
  _$FlatEventBook_ResetCopyWithImpl(this._self, this._then);

  final FlatEventBook_Reset _self;
  final $Res Function(FlatEventBook_Reset) _then;

  /// Create a copy of FlatEventBook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
  }) {
    return _then(FlatEventBook_Reset(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc

class FlatEventBook_Delete extends FlatEventBook {
  const FlatEventBook_Delete({required this.start, required this.end})
      : super._();

  final BigInt start;
  final BigInt end;

  /// Create a copy of FlatEventBook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlatEventBook_DeleteCopyWith<FlatEventBook_Delete> get copyWith =>
      _$FlatEventBook_DeleteCopyWithImpl<FlatEventBook_Delete>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlatEventBook_Delete &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @override
  String toString() {
    return 'FlatEventBook.delete(start: $start, end: $end)';
  }
}

/// @nodoc
abstract mixin class $FlatEventBook_DeleteCopyWith<$Res>
    implements $FlatEventBookCopyWith<$Res> {
  factory $FlatEventBook_DeleteCopyWith(FlatEventBook_Delete value,
          $Res Function(FlatEventBook_Delete) _then) =
      _$FlatEventBook_DeleteCopyWithImpl;
  @useResult
  $Res call({BigInt start, BigInt end});
}

/// @nodoc
class _$FlatEventBook_DeleteCopyWithImpl<$Res>
    implements $FlatEventBook_DeleteCopyWith<$Res> {
  _$FlatEventBook_DeleteCopyWithImpl(this._self, this._then);

  final FlatEventBook_Delete _self;
  final $Res Function(FlatEventBook_Delete) _then;

  /// Create a copy of FlatEventBook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(FlatEventBook_Delete(
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

class FlatEventBook_Insert extends FlatEventBook {
  const FlatEventBook_Insert(
      {required this.index, required final List<Book> items})
      : _items = items,
        super._();

  final BigInt index;
  final List<Book> _items;
  List<Book> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of FlatEventBook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlatEventBook_InsertCopyWith<FlatEventBook_Insert> get copyWith =>
      _$FlatEventBook_InsertCopyWithImpl<FlatEventBook_Insert>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlatEventBook_Insert &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, index, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'FlatEventBook.insert(index: $index, items: $items)';
  }
}

/// @nodoc
abstract mixin class $FlatEventBook_InsertCopyWith<$Res>
    implements $FlatEventBookCopyWith<$Res> {
  factory $FlatEventBook_InsertCopyWith(FlatEventBook_Insert value,
          $Res Function(FlatEventBook_Insert) _then) =
      _$FlatEventBook_InsertCopyWithImpl;
  @useResult
  $Res call({BigInt index, List<Book> items});
}

/// @nodoc
class _$FlatEventBook_InsertCopyWithImpl<$Res>
    implements $FlatEventBook_InsertCopyWith<$Res> {
  _$FlatEventBook_InsertCopyWithImpl(this._self, this._then);

  final FlatEventBook_Insert _self;
  final $Res Function(FlatEventBook_Insert) _then;

  /// Create a copy of FlatEventBook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? index = null,
    Object? items = null,
  }) {
    return _then(FlatEventBook_Insert(
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as BigInt,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc

class FlatEventBook_Update extends FlatEventBook {
  const FlatEventBook_Update({required this.index, required this.item})
      : super._();

  final BigInt index;
  final Book item;

  /// Create a copy of FlatEventBook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlatEventBook_UpdateCopyWith<FlatEventBook_Update> get copyWith =>
      _$FlatEventBook_UpdateCopyWithImpl<FlatEventBook_Update>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlatEventBook_Update &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, item);

  @override
  String toString() {
    return 'FlatEventBook.update(index: $index, item: $item)';
  }
}

/// @nodoc
abstract mixin class $FlatEventBook_UpdateCopyWith<$Res>
    implements $FlatEventBookCopyWith<$Res> {
  factory $FlatEventBook_UpdateCopyWith(FlatEventBook_Update value,
          $Res Function(FlatEventBook_Update) _then) =
      _$FlatEventBook_UpdateCopyWithImpl;
  @useResult
  $Res call({BigInt index, Book item});
}

/// @nodoc
class _$FlatEventBook_UpdateCopyWithImpl<$Res>
    implements $FlatEventBook_UpdateCopyWith<$Res> {
  _$FlatEventBook_UpdateCopyWithImpl(this._self, this._then);

  final FlatEventBook_Update _self;
  final $Res Function(FlatEventBook_Update) _then;

  /// Create a copy of FlatEventBook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? index = null,
    Object? item = null,
  }) {
    return _then(FlatEventBook_Update(
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as BigInt,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc

class FlatEventBook_Move extends FlatEventBook {
  const FlatEventBook_Move(
      {required this.start, required this.end, required this.offset})
      : super._();

  final BigInt start;
  final BigInt end;
  final PlatformInt64 offset;

  /// Create a copy of FlatEventBook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FlatEventBook_MoveCopyWith<FlatEventBook_Move> get copyWith =>
      _$FlatEventBook_MoveCopyWithImpl<FlatEventBook_Move>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FlatEventBook_Move &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end, offset);

  @override
  String toString() {
    return 'FlatEventBook.move(start: $start, end: $end, offset: $offset)';
  }
}

/// @nodoc
abstract mixin class $FlatEventBook_MoveCopyWith<$Res>
    implements $FlatEventBookCopyWith<$Res> {
  factory $FlatEventBook_MoveCopyWith(
          FlatEventBook_Move value, $Res Function(FlatEventBook_Move) _then) =
      _$FlatEventBook_MoveCopyWithImpl;
  @useResult
  $Res call({BigInt start, BigInt end, PlatformInt64 offset});
}

/// @nodoc
class _$FlatEventBook_MoveCopyWithImpl<$Res>
    implements $FlatEventBook_MoveCopyWith<$Res> {
  _$FlatEventBook_MoveCopyWithImpl(this._self, this._then);

  final FlatEventBook_Move _self;
  final $Res Function(FlatEventBook_Move) _then;

  /// Create a copy of FlatEventBook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? offset = null,
  }) {
    return _then(FlatEventBook_Move(
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

/// @nodoc
mixin _$RBookEntityEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RBookEntityEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RBookEntityEvent()';
  }
}

/// @nodoc
class $RBookEntityEventCopyWith<$Res> {
  $RBookEntityEventCopyWith(
      RBookEntityEvent _, $Res Function(RBookEntityEvent) __);
}

/// Adds pattern-matching-related methods to [RBookEntityEvent].
extension RBookEntityEventPatterns on RBookEntityEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RBookEntityEvent_Updated value)? updated,
    TResult Function(RBookEntityEvent_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case RBookEntityEvent_Updated() when updated != null:
        return updated(_that);
      case RBookEntityEvent_Deleted() when deleted != null:
        return deleted(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RBookEntityEvent_Updated value) updated,
    required TResult Function(RBookEntityEvent_Deleted value) deleted,
  }) {
    final _that = this;
    switch (_that) {
      case RBookEntityEvent_Updated():
        return updated(_that);
      case RBookEntityEvent_Deleted():
        return deleted(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RBookEntityEvent_Updated value)? updated,
    TResult? Function(RBookEntityEvent_Deleted value)? deleted,
  }) {
    final _that = this;
    switch (_that) {
      case RBookEntityEvent_Updated() when updated != null:
        return updated(_that);
      case RBookEntityEvent_Deleted() when deleted != null:
        return deleted(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserBook field0)? updated,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case RBookEntityEvent_Updated() when updated != null:
        return updated(_that.field0);
      case RBookEntityEvent_Deleted() when deleted != null:
        return deleted();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserBook field0) updated,
    required TResult Function() deleted,
  }) {
    final _that = this;
    switch (_that) {
      case RBookEntityEvent_Updated():
        return updated(_that.field0);
      case RBookEntityEvent_Deleted():
        return deleted();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserBook field0)? updated,
    TResult? Function()? deleted,
  }) {
    final _that = this;
    switch (_that) {
      case RBookEntityEvent_Updated() when updated != null:
        return updated(_that.field0);
      case RBookEntityEvent_Deleted() when deleted != null:
        return deleted();
      case _:
        return null;
    }
  }
}

/// @nodoc

class RBookEntityEvent_Updated extends RBookEntityEvent {
  const RBookEntityEvent_Updated(this.field0) : super._();

  final UserBook field0;

  /// Create a copy of RBookEntityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RBookEntityEvent_UpdatedCopyWith<RBookEntityEvent_Updated> get copyWith =>
      _$RBookEntityEvent_UpdatedCopyWithImpl<RBookEntityEvent_Updated>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RBookEntityEvent_Updated &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'RBookEntityEvent.updated(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $RBookEntityEvent_UpdatedCopyWith<$Res>
    implements $RBookEntityEventCopyWith<$Res> {
  factory $RBookEntityEvent_UpdatedCopyWith(RBookEntityEvent_Updated value,
          $Res Function(RBookEntityEvent_Updated) _then) =
      _$RBookEntityEvent_UpdatedCopyWithImpl;
  @useResult
  $Res call({UserBook field0});
}

/// @nodoc
class _$RBookEntityEvent_UpdatedCopyWithImpl<$Res>
    implements $RBookEntityEvent_UpdatedCopyWith<$Res> {
  _$RBookEntityEvent_UpdatedCopyWithImpl(this._self, this._then);

  final RBookEntityEvent_Updated _self;
  final $Res Function(RBookEntityEvent_Updated) _then;

  /// Create a copy of RBookEntityEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(RBookEntityEvent_Updated(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as UserBook,
    ));
  }
}

/// @nodoc

class RBookEntityEvent_Deleted extends RBookEntityEvent {
  const RBookEntityEvent_Deleted() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RBookEntityEvent_Deleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RBookEntityEvent.deleted()';
  }
}

// dart format on
