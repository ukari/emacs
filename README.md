# ukari no emacs config

## Dependencies
- sbcl
- Material Design Icons (not working)
- Source Code Pro
- Noto Sans CJK SC
- Noto Sans CJK JP
- stack
- glslangValidator
- haskell-language-server

## Supports

### languages
- common lisp
- elisp
- haskell
- glsl
- nix
- yaml
- Markdown
- ReST
- JSON
- fountain

## Config
- set path for lisp environment on `inferior-lisp-program` in `/lisp/init-common-lisp.el`

### others
- git
- ground theme
- ignore `.Xresource`
- Material Design Icons [cheatsheet](https://pictogrammers.github.io/@mdi/font/5.4.55/)

### about git
disable git's octal utf8 display to respect unicode

``` shell
git config --global core.quotepath off
```

## Linux Service(emacs run as daemon)
- get the file in `./emacs@.service`

### benefits
- it allows you switch input method in emacsclient -c mode when use fcitx

### usage
1. put this file to /etc/systemd/system/emacs@.service
2. auto startup on `systemctl enable emacs@your_user_name.service`
3. restart by `systemctl restart emacs@your_user_name.service`
4. connect by `emacsclient -c -s ${TMPDIR:-/tmp}/emacs$(id -u)/server` or `emacsclient -t -s ${TMPDIR:-/tmp}/emacs$(id -u)/server`

## Shortcuts
- `F4` save & close other file buffers
- `F5` toggle file tree (by speedbar)
- `F6` toggle imenu list
