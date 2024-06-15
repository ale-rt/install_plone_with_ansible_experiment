.PHONY: all
all: install

.PHONY: install
install: .venv/bin/ansible-playbook
	.venv/bin/ansible-playbook playbook.yml

.venv/bin/supervisord: install

.venv/bin/pip:
	python3 -m venv .venv
	.venv/bin/pip install --upgrade pip

.venv/bin/ansible-playbook: .venv/bin/pip
	.venv/bin/pip install ansible

.PHONY: start
start:
	.venv/bin/supervisord -c etc/supervisord.conf
