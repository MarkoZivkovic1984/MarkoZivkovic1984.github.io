#!/bin/bash

# 1️⃣ Backup trenutnog stanja
echo "Creating backup commit..."
git add .
git commit -m "Backup before deploy" || echo "Nothing to commit, continuing..."

# 2️⃣ Generiši build sa Frozen-Flask
echo "Generating static build..."
python kartica.py

# 3️⃣ Kopiraj build fajlove u root repoa
echo "Copying build files..."
cp -r build/* .

# 4️⃣ Commit samo build fajlova
git add .
git commit -m "Deploy static build"

# 5️⃣ Push na GitHub bez forsiranja
git push origin main

echo "Safe deploy complete! Your site should be live."
