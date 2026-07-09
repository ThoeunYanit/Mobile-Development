class AsyncData<T> {
  final T? value;
  final String? error;
  final bool isLoading;

  AsyncData.loading()
      : value = null,
        error = null,
        isLoading = true;

  AsyncData.success(T data)
      : value = data,
        error = null,
        isLoading = false;

  AsyncData.error(String message)
      : value = null,
        error = message,
        isLoading = false;
}