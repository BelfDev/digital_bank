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
