Feature: Find Github Mates
  I will find my github mate thanks to the github and google map API.

Scenario: I will locate my Github's mates
  Given I'm on the root page with a form containing two inputs named "User" and "Repo"
  When I fill the form with user = "rails", repo = "rails" and submit it
  Then I should see a Google Map with markers representing commiters of the repo
  And Every markers should have an info window containing commiter's infos.
  And All commiters who don't have any location informations should be listed under the map. And Obviously every thing must be tested with Rspec / Capybara / VCR