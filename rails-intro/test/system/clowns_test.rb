require "application_system_test_case"

class ClownsTest < ApplicationSystemTestCase
  setup do
    @clown = clowns(:one)
  end

  test "visiting the index" do
    visit clowns_url
    assert_selector "h1", text: "Clowns"
  end

  test "creating a Clown" do
    visit clowns_url
    click_on "New Clown"

    fill_in "Age", with: @clown.age
    check "Is cool" if @clown.is_cool
    fill_in "Name", with: @clown.name
    fill_in "Phrase", with: @clown.phrase
    click_on "Create Clown"

    assert_text "Clown was successfully created"
    click_on "Back"
  end

  test "updating a Clown" do
    visit clowns_url
    click_on "Edit", match: :first

    fill_in "Age", with: @clown.age
    check "Is cool" if @clown.is_cool
    fill_in "Name", with: @clown.name
    fill_in "Phrase", with: @clown.phrase
    click_on "Update Clown"

    assert_text "Clown was successfully updated"
    click_on "Back"
  end

  test "destroying a Clown" do
    visit clowns_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clown was successfully destroyed"
  end
end
