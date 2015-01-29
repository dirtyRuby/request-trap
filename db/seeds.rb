# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
=begin
Trap.delete_all
Request.delete_all
Trap.create(name: 'secret1')
Trap.create(name: 'secret2')
=end

Request.create(trap_id: 1, remote_ip: '123.123.123')
Request.create(trap_id: 2, remote_ip: '124.124.124')
