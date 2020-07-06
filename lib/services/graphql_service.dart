import 'package:graphql/client.dart';

class GraphQLService {
  static final GraphQLService _singleton = GraphQLService._internal();

  factory GraphQLService() {
    return _singleton;
  }

  GraphQLService._internal();

  /* Regular class */
  static String _token;

  Function setToken = (String token) => _token = token;

  String get getToken {
    return _token;
  }

  GraphQLClient _client = GraphQLClient(
    cache: InMemoryCache(),
    link: _getLink(),
  );

  //   static final HttpLink _httpLink = HttpLink(
  //   uri: 'https://justfoot-api.aleygues.fr/admin/api',
  // );

  static final HttpLink _httpLink = HttpLink(
    uri: 'http://10.0.2.2:3000/admin/api',
  );

  static Link _getLink() {
    AuthLink authlink = AuthLink(getToken: () async => 'Bearer $_token');
    return authlink.concat(_httpLink);
  }

  Future<dynamic> query(String query, Map<String, dynamic> variables) async {
    final QueryOptions options =
        QueryOptions(documentNode: gql(query), variables: variables);
    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
      throw result.exception;
    }

    print('GraphQLService result: ${result.data}');

    return result.data;
  }

  Future<dynamic> mutation(
      String mutation, Map<String, dynamic> variables) async {
    final MutationOptions options =
        MutationOptions(documentNode: gql(mutation), variables: variables);
    final QueryResult result = await _client.mutate(options);

    if (result.hasException) {
      print(result.exception.toString());
      throw result.exception;
    }

    print('GraphQLService result: ${result.data}');

    return result.data;
  }
}
