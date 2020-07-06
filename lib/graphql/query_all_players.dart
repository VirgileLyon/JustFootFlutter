String query_all_players = r'''
query getPlayers {
  allPlayers {
    id
    name
    position
  }
}
''';