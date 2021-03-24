*** Settings ***
Resource  Objects/HomePage.robot
Resource  Objects/TopNav.robot
Resource  Objects/SearchResults.robot
Resource  Objects/SignIn.robot
Resource  Objects/WishList.robot

*** Keywords ***
I am on the WestwingNow home page
	Log  "I am on the WestwingNow home page"
	HomePage.Load
	HomePage.Verify Page Loaded
	HomePage.Accept Cookies


I search for "${text}"
	TopNav.Search For String  ${text}


I should see product listing page with a list of products
	SearchResults.Verify Page Loaded
    SearchResults.Do Not Register
	SearchResults.Verify List Of Products Exists


I click on wishlist icon of the first found product
	SearchResults.Add First Element To Wishlist


I should see the login/registration overlay
    Log  I should see the login/registration overlay
	SignIn.Verify Login Overlay Is Present


I switch to login form of the overlay
	Log  I switch to login form of the overlay
	SignIn.Switch To Login Form


I log in with my "${account}" account credentials
	Log  I log in with my "TEST" account credentials
	SignIn.Login As  ${account}


the product should be added to the wishlist
	Log  the product should be added to the wishlist
	TopNav.Verify Item Added To Wishlist
	SearchResults.Verify First Item Added To Wishlist


I go to the wishlist page
	Log  I go to the wishlist page
	TopNav.Go To Wishlist Page
    WishList.Verify Page Loaded

I delete the product from my wishlist
	Log  I delete the product from my wishlist
	WishList.Delete First Item From Wishlist
