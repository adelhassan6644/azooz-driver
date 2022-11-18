
abstract class ApiClient{

 Future <dynamic> get({required String uri , Map<String, dynamic>? queryParameters});

 Future <dynamic> post({required String uri , Map<String, dynamic>? queryParameters , data });

 Future <dynamic> put({ required String uri , Map<String, dynamic>? queryParameters , data });

 Future <dynamic> delete({required String uri ,  Map<String, dynamic>? queryParameters , data });

}