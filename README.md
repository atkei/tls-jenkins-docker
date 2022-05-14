# TLS enabled Jenkins with Docker

## Prerequisite

- Docker
- Docker Compose
- Domain Name

## Obtain/Renew TLS Certificate

Copy [`.env.sample`](./.env.sample) to `.env` then edit for each environment.

- `DOMAIN_NAME`: Jenkins server domain name
- `RSA_KEY_SIZE`: TLS Certificate rsa key size
- `EMAIL`: Email address for important account notifications
- `LETSENCRYPT_STAGING`: Use the staging server to obtain certificates if not 0
- `JENKINS_HOST_IP`: IP address of Jenkins host
- `JENKINS_HOST_PORT`: Port number of Jenkins host

Obtain/renew a TLS certificate with the following.

```sh
./obrain_renew_cert.sh
```

## Start Jenkins

```sh
docker-compose up -d
```

## Docker Volumes

The following volumes are automatically created to persist data on the host.

- `<project_name>_jenkins_home`: Jenkins home directory
- `<project_name>_nginx_logs`: Nginx log directory

For example, if the project name is `tls-jenkins-docker`:

```
docker volume inspect tls-jenkins-docker_jenkins_home 
[
    {
        ...
        "Name": "tls-jenkins-docker_jenkins_home",
        ...
    }
]
```
