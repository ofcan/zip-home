# Users
user_1 = User.create( username: 'ofca',
                      email: 'sven.dupli@gmail.com',
                      password: 'supersecret',
                      role: 'zip_team_member',
                      bio: 'Startup guy, swell and fly!',
                      realname: 'Sven Duplic')
user_2 = User.create( username: 'ivo',
                      email: 'ivo@example.com',
                      password: 'supersecret',
                      role: 'founder')
user_3 = User.create( username: 'dave',
                      email: 'dave@example.com',
                      password: 'supersecret',
                      role: 'advisor')
user_4 = User.create( username: 'lukaabrus',
                      email: 'luka@example.com',
                      password: 'supersecret',
                      role: 'mentor')
user_5 = User.create( username: 'joe',
                      email: 'joe@example.com',
                      password: 'supersecret')

# Startups
startup_1 = Startup.create( name: 'GitArchitect',
                            short_description: 'Github for Architects',
                            long_description: "Version control, **project collaboration and sharing** across architecture and construction",
                            logo: File.open(Rails.root.join('app', 'assets', 'images', 'startups', 'octocat.png')))
startup_2 = Startup.create( name: '5 minuta',
                            short_description: 'Design and Dev guys for 21st century!',
                            long_description: "We're a young and vibrant company based in Zagreb, Croatia. Founded in 2007 with 40 employees, we work primarily in mobile development area serving customers from more than 10 countries world wide. Our focus are new technologies and next-generation apps.",
                            logo: File.open(Rails.root.join('app', 'assets', 'images', 'startups', 'pet_minuta_logo.png')))
# Startupships
startupship_1 = Startupship.create( user: user_1,
                                    startup: startup_1)
startupship_2 = Startupship.create( user: user_4,
                                    startup: startup_2)

# Batches
batch_1 = Batch.create( title: 'ZIP Winter 2012' )
batch_1.startups << startup_1

batch_2 = Batch.create( title: 'ZIP Spring 2013' )
batch_2.startups << startup_2

batch_3 = Batch.create( title: 'ZIP Summer 2013' )

# Posts
post_1 = Post.new
post_1.title = 'Proslava useljenja novih ZIP startupa!'
post_1.featured_image = File.open(Rails.root.join('app', 'assets', 'images', 'posts', 'daft_punk.jpg'))
post_1.body = "
  Last week in [I_MM Lab in Zagreb](http://immmedialab.wordpress.com/), a group of awesome [Biotweakers](https://www.facebook.com/Biotweaking?fref=ts) and I played with strawberry DNA. **How awesome is that!? :)**

  ![I_MM logo](http://svenduplic.com/assets/images/biotech_imm.jpg) *<small>I_MM Media Lab, where the workshop took place</small>*

  No, really - how awesome is that! The fact that students from Croatia can play with the essence of an organism; to hold it in their hands; to observe it and to tinker with it, and not spend more than 20$ doing it, well that just blows my mind. And things are only going to get better.

  ![Heating water with ultra sound](http://svenduplic.com/assets/images/biotech_ultra_sound.jpg)
  *<small>Ultra sound helps break DNA</small>*

  With the prices of biotech equipement dropping everyday, more and more people get access to it, wich always leads to more and more interesting things. Machines like [PCR](http://en.wikipedia.org/wiki/Thermal_cycler) used to be exclusive only to the finest laboratories, [and now you can get them for 599$. Hell, you can even build one yourself since the thing is full open source.](http://openpcr.org/)

  ![Strawberry DNA](http://svenduplic.com/assets/images/biotech_strawberry_dna.jpg)
  *<small>The extracted strawberry DNA</small>*

  You can fill the bottle with dirt and have it [produce electricity](http://www.keegotech.com/ScienceKits/MudWatt). You can [listen to cockroach neurons](http://backyardbrains.com/) firing the electrical signals as you touch the hairs on its legs. [You can look at your own genes and explore them](http://www.youtube.com/watch?v=zrejvnVfZJE). And that is just the tip of the ice berg.

  ![Biotech pipeta](http://svenduplic.com/assets/images/biotech_pipeta.jpg)
  *<small>Putting strawberry DNA in the gel</small>*

  Accompanying all that (and not surprising), communities are popping all over like crazy. And the community is awesome! [Guys that did the experiment with strawberry DNA with me](https://www.facebook.com/Biotweaking) explained me patiently the entire process with terminology a 5 year old would understand.

  ![Rhino poo](http://svenduplic.com/assets/images/biotech_rhino_poo.jpg)
  *<small>They even got rhino poo in a box. Told you these guys are nuts. :)</small>*

  The whole thing reminds of the begginings of the computer revolution. And the fact that biotech is stepping in an already exciting world of Arduinos, Open Source goodies and crazy hackers makes me crazy of excitement. I don't know about you, but [I'm going to go brush up on my bio-knowledge.](https://www.khanacademy.org/science/biology) Hack on! :)"
post_1.user = user_1
post_1.save

post_2 = Post.new
post_2.featured_image = File.open(Rails.root.join('app', 'assets', 'images', 'posts', 'microryza.jpg'))
post_2.title = 'ZIP DrinkUp with the Startup Sauna crew @ The Movie Pub'
post_2.body = "
I have been trying to find the workflow common denominator derived from various projects I've done lately. Despite being scaterred across different fields (writing, design, programming, architecture) I've noticed very similar patterns in all of them. Some things always worked, and some always didn't.  Here's what I found out.

### Find the stuff that works for you
There are countless methods and patterns for getting stuff done out there and it is easy to be overwhelmed. I've tried a lot of them but neither worked out perfectly. Some things I loved, some I hated.  The parts that I loved though, I took out and moved to another method, forming a hybrid method-thingy of my own I proudly and self-importantly call - **the Clover method.** Here's a little doodle of it:

![The Clover doodle](http://svenduplic.com/assets/images/clover.jpg)

Any kind of work I do (be it programming, working out, architecture, design, studying, whatever) follows a similar pattern:

### 1. Vision - know what you want to achieve and when
If you don't have any idea what your goal is or when to achieve it, you'll most likely fail. [Reasons for this are many](http://svenduplic.com/2012/01/12/dangers-of-no-deadlines-and-constraints.html), and I'm sure you know them all well so I wont write them here. Have a vision for both grand things (such as your life-time plan) as well as for small ones (for example how this piece of code interacts with the rest of it).

Also crutial, know how different levels of your vision interact and why you're doing it ('I'm writing this piece of code to launch my startup to help other people and earn money to secure future for my family')

[Be aware that your estimations are lousy](http://svenduplic.com/2012/08/28/estimation-deviation.html), but know that, like anything else, they'll become better with time. Also, be reasonably flexible with your planning. Unexpected things will come up, life will get in the way. Key is to adapt and pull through. And don't forget to celebrate your victories. Reward yourself and those close to you with your successes. Have fun. Dance. :)

### 2. Context
Whenever you do something, you operate in some context wich includes all the facts you work under. When you try to loose weight, context is your current weight, your budget, your work ethic, your possible defects and injuries etc. When you develop a startup context is your budget, your industry, you customers, your competition, your 'knowledge' of all those things etc. When you write code, context is the method you're writing the code for, the way that method works in the app etc. If you like that hot collegue of yours Gertrude, it is the history of you and Gertrude, your mutual friends, your interests etc.
You get the point. :)

**Key to context is observing and defining it as realistically as possible, with as little of wishful thinking and personal bias as possible, acknowledging both your strengths and weaknesses.**

This step is hard. I mean, really hard. You have to master skills like putting yourself in other people's shoes, seeing things from a different angle and a whole lot more... To learn how to observe and conclude without bullshit is a lifelong skill.

It is also very important for the context to have a dialogue with vision. If you have a vision for the 'best search engine in the world', you will find out by researching context that that seat has kinda already been taken, so you might want to adjust your vision accordingly.

### 3. Implementation

Once you've defined your vision and context to the best of your ability, you need to get your hands dirty and actually do what you intended. It is here where you define the specifics of your diet if you want to loose weight and are diabetic.  It is here where you start studying painting because you found out Gertude is into it. [It is here where you choose your database based on your needs and knowledge.](http://svenduplic.com/2012/12/22/how-i-setup-my-rails-app.html)

It is also very important to remember to constantly validate implementation with vision and context. If you start to go to the gym and break your leg, you're gonna have to take that change of context into account and adjust the implementation accordingly. If you meet someone <strike>better looking</strike> with better personality than Gertrude you'll most likely stop chasing her, right?

**Remember: The quality of the project depends on how well you can juggle these 3 stages. Do your best to be at the intersection of all 3 circles at all times and you'll do great!**

### Conclusion

These things may seem obvious and trivial, but it is amazing how many times I simply forget to go through them and almost certanly fail in some way afterwards. By using this simple diagram and this catchy 'clover method' term, I recall this much more often, making fewer mistakes along the way. Hopefully it will help you as much as it has helped me. :)"
post_2.user = user_1
post_2.save

post_3 = Post.new
post_3.title = 'Differenca tra me e te'
post_3.featured_image = File.open(Rails.root.join('app', 'assets', 'images', 'posts', 'daft_punk.jpg'))
post_3.body = "
What separates a good artist from a better one? There are a lot of people who are good at what they do, but only a few who are the best. What makes them stand out? What makes a painter, a baker, a programmer, an athlete the best?

![armstrong](http://www.hq.nasa.gov/alsj/a11/a11.37_5528hr.jpg)

Is it persistence? Talent? Willingness to fail? Personal connections? The amount of practice? It is all those things. But I think the key that separates a good artist from an average one is their **bias-free and clear vision of what is awesome and their willpower to cut the crap in order to achieve it.**
Michelangelo once said:

>In every block of marble I see a statue as plain as though it stood before me, shaped and perfect in attitude and action. I have only to hew away the rough walls that imprison the lovely apparition to reveal it to the other eyes as mine see it.

A better artist is a kind of a middle-man between the utopian awesomeness and magicless reality. He doesn't care if the utopian awesomeness is out of reach for his current abilityes. He will do *anything* to be able to transcend it to reality. He will not rest until it is done.

Too often I see people take the default / easy / fast route and than complain they didn't have enough inspiration / knowledge / time to do more. They point to everything but themselves when someone is better than they are. Well guess what? It is on you if someone is better than you at something. 

If you're passionate about something, don't settle for anything less than what you think is great and awesome. When you work like that, when you pour your heart and soul into something, people will notice and appreciate it. And you will be happy as hell. :)"
post_3.user = user_1
post_3.save

post_4 = Post.new
post_4.title = 'La transizzia'
post_4.featured_image = File.open(Rails.root.join('app', 'assets', 'images', 'posts', 'microryza.jpg'))
post_4.body = "
10 weeks ago I was just your typical cookie-cutter architecture student; 11 exams behind bachelors; having nothing tangible to show for all the hard work I've done in the past few months. Not a fun place to be...

Today I work in [1st startup incubator in Croatia](http://www.zipzg.com) where I've met some of the most incredible people, write for the [most popular startup and tech portal in SE Europe](http://www.netokracija.com), deployed my 1st Rails and Jekyll apps and am only 1 exam away from my bachelors degree.

>Good things happen over time; great things happen all at once. (RatRace)

It is an understatement to say that I am beyong excited about the whole thing, but it can be a little overwhelming at times.

I guess this is because the amount of things, emails, people, tasks and energy you interact with every day is on a whole new level and so very disproportionate to what youre used to. Add a little sleep deprivation to the mix and it can be a bit paralyzing.

If you begin to have weird feelings like these, slap yourself, print out the picture below, take a deep breath and repeat after me...

![Keep calm...](http://svenduplic.com/assets/images/keep_calm_1.png)

This is just one of those many things separating the men from the boys. When you get what you want, don't be silly. Bulldoze your insecurities and keep on going. And don't mistake this 'transitional' period for a final destination. This is just the beginning..."
post_4.user = user_1
post_4.save

# Events
event_1 = Event.create( title: 'Mega Party C',
                        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        beginning: Time.now + 1,
                        ending: Time.now + 3.days,
                        location: 'ZIP.Factory')
event_2 = Event.create( title: 'Mega Parallel party C',
                        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        beginning: Time.now + 1,
                        ending: Time.now + 3.days,
                        location: 'ZIP.Factory')
event_3 = Event.create( title: 'Hackathon F',
                        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        beginning: Time.now + 10.days,
                        ending: Time.now + 11.days,
                        location: 'ZIP')
event_4 = Event.create( title: 'Demo Day F',
                        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        beginning: Time.now + 22.days,
                        ending: Time.now + 22.days,
                        location: 'ZIP.Events')
event_5 = Event.create( title: 'Demo Day 2 F',
                        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        beginning: Time.now + 32.days,
                        ending: Time.now + 33.days,
                        location: 'ZIP.Events')
event_6 = Event.create( title: 'Mentor Showcase P',
                        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        beginning: Time.now + 1,
                        ending: Time.now + 2,
                        location: 'ZIP.Factory')
event_7 = Event.create( title: 'Mentor Showcase P',
                        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        beginning: Time.now + 1,
                        ending: Time.now + 2,
                        location: 'ZIP.Factory')
