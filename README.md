# ukari no emacs config

## Dependencies
- tern
- tern-jsx

### tern
``` bash
npm install -g tern
npm install -g tern-jsx
```

## Supports

### languages
- Markdown
- JavaScript, JSX
- JSON

### others
- git
- monokai theme
- speedbar

## Linux Service(emacs run as daemon)
- get the file in `./emacs@.service`

### benefits
- it allows you switch input method in emacsclient -c mode when use fcitx

### usage
1. put this file to /etc/systemd/system/emacs@.service
2. auto startup on `systemctl enable emacs@your_user_name.service`
3. restart by `systemctl restart emacs@your_user_name.service`
4. connect by `emacsclient -ec` or `emacsclient -t`

## Shortcuts
- `F4` save & close other file buffers
- `F5` toggle file tree (by speedbar)
