#!/usr/bin/env bash

if [[ ! -e ./.env ]]; then
  echo ".env file does not exist."
  exit 1
fi

source ./.env

case "${EMAIL}" in
  "") email_arg="--register-unsafely-without-email" ;;
  *) email_arg="--email ${EMAIL}" ;;
esac

lets_encrypt_env_message="Use Let's Encrypt production environment."
if [[ ! "$STAGING" -eq 0 ]]; then
  staging_arg="--staging"
  lets_encrypt_env_message="Use Let's Encrypt staging environment."
fi

echo ">> TLS Certificate settings."
echo "---"
echo "Domain:       ${DOMAIN_NAME}"
echo "Email:        ${EMAIL}"
echo "RSA key size: ${RSA_KEY_SIZE}"
echo ""
echo "${lets_encrypt_env_message}"
echo "---"

read -p "Do you obtain/renew certificate? (y/N) " decision
if [ "$decision" != "Y" ] && [ "$decision" != "y" ]; then
  echo "Aborted."
  exit 0
fi

echo ">> Start obtaining/renewing TLS certificate."
docker-compose run --rm --entrypoint "\
  certbot certonly \
    --manual \
    -w /var/www/certbot \
    $staging_arg \
    $email_arg \
    -d ${DOMAIN_NAME} \
    --rsa-key-size ${RSA_KEY_SIZE} \
    --agree-tos \
    --preferred-challenges dns \
    --force-renewal" certbot

if [[ ! "$?" -eq 0 ]]; then
  echo "Failed to obrain/renew TLS certificate." 
  exit 1
fi

echo "Done."
exit 0
