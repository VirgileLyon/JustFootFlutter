String signin = r'''
      mutation Signin($email: String!, $password: String!) {
        authenticateUserWithPassword(email: $email, password: $password) {
          token
          item {
            id
            email
            firstName
            lastName
          }
        }
      }
          ''';