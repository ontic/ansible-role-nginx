# Documentation

## Example

```
nginx_conf_template: yourdomain.nginx.conf.j2
nginx_server_templates:
  - filename: default
    state: absent
  - filename: yourdomain
      template: yourdomain.nginx.server.j2
```

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yml](/defaults/main.yml)):

```
nginx_repository:
```

The repository to add to APT. Which would allow more recent versions of Nginx to be installed.

```
nginx_pkg_version:
```

The Nginx package version you want to install. If omitted `nginx_pkg_state` will be used.

```
nginx_pkg_state: present
```

The desired Nginx package state, valid values are `latest`, `present`, or `absent`.

```
nginx_service_state: started
```

The desired Nginx service state, valid values are `started`, `stopped`, `restarted` or `reloaded`.

```
nginx_service_enabled: yes
```

Whether the Nginx service should start on boot, valid values are `yes`, or `no`.

```
nginx_conf_template: default.nginx.conf.j2
```

The template file name that replaces the Nginx configuration file.

```
nginx_mime_types_template: default.mime.types.j2
```

The template file name that replaces the Nginx mime types file.

```
nginx_server_templates:
  - filename: default
    template: default.nginx.server.j2
```

The server directives you would like to manage. Each server expects two parameters, `filename` which is the
name of the destination file and `template`, which is the name of the source template file. An optional
parameter `state` can be specified, valid values are `present` (*Default*) or `absent`. When defined and the value is
`absent` a destination file matching the `filename` parameter will be removed.