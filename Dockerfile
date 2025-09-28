FROM ghost:latest

# Set the working directory
WORKDIR /var/lib/ghost

# Copy custom content (themes, config, etc.)
COPY ./content ./content

# Use PostgreSQL instead of SQLite
ENV database__client=postgres
ENV database__connection__host=dpg-d3be73nfte5s739m6os0-a
ENV database__connection__port=5432
ENV database__connection__user=cms_db_je2n_user
ENV database__connection__password=YOUR_PASSWORD_HERE
ENV database__connection__database=cms_db_je2n

# Set the site URL (your Render domain)
ENV url=https://cms-project-udv9.onrender.com

# Expose the Ghost port
EXPOSE 2368

# Start Ghost
CMD ["node", "current/index.js"]

