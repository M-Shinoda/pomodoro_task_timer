// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_keeper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimeKeeperModel {
  Duration get duration => throw _privateConstructorUsedError;
  Duration get remainingDuration => throw _privateConstructorUsedError;
  List<DateTime> get startDatetimes => throw _privateConstructorUsedError;
  List<DateTime> get endDatetimes => throw _privateConstructorUsedError;
  DateTime? get lastStartDatetime => throw _privateConstructorUsedError;
  DateTime? get lastEndDatetime => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimeKeeperModelCopyWith<TimeKeeperModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeKeeperModelCopyWith<$Res> {
  factory $TimeKeeperModelCopyWith(
          TimeKeeperModel value, $Res Function(TimeKeeperModel) then) =
      _$TimeKeeperModelCopyWithImpl<$Res, TimeKeeperModel>;
  @useResult
  $Res call(
      {Duration duration,
      Duration remainingDuration,
      List<DateTime> startDatetimes,
      List<DateTime> endDatetimes,
      DateTime? lastStartDatetime,
      DateTime? lastEndDatetime,
      bool isActive});
}

/// @nodoc
class _$TimeKeeperModelCopyWithImpl<$Res, $Val extends TimeKeeperModel>
    implements $TimeKeeperModelCopyWith<$Res> {
  _$TimeKeeperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? remainingDuration = null,
    Object? startDatetimes = null,
    Object? endDatetimes = null,
    Object? lastStartDatetime = freezed,
    Object? lastEndDatetime = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      remainingDuration: null == remainingDuration
          ? _value.remainingDuration
          : remainingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      startDatetimes: null == startDatetimes
          ? _value.startDatetimes
          : startDatetimes // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      endDatetimes: null == endDatetimes
          ? _value.endDatetimes
          : endDatetimes // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      lastStartDatetime: freezed == lastStartDatetime
          ? _value.lastStartDatetime
          : lastStartDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastEndDatetime: freezed == lastEndDatetime
          ? _value.lastEndDatetime
          : lastEndDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeKeeperModelImplCopyWith<$Res>
    implements $TimeKeeperModelCopyWith<$Res> {
  factory _$$TimeKeeperModelImplCopyWith(_$TimeKeeperModelImpl value,
          $Res Function(_$TimeKeeperModelImpl) then) =
      __$$TimeKeeperModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Duration duration,
      Duration remainingDuration,
      List<DateTime> startDatetimes,
      List<DateTime> endDatetimes,
      DateTime? lastStartDatetime,
      DateTime? lastEndDatetime,
      bool isActive});
}

/// @nodoc
class __$$TimeKeeperModelImplCopyWithImpl<$Res>
    extends _$TimeKeeperModelCopyWithImpl<$Res, _$TimeKeeperModelImpl>
    implements _$$TimeKeeperModelImplCopyWith<$Res> {
  __$$TimeKeeperModelImplCopyWithImpl(
      _$TimeKeeperModelImpl _value, $Res Function(_$TimeKeeperModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? remainingDuration = null,
    Object? startDatetimes = null,
    Object? endDatetimes = null,
    Object? lastStartDatetime = freezed,
    Object? lastEndDatetime = freezed,
    Object? isActive = null,
  }) {
    return _then(_$TimeKeeperModelImpl(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      remainingDuration: null == remainingDuration
          ? _value.remainingDuration
          : remainingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      startDatetimes: null == startDatetimes
          ? _value._startDatetimes
          : startDatetimes // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      endDatetimes: null == endDatetimes
          ? _value._endDatetimes
          : endDatetimes // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      lastStartDatetime: freezed == lastStartDatetime
          ? _value.lastStartDatetime
          : lastStartDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastEndDatetime: freezed == lastEndDatetime
          ? _value.lastEndDatetime
          : lastEndDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TimeKeeperModelImpl
    with DiagnosticableTreeMixin
    implements _TimeKeeperModel {
  const _$TimeKeeperModelImpl(
      {required this.duration,
      required this.remainingDuration,
      required final List<DateTime> startDatetimes,
      required final List<DateTime> endDatetimes,
      required this.lastStartDatetime,
      required this.lastEndDatetime,
      this.isActive = false})
      : _startDatetimes = startDatetimes,
        _endDatetimes = endDatetimes;

  @override
  final Duration duration;
  @override
  final Duration remainingDuration;
  final List<DateTime> _startDatetimes;
  @override
  List<DateTime> get startDatetimes {
    if (_startDatetimes is EqualUnmodifiableListView) return _startDatetimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_startDatetimes);
  }

  final List<DateTime> _endDatetimes;
  @override
  List<DateTime> get endDatetimes {
    if (_endDatetimes is EqualUnmodifiableListView) return _endDatetimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_endDatetimes);
  }

  @override
  final DateTime? lastStartDatetime;
  @override
  final DateTime? lastEndDatetime;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimeKeeperModel(duration: $duration, remainingDuration: $remainingDuration, startDatetimes: $startDatetimes, endDatetimes: $endDatetimes, lastStartDatetime: $lastStartDatetime, lastEndDatetime: $lastEndDatetime, isActive: $isActive)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimeKeeperModel'))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('remainingDuration', remainingDuration))
      ..add(DiagnosticsProperty('startDatetimes', startDatetimes))
      ..add(DiagnosticsProperty('endDatetimes', endDatetimes))
      ..add(DiagnosticsProperty('lastStartDatetime', lastStartDatetime))
      ..add(DiagnosticsProperty('lastEndDatetime', lastEndDatetime))
      ..add(DiagnosticsProperty('isActive', isActive));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeKeeperModelImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.remainingDuration, remainingDuration) ||
                other.remainingDuration == remainingDuration) &&
            const DeepCollectionEquality()
                .equals(other._startDatetimes, _startDatetimes) &&
            const DeepCollectionEquality()
                .equals(other._endDatetimes, _endDatetimes) &&
            (identical(other.lastStartDatetime, lastStartDatetime) ||
                other.lastStartDatetime == lastStartDatetime) &&
            (identical(other.lastEndDatetime, lastEndDatetime) ||
                other.lastEndDatetime == lastEndDatetime) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      duration,
      remainingDuration,
      const DeepCollectionEquality().hash(_startDatetimes),
      const DeepCollectionEquality().hash(_endDatetimes),
      lastStartDatetime,
      lastEndDatetime,
      isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeKeeperModelImplCopyWith<_$TimeKeeperModelImpl> get copyWith =>
      __$$TimeKeeperModelImplCopyWithImpl<_$TimeKeeperModelImpl>(
          this, _$identity);
}

abstract class _TimeKeeperModel implements TimeKeeperModel {
  const factory _TimeKeeperModel(
      {required final Duration duration,
      required final Duration remainingDuration,
      required final List<DateTime> startDatetimes,
      required final List<DateTime> endDatetimes,
      required final DateTime? lastStartDatetime,
      required final DateTime? lastEndDatetime,
      final bool isActive}) = _$TimeKeeperModelImpl;

  @override
  Duration get duration;
  @override
  Duration get remainingDuration;
  @override
  List<DateTime> get startDatetimes;
  @override
  List<DateTime> get endDatetimes;
  @override
  DateTime? get lastStartDatetime;
  @override
  DateTime? get lastEndDatetime;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$TimeKeeperModelImplCopyWith<_$TimeKeeperModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
