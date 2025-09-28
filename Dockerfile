FROM ghost:latest

# Set the working directory
WORKDIR /var/lib/ghost

# Install Postgres client for Ghost
RUN cd current && npm install pg --save --legacy-peer-deps

# Copy custom content (themes or config, if any)
COPY ./content ./content

# Tell Ghost to use Postgres
ENV database__client=postgres
ENV database__connection__host=dpg-d3cgaivdiees73fvrvm0-a
ENV database__connection__port=5432
ENV database__connection__user=cms_db_nkog_user
ENV database__connection__password=xTlpdLoMMDVL8BqaIsyoUbP2IUrcwWIi
ENV database__connection__database=cms_db_nkog

# Set the site URL (must match your Render domain)
ENV url=https://cms-project-udv9.onrender.com

# Expose the Ghost port
EXPOSE 2368

# Start Ghost
CMD ["node", "current/index.js"]


