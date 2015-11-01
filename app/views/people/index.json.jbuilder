json.array!(@people) do |person|
  json.extract! person, :id, :name, :birthdate, :deathdate, :story
  json.url person_url(person, format: :json)
end
