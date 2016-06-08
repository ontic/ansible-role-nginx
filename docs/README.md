# Documentation

## Example

```
nginx_conf_template: 'example.com.nginx.conf.j2'
nginx_server_templates:
  - filename: 'default'
    state: 'absent'
  - filename: 'example'
    template: 'example.com.nginx.server.j2'
nginx_ssl_files:
  - src: 'loadbalancer/nginx/ssl/development.crt'
    name: 'development.crt'
  - src: 'loadbalancer/nginx/ssl/development.key'
    name: 'development.key'
```

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yml](/defaults/main.yml)):

```
nginx_ppa:
```

The launchpad PPA to add to APT. Which would allow a non-official package of Nginx to be installed.

```
nginx_repo_state: 'present'
```

The desired Nginx repository state, valid values are `present`, or `absent`.

```
nginx_repo_uid: 'nginx'
```

The unique repository identifier for RedHat/CentOS .

```
nginx_repo_name: 'Nginx'
```

The human readable repository name for RedHat/CentOS.

```
nginx_repo_baseurl: 'http://nginx.org/packages/centos/{{ ansible_distribution_major_version }}/$basearch/'
```

The repository URL for RedHat/CentOS.

```
nginx_repo_gpgkey: 'http://nginx.org/keys/nginx_signing.key'
```

The GPG key URL for RedHat/CentOS.

```
nginx_repo_gpgcheck: '1'
```

Whether GPG signature checking is enabled or disabled for RedHat/CentOS.

```
nginx_repo_enabled: '1'
```

Whether the repository is enabled or disabled globally for RedHat/CentOS.

```
nginx_repo_url: 'deb http://nginx.org/packages/ubuntu/ {{ ansible_distribution_release | lower }} nginx'
```

The repository URL for Debian/Ubuntu.

```
nginx_repo_key_id: '7BD9BF62'
```

The repository key identifier for Debian/Ubuntu.

```
nginx_repo_key_server: 'http://nginx.org/keys/nginx_signing.key'
```

The keyserver to provide the GPG key for Debian/Ubuntu.

```
nginx_service_name:
```

The name of the daemon under which Nginx runs.

```
nginx_service_state: 'started'
```

The desired Nginx service state, valid values are `started`, `stopped`, `restarted` or `reloaded`.

```
nginx_service_enabled: 'yes'
```

Whether the Nginx service should start on boot, valid values are `yes`, or `no`.

```
nginx_disable_apache: no
```

Whether an attempt is made to stop Apache and prevent it from automatically starting on boot. 

```
nginx_packages:
```

A list of the Nginx packages to install. Each package supports all parameters from the
[apt](http://docs.ansible.com/ansible/apt_module.html) or [yum](http://docs.ansible.com/ansible/yum_module.html) modules.
If the value remains omitted, the following packages will be installed by default.

| Debian/Ubuntu          | RedHat/CentOS           |
| :--------------------- | :---------------------- |
| nginx                  | nginx                   |

```
nginx_ssl_files:
```

The SSl certificate files you would like to manage. Each file expects two parameters, `name` which is the
name of the destination file, you can either specify `src` when transferring a file or `content` when
setting the contents of a file. An optional parameter `mode` can be specified, determining the permissions
set on the destination file.

```
nginx_conf_template: 'default.nginx.conf.j2'
```

The template file name that replaces the Nginx configuration file.

```
nginx_mime_types_template: 'default.mime.types.j2'
```

The template file name that replaces the Nginx mime types file.

```
nginx_config_templates:
```

The configuration files you would like to manage. Each item expects two parameters, `filename` which is the
name of the destination file and `template`, which is the name of the source template file. An optional
parameter `state` can be specified, valid values are `present` (*Default*) or `absent`. When defined and the value is
`absent` a destination file matching the `filename` parameter will be removed.

```
nginx_server_templates:
  - filename: 'default'
    template: 'default.nginx.server.j2'
```

The server directives you would like to manage. Each server expects two parameters, `filename` which is the
name of the destination file and `template`, which is the name of the source template file. An optional
parameter `state` can be specified, valid values are `present` (*Default*) or `absent`. When defined and the value is
`absent` a destination file matching the `filename` parameter will be removed.