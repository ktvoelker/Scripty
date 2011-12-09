
Scripty
=======

Scripty is a tool for scripting with Haskell.

First, compile Scripty:

    make

Then, make a scriptyscript like this called `foo.sy`:

    prog args = print args >> return 0

And run it like this:

    scripty foo.sy

I just wrote it, so it probably has lots of bugs and deficiencies!

The goal of Scripty is to reduce the amount of boilerplate needed to accomplish
common scripting tasks with Haskell. So far, it does this by prefixing your script
with a header that:

* Gives your script a module declaration,
* Imports a bunch of useful modules, and
* Wraps your `prog` function (which has the UNIX-friendly type `[String] -> Int`)
  in a proper Haskell `main` function.

Scripty runs scripts with `runghc -fglasgow-exts`, which means:

* Scripty depends on [GHC](http://www.haskell.org/ghc/), and
* Scriptyscripts can use any GHC extension enabled by `-fglasgow-exts`.

What I see in the future of Scripty is mainly the creation of modules (which could
useful to any Haskell program) which facilitate scripting tasks, such as:

* File-system navigation and examination, and
* Process control and interaction.

