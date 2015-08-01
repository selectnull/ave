==================================
ave - Activate Virtual Environment
==================================

ave is small bash function to help out with activation of virtual
environments; the name stands for Activate Virtual Environment
(which is almost all it does).


How to use it?
==============

ave was created out of my personal needs of organizing projects and
need to type less. There are two ways in which ave can be used.
If you type ``ave`` with no arguments, it will start from current
directory and search for virtual environment by ``cd`` ing upwards
thru parent directories or by looking inside ``~/$WORKON_HOME``.
When virtual environment is found, it is activated (sourced).
Called with an argument, it will do the same and optionally
``cd`` to project directory if it's held under source controled.

The above is all ``ave`` does, but it's easier to understand with
following example. Let's assume we have this directory structure::

    # this is where we store our projects
    ~/projects/
        common-env/
            project_1/
            project_2/
            project_3/
        project_a/
        project_b/
        project_c/

    # this is where we store virtual environments
    ~/$WORKON_HOME/
        common-env/
        project_a/
        project_b/
        project_c/

    # temp directory to work with throwaway stuff
    ~/tmp/

Multiple projects based on common virtual environment
-----------------------------------------------------

These are projects that are all based on the same virtual environment,
``common-env`` in the example::

    ave ~/projects/common-env/project_1

or::

    cd ~/projects/common-env/project_1
    ave

After any of those commands, ``common-env`` is activated and current
directory is changed to ``project_1``.

One project per virtual environment
-----------------------------------

Each project has its own virtual environment::

    ave ~/projects/project_a

or::

    cd ~/projects/project_a
    ave

With bash (or any other shell) and tab completion, very few keystrokes
are needed.

Playground and throwaway environmets
------------------------------------

There is often a need to test new libraries. You want to quickly make an
environment, type out some code (directly in python shell or by creating
a file), play with it and delete it.::

    virtualenv ~/tmp/foo-playground
    cd ~/tmp/foo-playground
    ave

    pip install foo
    python
    # import foo and play with it

    # enough play, go to work
    rm -rf ~/foo-playground

This way you are not cluttering ``WORKON_HOME`` directory even if you don't
delete temporary environmets right away after use (which I usually don't).


How to install it?
==================

Via pip
-------

Install for user::

    pip install ave --user

or if you want to install globally::

    sudo pip install ave

Manually
--------

Clone the repository and source ave.sh script from your .bashrc or .profile.

Configure it
------------

::

    # define directory to put virtual environments
    export WORKON_HOME=~/.venvs

    # source ave function
    source /path/to/ave.sh


What about virtualenvwrapper?
=============================

By all means, virtualenvwrapper is mature and well tested software.
It works great and is recommended by many pythonistas. It does so much
more than ave and if you need its functionality, you should check it out.

ave uses the same ``WORKON_HOME`` evnironment variable so it's compatible
with virtualenvwrapper, both can be used at the same time.

ave is simple to the point that this documentation is longer than the
complete ave code. I like simple.


Licence
=======

ave is MIT licensed.
