*** Settings ***
Library  SeleniumLibrary
Resource  ../../Config/Config.robot

*** Variables ***
${search_results_title}  Möbel online kaufen | Möbel Online Shop | WestwingNow
${search_results_items}  xpath=//div[@data-testid="generic-product"]
${registration_form}  xpath=//div[@data-testid="shop-to-club-popup-wrapper"]
${add_to_wishlist_icon}  xpath=//div[@data-testid="wishlist-icon"][1]
${first_item_wishlist_confirmed}  xpath=//div[@data-testid="wishlist-icon"]//*[@data-is-selected="true"]


*** Keywords ***

Verify Page Loaded
    [Documentation]  Verifies that the search results page was loaded by checking the title of the page.
    Log  Verifying search results are loaded
    Wait Until Keyword Succeeds  15s  10s  Title Should Be  ${search_results_title}


Verify List Of Products Exists
    [Documentation]  Verifies that there is a non-zero amount of products returned as a result of our search.
    Log  Verifying list of Products exists
    #Element Text Should
    ${count} =  Get Element Count  ${search_results_items}
    Should Be True  ${count} > 0


Do Not Register
    [Documentation]  Clears the registration pop-up by clicking outside it
    Log  Closing registration pop-up if needed
    ${should_close_registration}=  Run Keyword And Return Status  Page Should Contain Element  ${registration_form}

    # A little bit of a hack to click in the empty space on the page, but there aren't better alternatives for now
    Run Keyword If  ${should_close_registration}  Click Element At Coordinates  ${registration_form}  300  300
    Wait Until Element Is Not Visible  ${registration_form}


Add First Element To Wishlist
    [Documentation]  Adds the first search result to wishlist by clicking on the first heart icon we find on the page
    Log  Adding first element to wishlist

    # We could potentially add scrolling here
    Click Element  ${add_to_wishlist_icon}


Verify First Item Added To Wishlist
    [Documentation]  Verify that the first item was added to the wishlist by checking the heart icon is black instead of transparent
    Element Should Be Visible  ${first_item_wishlist_confirmed}