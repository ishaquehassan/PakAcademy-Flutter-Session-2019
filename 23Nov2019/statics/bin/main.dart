main() {
  /*Api api = Api();
  api.URL;*/
  Api.URL;
  Api api = Api();
  api.endpoint = "Hello";
  api.printUrl();
  Api api1 = Api();
  api1.endpoint = "world";
  api1.printUrl();
  Api.URL = "http://yahoo.com";
  api.printUrl();
  api1.printUrl();
  Api.hello("");
}

class Api{
  static String URL = "http://googleapis.com";
  String endpoint;

  printUrl(){
    print(URL);
    print(endpoint);
  }

  static hello(String msg){
    Api a = Api();
    a.printUrl();
    print(a.endpoint);
    print(URL);
  }

}
