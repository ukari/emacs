# ukari no emacs config

## Dependencies
- tern

### tern
``` bash
npm install -g tern
```

## Supports

## languages
- Markdown
- JavaScript, JSX

## others
- monokai theme

## Linux Service(emacs run as daemon)
- get the file in `./emacs@.service`

### benefits
- it allows you switch input method in emacsclient -c mode

### usage
1. put this file to /etc/systemd/system/emacs@.service
2. auto startup on `systemctl enable emacs@your_user_name.service`
3. restart by `systemctl restart emacs@your_user_name.service`
