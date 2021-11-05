This is primarily for me to keep track of changes and synchronize my configuration, so there aren't many comments or other documentation at the moment, but I might improve that later.

### .ideavimrc

[IdeaVim](https://plugins.jetbrains.com/plugin/164-ideavim) plugin for IntelliJ platform. Some parts require my [fork of IdeaVim](https://github.com/chylex/IntelliJ-IdeaVim/tree/customized/main), and my experimental [fork of AceJump](https://github.com/chylex/IntelliJ-AceJump/tree/experimental-rework). Belongs in the user home directory.

### .vimrc

Configuration for [Vim](https://www.vim.org/). Belongs in the user home directory.

### .bashrc

Configuration for [Bash](https://www.gnu.org/software/bash/). Belongs in the user home directory.

### Firefox / userChrome.css

Custom stylesheets for Firefox 94 or newer, designed for [Firefox Developer Edition](https://www.mozilla.org/firefox/developer). To install, place `userChrome.css` into the `chrome` folder:
 - `%APPDATA%\Mozilla\Firefox\Profiles\<profile>\chrome` (Windows)
 - `~/.mozilla/firefox/<profile>/chrome` (Linux)

Make sure that `toolkit.legacyUserProfileCustomizations.stylesheets` is set to `true` in `about:config`.

The stylesheet includes:
 - Compact toolbars
 - Compact tabs with borders
 - Compact address bar with less padding
 - Repurposed bookmark toolbar as an addon bar on the bottom of the window
 - Separate Reload / Stop buttons
 - Removal of several menu items I don't care about
 - Removal of update notifications
 - Black window background

![Firefox UI](https://github.com/chylex/dotfiles/blob/main/.github/readme/firefox.png)
