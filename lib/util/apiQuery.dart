import 'package:graphql_flutter/graphql_flutter.dart';
import '../data/models/dish.dart';
import '../data/models/user.dart';
import './extensions/common.dart';

class ApiQuery {
  GraphQLClient _client;
  SocketClient _subscriptionClient;

  ApiQuery()
      : _client = GraphQLClient(
          cache: InMemoryCache(),
          link: HttpLink(
            uri: 'https://recipeapi.hasura.app/v1/graphql',
          ),
        ),
        _subscriptionClient =
            SocketClient('ws://recipeapi.hasura.app/v1/graphql');

  Future<QueryResult> _query(String query) async =>
      await _client.query(QueryOptions(
        documentNode: gql(query),
      ));

  Future<QueryResult> _mutate(String query) async =>
      await _client.mutate(MutationOptions(
        documentNode: gql(query),
      ));

  Stream<SubscriptionData> _subscribe(String query) =>
      _subscriptionClient.subscribe(
          SubscriptionRequest(Operation(documentNode: gql(query))), true);

  Future<QueryResult> createUser(User user) {
    return _mutate('''
        mutation createAccount {
          insert_users(objects: {name: "${user.name}",phone_number: "${user.phoneNumber}",email: "${user.email}",
          password: "${user.password}"}) {
              affected_rows
              returning {
                id
            }
          }
        }
        ''');
  }

  Future<QueryResult> checkUser(User user) {
    return _query('''
      query checkUser{
        users(where: {_and: {user_name: {_eq: "${user.name}"}, password: {_eq: "${user.password}"}}}) {
          id
        }
      }
      ''');
  }

  Future<QueryResult> getDishesForUser(int userId, String date) {
    return _query('''
      query MyQuery {
        dishes(where: {_and: {user_id: {_eq: $userId}}}) {
          id
          name
          ingredient
          description
          dish_category 
        }
      }
    ''');
  }

  Future<QueryResult> addTodo(Dish dish) {
    return _mutate('''
      mutation addDish {
        insert_dishes_one(object: {name: "${dish.name}", ingredient: "${dish.ingredients}",
         description: "${dish.description}", dish_category: "${dish.dishCategory.getString()}"})
        {
          id
        }
       }
    ''');
  }
}
