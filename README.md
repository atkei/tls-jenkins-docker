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
- `HOST_DOCKER_BIN`: Path of host `docker` (`which docker`)
- `HOST_DOCEKR_SOCK`: Path of host `docker.sock`

Obtain/renew a TLS certificate with the following.

```sh
./obrain_renew_cert.sh
```

## Start Jenkins

```sh
docker-compose up -d
```

