# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

hongli = Partner.create!(:name => 'Hongli Lai')
ninh   = Partner.create!(:name => 'Ninh Bui')

MoneyAccount.create!(:name => "Phusion bankaccount")
MoneyAccount.create!(:name => "Phusion credit card")
MoneyAccount.create!(:name => "Phusion Paypal")
hongli.money_accounts.create!(:name => "Hongli's privegeld")
ninh.money_accounts.create!(:name => "Ninh's privegeld")

Folder.create!(:name => 'Financieel Q3-2011')
