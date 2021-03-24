*** Settings ***
Documentation  This suite contains a Gherkin scenario for a provided test case on Westwing.de
Resource  ../Resources/Common.robot
Resource  ../Resources/Scenario.robot


Suite Setup  Common.Start Suite
Suite Teardown  Common.Finish Suite
Test Teardown  Common.Finish Test


*** Test Cases ***

Should be able to add a product to and then delete it from my wishlist
	[Documentation]  We would like to know whether a registered user can add an item to their wishlist and then delete it. For this we need a registered user on the website. We also will verify that the wishlist counter shows exactly 1. Once we're done with the scenario, we will log out in order to decouple the test from other possible tests and from future runs of the same test.
	[Tags]  Gherkin
	Given I am on the WestwingNow home page
	When I search for "möbel"
	Then I should see product listing page with a list of products
	When I click on wishlist icon of the first found product
	Then I should see the login/registration overlay
	When I switch to login form of the overlay
	And I log in with my "TEST" account credentials
	Then the product should be added to the wishlist
	And I go to the wishlist page
	And I delete the product from my wishlist

