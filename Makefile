.PHONY: all
all: install

.PHONY: install
install: .venv/bin/ansible-playbook
	.venv/bin/ansible-playbook playbook.yml

var/plone-installed: .venv/bin/uv requirements.txt constraints.txt
	.venv/bin/uv pip install -r requirements.txt -c constraints.txt
	mkdir -p var/
	touch var/plone-installed

.venv/bin/uv:
	python3 -m venv .venv
	.venv/bin/pip install uv

.venv/bin/ansible-playbook: .venv/bin/uv
	.venv/bin/uv pip install ansible

.PHONY: start
start:
	.venv/bin/supervisord -c etc/supervisord.conf
