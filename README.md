# CI/CD Pipeline Project

This repo conatins the code for a TakeNote application on which CI/CD is implemented.
This is the CI/CD, implemeted in this project :- 

![CI/CD](cicdImage/png)



## Tools used in CI/CD
- Docker
- Jenkins
- Sonarqube 
- ArgoCD
- Kubernetes



## Local Development for the TakeNote application

Make sure you're on Go version 1.22+.

Create a `.env` file in the root of the project with the following contents:

```bash
PORT="8080"
```

Run the server:

```bash
go build -o TakeNote && ./TakeNote
```

*This starts the server in non-database mode.* It will serve a simple webpage at `http://localhost:8080`.

