
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../constatnt/app_consstant.dart';

HttpLink httpLink = HttpLink(
  'http://accuratess.mywire.org:8000/graphql', // replace with your GraphQL endpoint
);
 AuthLink authLink = AuthLink(getToken: () async => 'Bearer ${AppConst.TOKEN}');
 Link link = authLink.concat(httpLink);
  ValueNotifier<GraphQLClient> graphQLClient =  ValueNotifier<GraphQLClient>(
  GraphQLClient(
    link: link,
    cache: GraphQLCache(),
  ),
);
//send

//QueryResult result = await graphQLClient.query(QueryOptions(document: gql(fetchUserData)));
//
