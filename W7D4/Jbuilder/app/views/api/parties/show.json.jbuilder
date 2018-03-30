json.name @party.name
json.location @party.location

json.guests do
  json.array! @party.guests.each do |guest|
      json.extract! guest,:id, :name,:age,:favorite_color
      json.gifts guest.gifts, :title
  end
end
