import 'dart:async';

import 'package:aqueduct/aqueduct.dart';
//import 'package:users/users.dart';
    
class UsersController extends ResourceController {
  final _users = [
    {'id':11, 'name':'Mr. Nice'},
    {'id':12, 'name':'Ivanov I.I.'},
    {'id':13, 'name':'Bombasto I.A.'},
    {'id':14, 'name':'Petroff I.I.'},
    {'id':15, 'name':'Sidoroff K.I.'},
  ];

  @Operation.get()
  Future<Response> getAllUsers() async {
    return Response.ok(_users);
  }

  @Operation.get('id')
  Future<Response> getUserById(@Bind.path('id') int id) async {
    final user = _users.firstWhere((user) => user['id'] == id, orElse: () => null);
    if (user == null) {
      return Response.notFound();
    }

    return Response.ok(user);
  }
  
  
} 