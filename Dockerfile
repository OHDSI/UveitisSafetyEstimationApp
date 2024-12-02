# Set base image
FROM ohdsi/diagnosticsexplorer:3.2.5

# Set an argument for the app name
ARG APP_NAME
# Set arguments for the GitHub branch and commit id abbreviation
ARG GIT_BRANCH=unknown
ARG GIT_COMMIT_ID_ABBREV=unknown

# Set workdir and copy app files
WORKDIR /srv/shiny-server/

COPY global.R ./
COPY DataClean.R ./
COPY DataPulls.R ./
COPY PlotsAndTables.R ./
COPY server.R ./
COPY ui.R ./

COPY data/* ./data/

COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose default Shiny app port
EXPOSE 3838
# Run the Shiny app
CMD ["/start.sh"]
