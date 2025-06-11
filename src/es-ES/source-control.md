# Source Control

When working on any piece of software, whether it's a video game or an app to track how many dogs you pet in a given day, it's extremely important to keep track of the changes to your code and keep it backed up in a secure location.

Imagine this scenario: you work on your game for three months. It's amazing. It's your X-Files Dating Sim. You've painstakingly drawn all of the characters, written the scenario, coded up all the interactions. Then one day your computer gets stolen by a giant crow! I don't trust those crows, I never have. Suddenly your game is gone, poof. All that hard work just sitting on a hard-drive barely being protected by the shell of your laptop from the aggressive pecks of the entire local union of crows.

You'd just have to start over, from scratch. That is if you aren't too bummed out about losing the entire game. Crow theft—it's the number one reason to back up your game's source code.

## Back Up Your Game

You could use a cloud service like Dropbox to back it up to the ✨cloud✨. That's better than nothing. Then when you get a new computer because, you know, the crows stole your other one, you'll be good to go. Your game will be backed up. Heck, Dropbox does it automatically. That's pretty nifty.

## Using Git

I'd like to advocate for using source control (a.k.a. version control) to keep track of the changes to your game. It's like a more advanced form of using a cloud storage provider. The primary source control tool is called [Git](https://git-scm.com/). Git lets you track your changes by creating commits--references of what changed and why since the last time you made a commit.

The basics of Git are beyond the scope of this book, but there are some helpful resources out there:

- [Git's Documentation](https://git-scm.com/doc)
- [GitHub's Git Guide](https://github.com/git-guides)
- [GUI apps for working with Git](https://git-scm.com/downloads/guis)

Using version control at first may seem a bit tedious, but it's immensely valuable. Not only can you document why you made a change to help your future self and others, but you can safely experiment without fear of really messing things up. Because you're tracking the changes to your game's source, if you go down a rabbit hole that doesn't work out, you can easily undo it. Let's explore some examples of commits and scenarios where it's helpful.

Any time you add a feature, create a commit. This lets you see your game evolve over time. Let's say you added player input with the gamepad. Boom, make a commit! Let's say you improved the enemy AI, commit that. Keep your commits small. Don't make hundreds of lines of unrelated changes and make a big commit that just say "changed some stuff". You're trying to help yourself but creating a useful log of your game. Here's a look at commits from a little project of mine:


``` console
commit 9a74acdbec6971fab76fd81b2d78526ffef2c621
Date:   Thu Nov 24 07:22:15 2022 -0500

    Add score tracking

commit c5c277eae786100609b7dfbc9a516e44b705f59b
Date:   Thu Nov 24 07:16:24 2022 -0500

    add bullet & enemy collision

commit 35aba8938b0e1afd7888ca09f6693330307facb6
Date:   Thu Nov 24 06:59:45 2022 -0500

    Rename project

commit 357b0412b24d805f49a1c542564ec76fe2962b7a
Date:   Thu Nov 24 06:59:25 2022 -0500

    Delete dead enemies from collection

commit 967fd73886e298394c1f923280bbdfb7f7cfa778
Date:   Thu Nov 24 06:53:27 2022 -0500

    swap player & enemy sprite; revise bullet sprite

commit 2a233f7248d03cd8c602158acd9b1899b3ee8429
Date:   Wed Nov 23 23:04:46 2022 -0500

    add simple bullet firing
```

Any time I add, change, or fix functionality, I make a commit. This lets me easily see my changes.

The flow of development is:

1. Write code to make the game do something
2. Test the changes out in the game
3. Adjust the code
4. Test the adjustments
5. Create a commit

Start the flow again!

## Source Code Hosts

When you use Git on your computer for your project, you're creating a log of changes that exists in your computer. You'll want to push your Git repository up to a host so that it's backed up. There are many free hosts out there, allowing you to create private or public repositories of your code. 

Some popular ones are:

- [GitHub](https://github.com)
- [Bitbucket](https://bitbucket.org/)
- [GitLab](https://about.gitlab.com/)


In the flow of development above, step 6 is: push the code to the remote host. This ensures those pesky crows can't totally steal your game and you'll live to code another day.

## Using Source Control with DragonRuby Game Toolkit

When I work on my DRGTK games, I check the entire project, including the engine, into source control. This lets me easily clone and run the project without needing to set anything up. Because the engine binary (`./dragonruby`) is so small, it's no problem at all. I'll often clean out the sample code and sprites if I'm not going to use them.

A benefit to this is that if a new version of DRGTK is released, I can create its own commit for that and easily rollback if anything breaks. Phew!

## A Note on Open Source DragonRuby Game Toolkit Games

You may have heard of the term open source software (OSS). It's when people write code and release available to the public to see and use under varying license terms. Code is released as open source for a variety of reasons, from helping people learn to collaborating with anyone. It allows people to contribute and help fix things. This book is even [open source](https://github.com/DragonRidersUnite/book)!

The DragonRuby Game Toolkit is not open source software, which means that you can't distribute the engine publicly on a source control host, but you can publish the code you've written, since it's your code. This is a bit a nuanced situation with DRGTK because of how projects work.

I recommended checking the entire folder of the engine and your game into source control in the previous section. But if you want to open source your game, I'd do it a little differently. And it helps to know this from the start of your project, but it's okay if you do it later down the line.

If you want to open source you game, follow these steps:

1. Unzip the engine
2. Change into the `mygame` directory
3. Initialize your Git repository there with `git init`
4. Don't track the engine parent folder

The downside to this approach is that you need to ensure you keep your specific engine version parent directory available. You could use version control to sync that and then use Git to publish it online as open source code.

## Summary

- Back up your games! You never know when you might lose your computer.
- Source control, like Git, let's you make changes with confidence.
- Push your code regularly to a source control host so that it's backed up.
