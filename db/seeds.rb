# Users
user_1 = User.create( username: 'ofca',
                      email: 'sven.dupli@gmail.com',
                      password: 'supersecret',
                      admin: true)

# Posts
post_1 = Post.new
post_1.title = 'Proslava useljenja novih ZIP startupa!'
post_1.body = "Sutra, 02.04. u ZIP.Factoryju imamo cjelodnevno slavlje povodom sluzbenog useljenja 7 novih startup timova.Sutra, 02.04. u ZIP.Factoryju imamo cjelodnevno slavlje povodom sluzbenog useljenja 7 novih startup timova.Sutra, 02.04. u ZIP.Factoryju imamo cjelodnevno slavlje povodom sluzbenog useljenja 7 novih startup timova.Sutra, 02.04. u ZIP.Factoryju imamo cjelodnevno slavlje povodom sluzbenog useljenja 7 novih startup timova.Sutra, 02.04. u ZIP.Factoryju imamo cjelodnevno slavlje povodom sluzbenog useljenja 7 novih startup timova."
post_1.user = user_1
post_1.save

post_2 = Post.new
post_2.title = 'ZIP DrinkUp with the Startup Sauna crew @ The Movie Pub'
post_2.body = 'This week Starup Sauna guys are coming!'
post_2.user = user_1
post_2.save

# Events
event_1 = Event.create( title: 'Mentor Showcase',
                        description: 'Mentors gather to criticise your arses!',
                        beginning: Time.now + 60)
event_2 = Event.create( title: 'Hackathon',
                        description: 'Where hackers meet and crazy sh*t happens :)',
                        beginning: Time.now + 10.days,
                        ending: Time.now + 11.days)
event_3 = Event.create( title: 'Demo Day',
                        description: 'To review the progress',
                        beginning: Time.now + 22.days,
                        ending: Time.now + 22.days)
