class APIResponse<T> {
  T data;
  bool error;
  late String errorMessage; 

  APIResponse({
    required this.data, 
    this.error = false,
  });
}