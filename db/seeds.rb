# Users
user_1 = User.create( username: 'ofca',
                      email: 'sven.dupli@gmail.com',
                      password: 'supersecret',
                      admin: true)

# Posts
post_1 = Post.new
post_1.title = 'Proslava useljenja novih ZIP startupa!'
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

# Events
event_1 = Event.create( title: 'Mentor Showcase',
                        description: 'Mentors gather to criticise your arses!',
                        beginning: Time.now + 60,
                        location: 'ZIP.Factory')
event_2 = Event.create( title: 'Hackathon',
                        description: 'Where hackers meet and crazy sh*t happens :)',
                        beginning: Time.now + 10.days,
                        ending: Time.now + 11.days,
                        location: 'ZIP.Factory')
event_3 = Event.create( title: 'Demo Day',
                        description: 'To review the progress',
                        beginning: Time.now + 22.days,
                        ending: Time.now + 22.days,
                        location: 'ZIP.Events')
event_4 = Event.create( title: 'Mega Party',
                        description: 'A big, big party lasting a few days!!!',
                        beginning: Time.now + 1,
                        ending: Time.now + 3.days,
                        location: 'ZIP.Factory')
