# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Tag.create(name: "near_parking")
Tag.create(name: "# 駐車場から近い")
Tag.create(name: "# 駐車場から遠い")
Tag.create(name: "# 階段あり")
Tag.create(name: "# 店外段差あり")
Tag.create(name: "# 店内段差あり")
Tag.create(name: "# 車椅子通行可能")
Tag.create(name: "# 歩行車通行可能")
Tag.create(name: "# 名古屋市")
Tag.create(name: "# 愛知県")
Tag.create(name: "# 東海")