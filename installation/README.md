# Application setup

## Database Installation
- Install postgress
- Create databse with name `app_db`
- Download the initial schema and seed script: [day_00_script.sql](./day_00_script.sql) — click to download.
- Run script against 'app_db'

## Application Installation

### Software

This application needs below software and provided under C:\OnlineApp\installer. Install these software with default instructions.

Install Java version 17
- Run **jdk-17_windows-x64_bin.exe**
- to check installation run command **java -version**

Install Node version 22
- Run node-v22.8.0-x64.msi
- To check installation run command **node --version**

Copy application files
- Copy all files to <Application root> folder. e.g. C:\OnlineApp
- create a folder `invoices` under application root folder e.g. C:\OnlineApp\invoices
- Update root folder in `application.yml` with <Application root> under \server\processor\config

Start Application
- Open command prompt and go to application root folder e.g. C:\OnlineApp
- Run command  `start-application.bat`
- Open browser and go to URL `http://<server-host>:9001`

Start Application
- Open command prompt and go to application root folder e.g. C:\OnlineApp
- Run command  `stop-application.bat`


