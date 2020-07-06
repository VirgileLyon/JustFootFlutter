String getRankingQuery = r'''
      query getRanking {
        allRankings {
          rank,
          logo,
          teamName,
          points,
        }
      }
  ''';
