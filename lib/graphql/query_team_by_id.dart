String query_team_by_id = r'''
      query getMyTeams($apiId: Int!) {
        allTeams(where: {apiId: $apiId}) {
          id
          apiId
          name
          logo
          stadium
          players {
            name
            position
            ratings {
              note
              game {
                homeTeam {
                  name
                }
                awayTeam {
                  name
                }
                eventDate
                round
                status
              }
              createdBy {
                firstName
                lastName
              }
            }
          }
        }
}
''';
