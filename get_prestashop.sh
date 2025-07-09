#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
PRESTASHOP_DIR="$SCRIPT_DIR/prestashop"

mkdir -p "$PRESTASHOP_DIR"

wget https://assets.prestashop3.com/dst/edition/corporate/8.2.1/prestashop_edition_classic_version_8.2.1.zip

unzip prestashop_edition_classic_version_8.2.1.zip -d prestashop/

rm prestashop_edition_classic_version_8.2.1.zip
