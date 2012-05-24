ave
===

ave is very light bash function to ease the activation of virtualenv and the name
stands for Activate Virtual Env.

How to use it?
==============

ave runs you virtualenv activate script, but does it in a way that saves you some typing.
If you are inside a directory containing bin which contains activate script, just run ave
and it will activate this virtual environment.

Let's imagine we have two virtual environmets, ~/ceasar and ~/brutus

    cd ~/ceasar
    ave # activates ceasar

    cd ~/brutus
    ave # activates brutus

    cd ~
    ave ceasar # yes, this works and is the reason I named them that way

    cd ~/ceasar/some-dir/subdir
    ave # activates ceasar by traversing upward and looking for bin/activate

How to install it?
==================

Put ave.sh script in your ~/bin and source it by putting this line in your ~/.bashrc
source ~/bin/ave.sh

Why not virtualenvwrapper?
==========================

By all means, virtualenvwrapper is mature and well tested code. It works great
and is recommended by many pythonistas. You should check it out.
The main reason I don't use it is that I don't like having all my virtual environments
rooted in the same directory.

Licence
=======

ave is MIT licensed.

