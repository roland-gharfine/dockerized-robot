*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${search_input}  xpath=//input[@data-testid="search-input"]
${wishlist_counter}  xpath=//span[@data-testid="wishlist-counter"]
${wishlist_icon}  xpath=//*[@class="icon-wishlist"]

*** Keywords ***

Search For String
    [Documentation]  Enters a search string in the search field and clicks on search
    [Arguments]  ${search_text}
    Input Text  ${search_input}  ${search_text}
    Press Keys  ${search_input}  ENTER


Verify Item Added To Wishlist
    [Documentation]  Verifies that an item was added to the wishlist by checking the heart icon in the top navigation pane
    Element Text Should Be  ${wishlist_counter}  1


Go To Wishlist Page
    [Documentation]  Navigates to the wishlist page from the top navigation
    Click Element  ${wishlist_icon}