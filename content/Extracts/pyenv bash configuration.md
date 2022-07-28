---
title: pyenv bash configuration
tags:
- ✨extract
---


---

# pyenv bash configuration

```zsh
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi
```
## References

### author
>  [[<% tp.file.cursor(3) %>]]
### position
>  <% tp.file.cursor(2) %>
