---
title: How I discover that markdownlint run in python 2
tags:
- tech/python
- story
---

# How to I discover that markdownlint run in python 2
#tech/python #story

When I was trying to solve a format problem with my notes (more especifically with [how to scan images using the terminal](/how%20to%20scan%20images%20using%20the%20terminal.md)), I had this kind a content in the note:
```
- install [sane-utils](/Extracts/sane-utils.md) 
- 
```
no extra spaces before the bullets, nothing, just that content.

Which lead to an error after [my build script](https://github.com/chris-cadev/knowledge/blob/hugo/Makefile#L22) and [starting the local server](https://github.com/chris-cadev/knowledge/blob/hugo/Makefile#L19). The error was saying something that the markdown was detected as a YAML file by [Hugo](/Bibliography/Hugo.md), or something like that.

Few searches later I found [this comment](https://github.com/boltgolt/howdy/issues/458#issuecomment-723757387):
> You need to have ==python 2== for it to work. This is because the pam-python module only operates on python 2. If you have python 2 you should not have to worry about ConfigParser not being installed because it should be part of the standard library.
> ...

The important thing is that it mention that is python 2. So I started switching versions with [pyenv](/Extracts/pyenv.md) and [Pipenv](/Bibliography/Pipenv.md) and then changing to python 2.7.18 it works.

The thing is that does not do what I want it. Wich was to add an extra space before the list or something alike. But that's ok, here we have another one to the "Overthinking stories" vault.
