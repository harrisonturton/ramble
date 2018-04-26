

#Core Beliefs
This document consolidates my belief on how to balance a commerical platform & respecting user privacy.

**Note:** This document can evolve! If you disagree with anything, open an issue and *tell me.* This is

**In short:**
- Never sell raw data
- Forget deleted data
- Full transparency on what data is collected
- Ignore all private information (And encrypt where possible)
- Never give data to third-parties



## In Detail

###Balancing commerciality and privacy
Social media isn't free -- we pay with our data. This isn't bad, *as long as the data is respected.* I strongly believe that a happy medium can be found.
For example, ads can be targeted with only public information, without invasively reading private messages.

###Never sell data
Raw user data will never be sold to third-party agencies. If ads are targeted, strong efforts are made to seperate the advertiser from the data itself.

###Forget deleted data
When something is deleted, it is removed from our database. Nothing is hidden from users - you have full control over what we, and others, can see. Anything can easily be deleted.

###Full transparency on what data is collected
At any time, a user can see what we know about them. This process is easy, and known.

###Ignore all private information
Private messages are completely ignored by targeted advertising. This includes message contents, the number of chats, groups, particpants, metadata, everything.

**Developer Note:**
Instant messages *will be encrypted.* This is a big deal for me -- I hate that Facebook, Twitter & Snapchat don't encrypt things. However, early versions of the app will not be encrypted. (See below)

In a perfect world, I'd use the incredible encryption that powers Signal. However, the tech we use (Flutter & Dart) can't use that library, so we have to do it ourselves. Creating secure encryption takes time, so we've opted to launch the app and bring encryption in afterwards.

###Never give data to third parties
Unless explicitly asked (i.e. a pop-up that states what data is being requested), data is never shared with third-party applications. Third-party applications must benefit the user in some way, and not just farm data.
