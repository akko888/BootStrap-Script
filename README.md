# RemZero | CLI bash tool to generate basic C/C++ Structures ≽^-⩊-^≼
This project is a command tool that lets you initialaze projects and repositories for C and C++, and more languages in the future, it gives you a blank paper to work in! /ᐠ > ˕ <マ ₊˚⊹♡

![GitHub License](https://img.shields.io/github/license/akko888/RemZero?style=for-the-badge&logo=github&color=C9391A)
![Static Badge](https://img.shields.io/badge/Language-Bash-green?style=for-the-badge&logo=gnubash&logoColor=%234EAA25)

# Visual Demo

![Demo RemZero](assets/demo.gif)

# Usage (•˕ •マ.ᐟ
This tool name is remzero
The commmand "remzero" has the next options ⚞^. .^⚟:

* -r or --root: It refers to the new project's root.
* -n or --name: It refers to the new project's name
* -l or --lang: It refers to the new project's programming language
* --log-file: It lets you enable a file log if you need it
* --help: Default option to show help

Just -n and -l are needed, if you don´t specify root, it uses "./" as default, a prompt would look like this:
> remzero -n MyApp -r ~/projects -l cpp

## Installation ฅ^>⩊<^ ฅ
To install it, run the next command :
> install.sh

Assure you to run it like "./install.sh" and from this project's root

**Make sure install.sh has execution permission**

> chmod +x install.sh

#### Uninstall
In the contrary scenario, if you want to uninstall it, just run:
> uninstall.sh

## File Tree

<pre>.
├── assets
│   └── demo.gif
├── bin
│   └── main.sh
├── install.sh
├── lib
│   ├── dirCreation.sh
│   ├── filesCreation.sh
│   ├── langs
│   │   ├── cpp.sh
│   │   └── c.sh
│   ├── languageDef.sh
│   └── logs.sh
├── LICENSE
├── README.md
└── uninstall.sh

5 directories, 12 files
</pre>
