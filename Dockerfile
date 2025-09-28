FROM ghost:latest

# Set the working directory
WORKDIR /var/lib/ghost

# Install Postgres client for Ghost
RUN npm install pg --save

# Copy custom content (themes or config, if any)
COPY ./content ./content

# Use Postgres instead of SQLite
ENV database__client=postgres
ENV database__connection__connectionString=$DATABASE_URL

# Set the site URL (replace with your Render domain)
ENV url=https://cms-project-udv9.onrender.com

# Expose the Ghost port
EXPOSE 2368

# Start Ghost
CMD ["node", "current/index.js"]

