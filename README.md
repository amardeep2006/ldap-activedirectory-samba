# ldap-activedirectory-samba
Run Active Directory with Samba Server in Docker Container.

Run Via Docker Compose in single command

`docker compose up --build -d`

OR build/run via individual commands

Build Docker image : 
`docker build -t ldap-ad -f Dockerfile .`

Run the Active Directory Container 
`docker run --name ldap-ad --hostname ldap.example.org --privileged -p 636:636 -e AD_DOMAIN=DEV-AD -e SMB_ADMIN_PASSWORD=admin123! ldap-ad`

You can use Apache Directory Studio to explore. https://directory.apache.org/studio/

Connect to localhost on port 686

USERNAME : DEV-AD\Administrator

Password : admin123!

![Alt text](image.png)

![Alt text](image-1.png)

Reference : This is based following Article, I have made some refinements : https://schneide.blog/2022/06/27/running-a-containerized-activedirectory-for-developers/