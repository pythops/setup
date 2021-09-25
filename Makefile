SHELL := /bin/bash

all:
	@ansible-playbook setup.yaml -K

alacritty:
	@ansible-playbook setup.yaml -t alacritty -K

git:
	@ansible-playbook setup.yaml -t git -K

i3:
	@ansible-playbook setup.yaml -t i3 -K

neovim:
	@ansible-playbook setup.yaml -t neovim -K

npm:
	@ansible-playbook setup.yaml -t npm -K

tmux:
	@ansible-playbook setup.yaml -t tmux -K

packages:
	@ansible-playbook setup.yaml -t packages -K

python:
	@ansible-playbook setup.yaml -t python

rust:
	@ansible-playbook setup.yaml -t rust

zsh:
	@ansible-playbook setup.yaml -t zsh -K

build:
	@docker build -t workstation:latest .

run:
	@(\
		Xephyr :1 -ac -br -screen 1920x1080 -resizeable -reset -terminate &  \
		docker run --rm -it -e DISPLAY=:1 --device /dev/snd -v /tmp/.X11-unix:/tmp/.X11-unix workstation:latest i3 \
	)
