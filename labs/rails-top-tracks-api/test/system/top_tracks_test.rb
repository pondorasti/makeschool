require "application_system_test_case"

class TopTracksTest < ApplicationSystemTestCase
  setup do
    @top_track = top_tracks(:one)
  end

  test "visiting the index" do
    visit top_tracks_url
    assert_selector "h1", text: "Top Tracks"
  end

  test "creating a Top track" do
    visit top_tracks_url
    click_on "New Top Track"

    fill_in "Album Name", with: @top_track.album_name
    fill_in "Personal Ranking", with: @top_track.personal_ranking
    fill_in "Track Name", with: @top_track.track_name
    click_on "Create Top track"

    assert_text "Top track was successfully created"
    click_on "Back"
  end

  test "updating a Top track" do
    visit top_tracks_url
    click_on "Edit", match: :first

    fill_in "Album Name", with: @top_track.album_name
    fill_in "Personal Ranking", with: @top_track.personal_ranking
    fill_in "Track Name", with: @top_track.track_name
    click_on "Update Top track"

    assert_text "Top track was successfully updated"
    click_on "Back"
  end

  test "destroying a Top track" do
    visit top_tracks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Top track was successfully destroyed"
  end
end
