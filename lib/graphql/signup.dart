String signup = r''' 
    mutation SignUp($firstName: String!, $lastName: String!, $email: String!, $password: String!) {
      createUser(
        data: {
        firstName: $firstName,
        lastName: $lastName,
        email : $email,
        password: $password
        }
      ) {
          id
          firstName
          lastName
          email
      }
    }
    ''';
