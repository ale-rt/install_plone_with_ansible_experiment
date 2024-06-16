This is an experiment done at the Buschenschank sprint 2024.

Main goals:

- install and configure Plone with `Ansible`.
- do not depend on `zc.buildout` anymore

Motivations:

- Ansible is a very solid, widespread, maintained, powerful
and well documented tool
- Ansible can operate locally or on a remote server
- Creating or modifying ansible tasks is by far easier than
creating or modifying buildout recipes


Test it yourself:

```shell
git clone https://github.com/ale-rt/install_plone_with_ansible_experiment.git plone
cd plone
make
make start
```

### Customizations

Variables for this playbook can be customizaed by placing a YaML file inn the `etc/ansible` folder.

E.g.:
```yaml
plone_base_port: 9000
plone_extra_packages:
  - 'collective.pdbpp'
  - 'collective.icecream'
plone_source_checkouts:
  - name: 'plone.app.debugtoolbar'
    repo: 'https://github.com/plone/plone.app.debugtoolbar'
    version: 'master'
plone_zcml:
  - 'plone.app.debugtoolbar'
```
