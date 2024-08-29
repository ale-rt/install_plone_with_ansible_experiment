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
```

This will install Plone in the `./var/plone` directory.

You can go there and start Plone with:

```shell
cd var/plone
./bin/supervisord
```

Then you can access Plone at http://localhost:8080.

### Customizations

Variables for this playbook can be customized by placing one (or more) YAML file in the `etc/ansible` folder.

Check the variables you can use here

- https://github.com/collective/collective.plonestack
