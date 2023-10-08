# Server setup for "Box"

TODO

## Setup

1. Install requirements
    ```bash
   ansible-galaxy install -r requirements.yml
    ```
2. Add to an .envrc or other such file the following variables

   ```env
   STEAM_API_KEY=<your API key for Steam>
   SCREEPS_SERVER_PASSWORD=<a fairly secure password for the screeps server>
   TANDOOR_SECRET_KEY=<a secure secret key for Tandoor>
   TANDOOR_PSQL_PASSWORD=<a secure password for the Tandoor PSQL instance>
   ```