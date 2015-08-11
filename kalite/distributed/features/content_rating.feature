Feature: Content Rating
    Tests for the content rating form/widget, which should appear on content pages (video, exercises, etc)

    @as_student
    Scenario: User rates an unrated item
        Given I am on a content page
        Then I see a feedback form
        When I fill out the form
        Then my feedback is displayed

    @as_student
    Scenario: User alters a star rating
        Given I have filled out a feedback form
        When I alter a star rating
        Then the altered rating is displayed

    @as_student
    Scenario: User alters text feedback
        Given I have filled out a feedback form
        When I click the edit button
        And I change the text
        And I submit it
        Then the altered text is displayed

    @as_student
    Scenario: User deletes a rating
        Given I have filled out a feedback form
        Then I see a delete button
        When I delete my feedback
        Then I see a new form

    @as_admin
    Scenario: Admin exports user ratings
        Given some user feedback exists
        When I export csv data
        Then the user feedback is present