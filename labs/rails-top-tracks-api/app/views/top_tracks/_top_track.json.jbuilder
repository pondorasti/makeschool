json.extract! top_track, :id, :track_name, :album_name, :personal_ranking, :created_at, :updated_at
json.url top_track_url(top_track, format: :json)
