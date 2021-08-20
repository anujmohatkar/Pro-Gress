require "application_system_test_case"

class PrListsTest < ApplicationSystemTestCase
  setup do
    @pr_list = pr_lists(:one)
  end

  test "visiting the index" do
    visit pr_lists_url
    assert_selector "h1", text: "Pr Lists"
  end

  test "creating a Pr list" do
    visit pr_lists_url
    click_on "New Pr List"

    fill_in "Title", with: @pr_list.title
    click_on "Create Pr list"

    assert_text "Pr list was successfully created"
    click_on "Back"
  end

  test "updating a Pr list" do
    visit pr_lists_url
    click_on "Edit", match: :first

    fill_in "Title", with: @pr_list.title
    click_on "Update Pr list"

    assert_text "Pr list was successfully updated"
    click_on "Back"
  end

  test "destroying a Pr list" do
    visit pr_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pr list was successfully destroyed"
  end
end
