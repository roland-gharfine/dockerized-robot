*** Settings ***
Library  SeleniumLibrary


*** Variables ***

${wishlist_title}  Meine Wunschliste | WestwingNow
${location}  https://www.westwingnow.de/customer/wishlist/index/
${delete_item}  xpath=//ul[@class="listProducts"]/li/button[contains(@class, "delete")]
${add_items_message}  xpath=//p[contains(text(), "Sie Produkte")]


*** Keywords ***

Verify Page Loaded
    [Documentation]  Verify that the wishlist page was loaded after navigation
    Wait Until Location Is  ${location}
    Wait Until Keyword Succeeds  15s  10s  Title Should Be  ${wishlist_title}


Delete First Item From Wishlist
    [Documentation]  Deletes the first item from the wishlist, then verifies that it does not exist anymore. It also verifies that the wishlist is empty by checking the message that is displayed in that case.
    Click Element  ${delete_item}
    Wait Until Element Is Not Visible  ${delete_item}
    Page Should Contain Element  ${add_items_message}


#Ideally we want the ability to delete any item at any position in the wishlist