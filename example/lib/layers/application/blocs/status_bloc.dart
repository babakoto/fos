enum StatusBloc {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == StatusBloc.initial;
  bool get isLoading => this == StatusBloc.loading;
  bool get isLoaded => this == StatusBloc.success;
  bool get isFailure => this == StatusBloc.failure;
}
