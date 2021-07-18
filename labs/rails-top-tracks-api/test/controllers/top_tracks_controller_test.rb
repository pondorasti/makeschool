require 'test_helper'

class TopTracksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @top_track = top_tracks(:one)
  end

  test "should get index" do
    get top_tracks_url
    assert_response :success
  end

  test "should get new" do
    get new_top_track_url
    assert_response :success
  end

  test "should create top_track" do
    assert_difference('TopTrack.count') do
      post top_tracks_url, params: { top_track: { album_name: @top_track.album_name, personal_ranking: @top_track.personal_ranking, track_name: @top_track.track_name } }
    end

    assert_redirected_to top_track_url(TopTrack.last)
  end

  test "should show top_track" do
    get top_track_url(@top_track)
    assert_response :success
  end

  test "should get edit" do
    get edit_top_track_url(@top_track)
    assert_response :success
  end

  test "should update top_track" do
    patch top_track_url(@top_track), params: { top_track: { album_name: @top_track.album_name, personal_ranking: @top_track.personal_ranking, track_name: @top_track.track_name } }
    assert_redirected_to top_track_url(@top_track)
  end

  test "should destroy top_track" do
    assert_difference('TopTrack.count', -1) do
      delete top_track_url(@top_track)
    end

    assert_redirected_to top_tracks_url
  end
end
