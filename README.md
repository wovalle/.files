# DotFiles

1. Clone repo to `~/`
  ```
  git clone git@github.com:wovalle/.files.git
  ```

2. Add symbolic link to `.gitconfig`

  ```
  ln -s ~/.files/dotgitconfig ~/.gitconfig
  ```

3. Add symbolic link to `.bash_aliases`

```
 ln -s ~/.files/dotbash_aliases ~/.bash_aliases
```

4. Install `xsel` to support `copy` and `paste` aliases

  ```
  sudo apt-get install xsel
  ```