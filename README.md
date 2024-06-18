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

Variables for this playbook can be customized by placing one (or more) YAML file in the `etc/ansible` folder.

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

#### Variables

- `plone_workers`: the number of Plone instances to create.
By default they will be named `instance1`, `instance2`, etc. They will listen on a port starting from `plone_base_port` incremented by the number of the instance. Default is `2`
- `plone_base_port`: the base port for the Plone instances. Default is `8080`
- `plone_extra_packages`: a list of extra packages to install. Default is `[]`
- `plone_listen_ips`: List of IPs to listen on. Default is `['0.0.0.0']`
- `plone_source_checkouts`: List of source checkouts to include in virtualenv. Default is `[]`
- `plone_zcml`: List of packages for which to include the ZCML. Default is `[]`
