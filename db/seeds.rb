unless Admin.exists?(id: 1)
Admin.create!(
  email: "test@test",
  password: "password"
)
end

unless Customer.exists?(id: 1 ... 10)
  10.times do |n|
    Customer.create!(
    # n + 1で数字が重複しないようにする
      email: "test#{n + 1}@test.com",
      family_name: "田中#{n + 1}",
      family_name_kana: "タナカ#{n + 1}",
      given_name: "太郎#{n + 1}",
      given_name_kana: "タロウ#{n + 1}",
      zip_code: "ddd#{n + 1}",
      address: "sss#{n + 1}",
      phone_number: "xxx#{n + 1}",
      password: "password"
    )
  end
end

unless Genre.exists?(id: 1 ... 10)
  10.times do |n|
    Genre.create!(
      name: "name#{n + 1}"
    )
  end
end

unless Item.exists?(id: 1 ... 10)
  10.times do |n|
    Item.create!(
      # genre_id: Genre.find_by(name: "name#{n + 1}").id,
      genre_id: Genre.find("#{n+1}").id,
      name: "item#{n + 1}",
      price: "1000#{n + 1}",
      introduction: "test#{n + 1}",
      is_sold: "false"
    )
  end
end

