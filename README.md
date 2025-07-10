# Prestashop Local Env, a Docker Compose environment for Prestashop

The goal is to create a replicable local environment that you can download, launch and develop on.

This includes `Nginx, Php with Xdebug, MsySQL, PhpMyAdmin & MailHog` containers

### Instructions to install :
1. Clone the repo and enter it;
2. `rm -rf .git*` will remove the current repository's config;
3. `sudo chmod +x docker/nginx/certgen.sh && bash docker/nginx/ prestashop.localhost` Change the `prestashop.localhost` for whatever domain you want, the config will be auto-updated;
4. `bash get_prestashop.sh` will download prestashop from offical website;
5. `mv .env.exemple .env && sudo .env` you can change environment variables if needed;
6. `docekr compose up -d --build` this will build the php image and start the containers;

---
Current prestashop version : 8.2.1
