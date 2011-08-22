# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MoneyAccount.create!(:name => "Phusion bankaccount")
MoneyAccount.create!(:name => "Phusion credit card")
MoneyAccount.create!(:name => "Phusion Paypal")
MoneyAccount.create!(:name => "Hongli's privefondsen")
MoneyAccount.create!(:name => "Ninh's privefondsen")

