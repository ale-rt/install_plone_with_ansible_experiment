.PHONY: all
all: .venv/bin/ansible-playbook
	.venv/bin/ansible playbook.yml

.venv/bin/pip:
	python3 -m venv .venv
	.venv/bin/pip install --upgrade pip

.venv/bin/ansible-playbook: .venv/bin/pip
	.venv/bin/pip install ansible
