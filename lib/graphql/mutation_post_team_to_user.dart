String addTeam = r'''
      mutation addTeamToUser($userId: ID!, $teamId: ID!) {
        updateUser(id: $userId, data: { team: { connect: { id: $teamId } } }) {
          id
          email
          firstName
          lastName
          team {
            id
            apiId
            name
            logo
            stadium
            players {
              name
              position
            }
          }
        }
      }
    ''';
