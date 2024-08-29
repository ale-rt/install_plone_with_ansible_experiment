.PHONY: all
all: install requirements

.PHONY: install
install: .venv/bin/ansible-playbook
	mkdir -p etc/ansible
	.venv/bin/ansible-playbook playbook.yml

.PHONY: requirements
requirements: .venv/bin/ansible-playbook
	.venv/bin/ansible-galaxy install -r requirements.yml

.venv/bin/uv:
	python3 -m venv .venv
	.venv/bin/pip install uv

.venv/bin/ansible-playbook: .venv/bin/uv
	.venv/bin/uv pip install ansible

.PHONY: test
test: .venv/bin/ansible-playbook
	.venv/bin/ansible-playbook test.yml

.PHONY: clean
clean:
	rm -rf var/plone-installed
