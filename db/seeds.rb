# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Trap.delete_all
Request.delete_all
Trap.create(name: 'secret1')
Trap.create(name: 'secret2')

Request.create(dom_name: 'mysecreturl1', request_date: Time.now, remote_ip: '123.123.123')
Request.create(dom_name: 'mysecreturl2', request_date: Time.now, remote_ip: '124.124.124')
