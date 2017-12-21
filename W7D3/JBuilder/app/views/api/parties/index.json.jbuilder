json.array! @parties do |party|
  json.name party.name
  json.location party.location
  json.guests party.guests, partial: 'api/guests/guest', as: :guest
end
