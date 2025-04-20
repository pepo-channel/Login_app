abstract class ApiConsumer {
  Future<dynamic> post(
    String path,
    {
      Object? data,
      Map<String, dynamic>? queryparameters,
      bool isformdata = false,
    }
  );

  Future<dynamic> get(
    String path,
    {
      Object? data,
      Map<String, dynamic>? queryparameters,
      bool isformdata = false,
    }
  );

  Future<dynamic> patch(
    String path,
    {
      Object? data,
      Map<String, dynamic>? queryparameters,
      bool isformdata = false,
    }
  );

  Future<dynamic> delete(
    String path,
    {
      Object? data,
      Map<String, dynamic>? queryparameters,
      bool isformdata = false,
    }
  );
}