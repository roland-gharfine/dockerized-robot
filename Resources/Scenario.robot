

*** Keywords ***

I search for "möbel"
	Log  "I search for mobel"


I should see product listing page with a list of products
	Log  "I should see product listing page with a list of products"


I click on wishlist icon of the first found product
	Log  "I click on wishlist icon of the first found product"


I should see the login/registration overlay
	Log  "I should see the login/registration overlay"


I switch to login form of the overlay
	Log  "I switch to login form of the overlay"


I log in with "my_test_account" credentials
	Log  I log in with "my_test_account" credentials


the product should be added to the wishlist
	Log  the product should be added to the wishlist


I go to the wishlist page
	Log  I go to the wishlist page 


I delete the product from my wishlist
	Log  I delete the product from my wishlist
