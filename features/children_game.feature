Feature: Children's Game
  In order to mimic the children's game
  As a CLI
  I want to be able to get the output of the game from CLI

  Scenario: Play a game where the inital position is less than the total children
    When I run `run play -t 5 -p 3`
    Then the output should contain "Child #3 is removed from the circle\nChild #1 is removed from the circle\nChild #5 is removed from the circle\nChild #2 is removed from the circle\nwinner is child #4"

  Scenario: Play a game where the inital position is greater than the total children
    When I run `run play -t 5 -p 6`
    Then the output should contain "Child #1 is removed from the circle\nChild #3 is removed from the circle\nChild #2 is removed from the circle\nChild #5 is removed from the circle\nwinner is child #4"