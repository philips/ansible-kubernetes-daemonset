## ansible-daemonset-container-linux

Exploration of using Ansible on-top of Kubernetes for configuring Container Linux hosts.

**Theory of operation**

Ansible is installed into a container image and then connects to the host via a bind mount to root and the [chroot connection option](https://docs.ansible.com/ansible/devel/plugins/connection/chroot.html) connection module. This works without any RPC!

Ansible gets its configuration from `site.yml` and which is loaded into a configmap and placed inside of the Ansible container pod at `/etc/ansible`.

**Background**

[See exploration doc](https://docs.google.com/a/coreos.com/document/d/1Tbiy4ssIDzQYl8krAKiKFOMYXKnr7yqPVH5oFdsTmt0/edit?usp=drive_web)

Ansible might be desirable on Tectnoic for a number of reasons:

- Leverages existing software and modules in the ecosystem
- Ansible's DSL is simple enough to map from ignition config or equivalent used for first boot
- Debugging tools exist for Ansible include check and diff functionality
- Could be used for other non-Tectonic cluster maintenance by customers [like sysctl](http://docs.ansible.com/ansible/latest/sysctl_module.html)
  - Related [field request](https://jira.coreos.com/browse/FR-163)

This was tested on Tectonic 1.7.9 cluster.

### Building

Requires docker configured for `docker build`

```
./build.sh
```

### Usage

Edit site.yml as needed to add different functionality as you wish from Ansible

The deploy script will create a config map, and run Ansible.

```
./deploy.sh
```


### Future work

- Create script to convert ignition configs into ansible 
- Use base container from hyperkube or something
- Pin [ansible version via hash](https://pip.pypa.io/en/stable/reference/pip_install/#hash-checking-mode)
- Bootstrap module fetches images from container image instead of web
- Setup container image to CI/CD instead of Brandon's workstation
