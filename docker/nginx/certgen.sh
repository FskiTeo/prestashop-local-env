#!/bin/bash

# Ce script génère un certificat SSL auto-signé pour un domaine donné
# et met à jour la configuration Nginx pour l'utiliser.

# Vérifier si un nom de domaine est fourni
if [ -z "$1" ]; then
    echo "Usage: $0 <domain_name>"
    echo "Example: $0 my-prestashop.local"
    exit 1
fi

DOMAIN=$1
SCRIPT_DIR=$(dirname "$0")
SSL_DIR="$SCRIPT_DIR/ssl"
CONF_FILE="$SCRIPT_DIR/default.conf"
KEY_FILE="$SSL_DIR/$DOMAIN.key"
CERT_FILE="$SSL_DIR/$DOMAIN.crt"

# Vérifier si openssl est installé
if ! command -v openssl &> /dev/null; then
    echo "Erreur: openssl n'est pas installé. Veuillez l'installer pour continuer."
    exit 1
fi

# Créer le répertoire SSL s'il n'existe pas
mkdir -p "$SSL_DIR"

echo "Génération du certificat SSL pour $DOMAIN..."

# Générer la clé privée et le certificat
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$KEY_FILE" \
    -out "$CERT_FILE" \
    -subj "/CN=$DOMAIN"

echo "Certificat et clé privée créés dans $SSL_DIR"

# Mettre à jour le fichier de configuration Nginx
# Remplace l'ancien domaine par le nouveau
echo "Mise à jour de la configuration Nginx dans $CONF_FILE..."
sed -i "s/prestashop\.localhost/$DOMAIN/g" "$CONF_FILE"

echo "Configuration Nginx mise à jour avec succès."
echo "N'oubliez pas de reconstruire et redémarrer votre conteneur Nginx pour appliquer les changements."
