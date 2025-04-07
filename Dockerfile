# Use Railway's Nixpacks base image
FROM ghcr.io/railwayapp/nixpacks:ubuntu-1741046653

# Install dependencies using Nix
RUN nix-env -iA nixpkgs.nodejs

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (for Node.js projects)
COPY package*.json /app/

# Install dependencies with npm ci (for Node.js)
RUN --mount=type=cache,id=s/1d9f3940-d370-42f5-80ff-7c8520dd76c1-/root/npm,target=/root/.npm npm ci

# Copy the rest of your application
COPY . /app

# Run your application (adjust the command as necessary)
CMD ["npm", "start"]
