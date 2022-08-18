json.form render(partial: "follow", formats: :html, locals: {artist: @artist})
json.follow_count render(partial: "followercount", formats: :html, locals: {artist: @artist})
