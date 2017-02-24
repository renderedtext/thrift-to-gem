namespace rb Users

struct User {
1: string username;
2: string bio;
}

service Users {
  list<User> list_users();
}
