FactoryBot.define do
  factory :introduction do
    genre_id        {2}
    description  {"風船作れます"}
    twitter_id   {"@tarou1234"}
    association :performer

    after(:build) do |introduction|
      introduction.image.attach(io: File.open('public/images/photo-1561074666-aa94bbcda3d4.jpeg'), filename: 'photo-1561074666-aa94bbcda3d4.jpeg')
    end  
  end
end
