# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





Tag.create!(
  [
    {name: "駐車場から近い"},
    {name: "駐車場から遠い"},
    {name: "階段あり"},
    {name: "店外段差あり"},
    {name: "店内段差あり"},
    {name: "車椅子通行可能"},
    {name: "歩行車通行可能"},
    {name: "車椅子でのトイレ利用可能"},
    {name: "車椅子でのトイレ利用困難"},
    {name: "名古屋市"},
    {name: "愛知県内"},
    {name: "東海"}
    ]
  )

User.create!(
[
  {email: "hirosi@test.com",
    name: "田島博",
    password: "password",
    age: 1,
    sex: 0,
    telephone: "03388951150",
    introduction: "サイト管理者です",
    is_admin: "true"},
  {email: "reiko@test.com",
    name: "秋田令子",
    password: "password",
    age: 3,
    sex: 1,
    telephone: "75638476629",
    introduction: "外出に車椅子を使っています"},
  {email: "miki@test.com",
    name: "佐藤美紀",
    password: "password",
    age: 0,
    sex: 1,
    telephone: "13754387146",
    introduction: "現在、介護の仕事をしています"}
  ]
)

Shop.create!(
  [
    {name: "ブックカフェえん",
    introduction: "栄にありますが、駐車場は比較的近いです。",
    shop_hp: "bookcafe-enn@test",
    address: "愛知県名古屋市中区栄3丁目5-1",
    telephone: "70543854433",
    image: File.open("#{Rails.root}/db/fixtures/sample-shop1.jpg"),
    user_id: 1},
    {name: "ペスカトーレ",
    introduction: "メニューも多くリーズナブルなスペイン料理店です。",
    shop_hp: "pescatore_nagoya@test", address: "愛知県名古屋市東区矢田南4丁目102-3",
    telephone: "48411307538",
    image: File.open("#{Rails.root}/db/fixtures/sample-shop2.jpg"),
    user_id: 1},
    {name: "タンタン",
    introduction: "車椅子でも入れる中華料理店です。",
    shop_hp: "tantan-toyota@test",
    address: "愛知県豊田市西町3丁目60番地",
    telephone: "04286997841",
    image: File.open("#{Rails.root}/db/fixtures/sample-shop3.jpg"),
    user_id: 1}
  ]
)

ShopTag.create!(
  [
    {shop_id: 1,
    tag_id: 1},
    {shop_id: 1,
    tag_id: 4},
    {shop_id: 1,
    tag_id: 6},
    {shop_id: 1,
    tag_id: 10},
    {shop_id: 2,
    tag_id: 2},
    {shop_id: 2,
    tag_id: 3},
    {shop_id: 2,
    tag_id: 7},
    {shop_id: 2,
    tag_id: 9},
    {shop_id: 2,
    tag_id: 10},
    {shop_id: 3,
    tag_id: 1},
    {shop_id: 3,
    tag_id: 6},
    {shop_id: 3,
    tag_id: 7},
    {shop_id: 3,
    tag_id: 8},
    {shop_id: 3,
    tag_id: 11}
  ]
)

Comment.create!(
  [
   {user_id: 2,
    shop_id: 3,
    body: "バリアフリー環境が整っており、娘とよく行くお店です。味も美味しいです。"
   },
   {user_id: 3,
    shop_id: 1,
    body: "近場の駐車場に入れられることが多く、栄でおすすめのお店の一つです！"
   }
  ]
)