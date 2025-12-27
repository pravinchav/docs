

# Application setup
This document explains how to prepare the environment and install the application. It covers database setup (creating the app_db and applying the initial schema), required software (Java 17 and Node 22), copying application files, creating the invoices folder, and starting/stopping the application. Use the quick verification tests below to validate key steps after installation.

## Database Installation
- Install postgress
- Create databse with name `app_db`
- Download the initial schema and seed script: <a href="./day_00_script.sql" download="day_00_script.sql">Download day_00_script.sql</a>.
- Run script against 'app_db'

## Application Installation

### Software

Install Java version 17
- Run `jdk-17_windows-x64_bin.exe`
- to check installation run command `java -version`

Install Node version 22
- Run `node-v22.8.0-x64.msi`
- To check installation run command `node --version`

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



