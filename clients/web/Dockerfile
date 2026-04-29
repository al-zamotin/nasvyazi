FROM node:20-alpine

# Select work directory
WORKDIR /app

# Copy dependency files only
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project code
COPY . .

# Open vite port
EXPOSE 5173

# Start vite
CMD ["npm", "run", "dev", "--", "--host"]
