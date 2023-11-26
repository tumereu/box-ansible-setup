# Server setup for "Box"

TODO

## Setup

1. Install Ansible requirements

    ```bash
   ansible-galaxy install -r requirements.yml
    ```
   
2. Create a `rclone` configuration file containing a remote where backups will be stored.
3. Add to an .envrc or other such file the following variables

   ```env
   STEAM_API_KEY=<your API key for Steam>
   SCREEPS_SERVER_PASSWORD=<a fairly secure password for the screeps server>
   
   TANDOOR_SECRET_KEY=<a secure secret key for Tandoor>
   TANDOOR_PSQL_PASSWORD=<a secure password for the Tandoor PSQL instance>
   
   BASE_DOMAIN=<the base domain for the server to be installed, ex. "example.com">
   ACME_EMAIL=<your email address, used with Let's Encrypt>
   
   RCLONE_CONFIG_FILE_PATH=<path to the rclone config file created in a previous step>
   RCLONE_BACKUP_REMOTE_NAME=<the remote name in rclone for backups>
   ```