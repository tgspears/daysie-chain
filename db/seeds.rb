
User.create!([
  {firstname: "Aida", lastname: "Mengistu", email: "aida@mengistu.com", tel: "12063711202", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Alex", lastname: "Nguyen", email: "alex@nguyen.com", tel: "12065567444", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Allie", lastname: "Moses", email: "allie@moses.com", tel: "15305267767", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Ben", lastname: "Piggot", email: "ben@piggot.com", tel: "12062513317", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Bennett", lastname: "Lin", email: "bennett@lin.com", tel: "18183576453", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Cody", lastname: "Barrus", email: "cody@barrus.com", tel: "14252954463", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Dan", lastname: "McGough", email: "dan@mcgough.com", tel: "12069402064", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Daniel", lastname: "Smith", email: "daniel@smith.com", tel: "13605958585", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Greg", lastname: "Wyszynski", email: "greg@wyszynski.com", tel: "14406684858", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Jake", lastname: "Rohr", email: "jake@rohr.com", tel: "12069488340", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Katie", lastname: "Gilmur", email: "katie@gilmur.com", tel: "12537205447", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Lauren", lastname: "Go", email: "lauren@go.com", tel: "16507034555", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Matt", lastname: "Kiser", email: "matt@kiser.com", tel: "17077387948", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Nick", lastname: "Cronquist", email: "nick@cronquist.com", tel: "12068861432", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Patrick", lastname: "Eldridge", email: "patrick@eldridge.com", tel: "14055179714", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Riley", lastname: "Joseph", email: "riley@joseph.com", tel: "14058023368", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Sean", lastname: "Villagracia", email: "sean@villagracia.com", tel: "19162260509", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Zach", lastname: "Huntting", email: "zach@huntting.com", tel: "12064995653", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Sarah", lastname: "Hanley", email: "sarah@hanley.com", tel: "14436314900", password_digest: nil, provider_id: nil, provider: nil, provider_hash: nil, image: nil, active: nil},
  {firstname: "Trevor", lastname: "Spears", email: "tg.spears@gmail.com", tel: "14252050766", password_digest: "$2a$10$5ke3M.RfEPh1aYaehmQnTuSSRE0qU5hvJJPEGwreYt9oB0D2KbYcO", provider_id: nil, provider: nil, provider_hash: nil, image: "gecopflarqsddjgwpwiw", active: nil}
])

Group.create!([
  {name: "WDI-SEA-02", size: 25, status: nil, user_id: 20, image: "emvorewykhyskqh1jzmm"}
])
Event.create!([
  {name: "Demo Day!", desc: "Time to show off our hard work!", max: 25, loc: "Classroom 1", date: nil, time: nil, group_id: 1, min: nil, day: nil, active: nil}
])
Membership.create!([
  {group_id: 1, user_id: 20, admin: true, block: nil},
  {group_id: 1, user_id: 2, admin: false, block: nil},
  {group_id: 1, user_id: 3, admin: true, block: nil},
  {group_id: 1, user_id: 4, admin: false, block: nil},
  {group_id: 1, user_id: 5, admin: false, block: nil},
  {group_id: 1, user_id: 6, admin: false, block: nil},
  {group_id: 1, user_id: 7, admin: false, block: nil},
  {group_id: 1, user_id: 8, admin: false, block: nil},
  {group_id: 1, user_id: 9, admin: false, block: nil},
  {group_id: 1, user_id: 11, admin: false, block: nil},
  {group_id: 1, user_id: 12, admin: false, block: nil},
  {group_id: 1, user_id: 13, admin: false, block: nil},
  {group_id: 1, user_id: 14, admin: false, block: nil},
  {group_id: 1, user_id: 15, admin: false, block: nil},
  {group_id: 1, user_id: 16, admin: false, block: nil},
  {group_id: 1, user_id: 17, admin: false, block: nil},
  {group_id: 1, user_id: 18, admin: false, block: nil},
  {group_id: 1, user_id: 19, admin: false, block: nil},
  {group_id: 1, user_id: 10, admin: true, block: nil},
  {group_id: 1, user_id: 1, admin: false, block: nil}

])

