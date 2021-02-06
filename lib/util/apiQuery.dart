import 'package:graphql_flutter/graphql_flutter.dart';
import '../util/enums/category.dart';
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
        users(where: {_and: {phone_number: {_eq: "${user.phoneNumber}"}, password: {_eq: "${user.password}"}}}) {
          id
        }
      }
      ''');
  }

  Future<QueryResult> getUser(int userId) {
    return _query('''
      query MyQuery {
        users_by_pk(id: "$userId") {
          id
          name
          phone_number
          email
        }
      }
      ''');
  }

  Future<QueryResult> getLatestDishes() {
    return _query('''
      query MyQuery {
        dishes(where: {created_at: {_gt: "${DateTime.now().subtract(Duration(days: 2)).toString()}"}}) {
          id
          name
          ingredients
          description
          dish_category
          created_at
          user {
            id
            name
            phone_number
            email
            password
          }
        }
      }
    ''');
  }

  Future<QueryResult> getDishByCategory(DishCategory category) {
    return _query('''
      query MyQuery {
        dishes(where: {dish_category: {_eq: "${category.getString()}"}}) {
          id
          name
          ingredients
          description
          dish_category
          created_at
          user {
            id
            name
            phone_number
            email
            password
          }      
        }
      }
    ''');
  }

  Future<QueryResult> getDishesForUser(int userId) {
    return _query('''
      query MyQuery {
        dishes(where: {user_id: {_eq: $userId}}) {
          id
          name
          ingredients
          description
          dish_category 
          created_at
        }
      }
    ''');
  }

  Future<QueryResult> addDish(Dish dish) {
    return _mutate('''
      mutation addDish {
        insert_dishes_one(object: {name: "${dish.name}", ingredients: "${dish.ingredients}",
         description: "${dish.description}", dish_category: "${dish.dishCategory.getString()}", user_id:"${dish.userId}"}){
          id
        }
       }
    ''');
  }

  Future<QueryResult> getDishesByName(String name,int userId) {
    return _query('''
      query MyQuery {
        dishes(where: {_and: {user_id: {_neq: "$userId"}, name: {_eq: "$name"}}}) {
          id
          name
          ingredients
          description
          dish_category
          created_at
          user_id
          user {
            id
            name
            phone_number
            email
            password
          }
        }
      }
      ''');
  }
}
