# CV
This repo is for version control for my CV.

## setup
To create a `venv` and install dependencies, simply run `source setup.sh`

## TODO items

### bragging items
- ops
    - Deployed and maintained 16 airflow instances (4 teams, dev/prod, 2 failover) to openshift with helm. Later custom yaml interpolated for different instances.
    - Wrote a set of software to monitor and facilitate the scheduled removal of 100s of TBs (around 800TB by the time I left the team) of data in a production environment
    - Developed and maintained scripts that automate daily health checks so engineers only have to sign off
    - After hours overtime maintainence and support schedule
    - investigating production events: drive failures, node crashes at 4am

- traffic
    - batched processing in python to make 300GB tasks of spatial data fit into a 16GB VM
    - wrote scripts to set up environment

- electricity
    - wrote some dev tools to help reboot a stale project
    - saw some of the first use-cases to move into dev
    - developed looker studio dashboards
    - scheduled service account notebooks in vertexai
    - made more performant backfills from daily ingestions (by selecting accross underscore star tables) for 300 line SQL queries