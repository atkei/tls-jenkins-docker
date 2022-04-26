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
- `LETSENCRYPT_STAGING`: Use the staging server to obtain or revoke certificates
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

