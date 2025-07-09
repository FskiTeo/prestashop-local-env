-- Ce script est exécuté au premier démarrage du conteneur MySQL.
-- Il crée la base de données pour PrestaShop si elle n'existe pas.

CREATE DATABASE IF NOT EXISTS `${MYSQL_DATABASE}` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
