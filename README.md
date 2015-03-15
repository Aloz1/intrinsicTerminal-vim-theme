intrinsicTerminal
=================

A gvim colorscheme that copies the look of terminal vim through the use of .Xresources.

How it works
------------

intrinsicTerminal works by scanning your .Xresources file for possible color changes to
alow the colors of gvim to be (close to) identical to that of good old terminal vim. This
colorscheme will also utilise colors that are within a seperate file that has been
'#includ'ed as long as it is within a subdirectory called colors.

For example, if your like me and you have lots of themes you may wish to try out, instead
of changing .Xresources every 30 seconds, it's far easier to copy those colors into any
subdirectory tree with the form "[topLevels]/colors/[bottomLevels/]termColorschemeName"
Once that is done, it is simply a matter of adding
'#include "[topLevels]/colors/[bottomLevels/]termColorschemeName"'
into the top of your .Xresources folder then just change termColorschemeName every time
you want to try something a little new.

As an example, I have my colorschemes in ".Xconf/colors/" so I would place
'#include ".Xconf/colors/themeName"' at the top of my .Xresources folder.

Installation
------------

To install, simply install using pathogen/vundle or place the [colors/intrinsicTerminal.vim](intrinsicTerminal.vim) file within your ~/.vim/colors/ folder then place 'colorscheme intrinsicTerminal' into
your ~/.gvimrc file. Once that is done, all should be well in the world of gvim.
