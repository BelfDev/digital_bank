import 'package:data_access/src/model/failure/failure_protocol.dart';
import 'package:equatable/equatable.dart';

abstract class Outcome<S> extends Equatable {
  static Outcome<S> success<S>(S data) {
    return _SuccessResult(data);
  }

  static Outcome<S> failure<S>(FailureProtocol failure) {
    return _FailureResult(failure);
  }

  FailureProtocol? get error => fold<FailureProtocol?>(
        (error) => error,
        (data) => null,
      );

  S? get data => fold<S?>((error) => null, (data) => data);

  bool get isSuccess => this is _SuccessResult<S>;

  bool get isFailure => this is _FailureResult<S>;

  S dataOrElse(S other) => isSuccess && data != null ? data! : other;

  S operator |(S other) => dataOrElse(other);

  Outcome<T> either<T>(
    FailureProtocol Function(FailureProtocol error) onFailure,
    T Function(S data) fnData,
  );

  Outcome<T> then<T>(Outcome<T> Function(S data) onData);

  Outcome<T> map<T>(T Function(S data) onData);

  T fold<T>(
    T Function(FailureProtocol error) onFailure,
    T Function(S data) onData,
  );

  @override
  List<Object?> get props => [if (isSuccess) data else error];
}

class _SuccessResult<S> extends Outcome<S> {
  final S _value;

  _SuccessResult(this._value);

  @override
  _SuccessResult<T> either<T>(
    FailureProtocol Function(FailureProtocol error) onFailure,
    T Function(S data) onData,
  ) {
    return _SuccessResult<T>(onData(_value));
  }

  @override
  Outcome<T> then<T>(Outcome<T> Function(S data) onData) {
    return onData(_value);
  }

  @override
  _SuccessResult<T> map<T>(T Function(S data) onData) {
    return _SuccessResult<T>(onData(_value));
  }

  @override
  T fold<T>(
    T Function(FailureProtocol error) onFailure,
    T Function(S data) onData,
  ) {
    return onData(_value);
  }
}

class _FailureResult<S> extends Outcome<S> {
  final FailureProtocol _value;

  _FailureResult(this._value);

  @override
  _FailureResult<T> either<T>(
    FailureProtocol Function(FailureProtocol error) onFailure,
    T Function(S data) onData,
  ) {
    return _FailureResult<T>(onFailure(_value));
  }

  @override
  _FailureResult<T> map<T>(T Function(S data) onData) {
    return _FailureResult<T>(_value);
  }

  @override
  _FailureResult<T> then<T>(Outcome<T> Function(S data) onData) {
    return _FailureResult<T>(_value);
  }

  @override
  T fold<T>(
    T Function(FailureProtocol error) onFailure,
    T Function(S data) onData,
  ) {
    return onFailure(_value);
  }
}

extension DeriveFailureExtension on Object {
  FailureProtocol deriveFailure(
    FailureProtocol fallback,
  ) {
    return this is FailureProtocol ? this as FailureProtocol : fallback;
  }
}
