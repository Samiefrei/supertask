FROM node:20-alpine

ENV NODE_ENV=production

# Crée le dossier avec les bons droits
RUN mkdir -p /home/node/app && chown -R node:node /home/node

WORKDIR /home/node/app

# Copie des manifests
COPY package*.json ./

# Installation en root (autorisé)
RUN npm ci --omit=dev && npm cache clean --force

# Copie du code
COPY . .

# Passage en utilisateur non-root POUR LE RUNTIME
USER node

EXPOSE 3000
CMD ["node", "server.js"]
