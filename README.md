# What's this?
This is the crazy idea of leveraging SSH and containers to create text based APIs

What if instead of users, those IDs now represent methods?

SSH provides us with out of the box security (authentication, encryption) and Docker
enables us to quickly package and deploy these APIs, no matter what language you use.

# Usage
This project is meant to be used by using it's docker image and adding a user per
API method, which will have the implementation script or binary as shell for that
user. I encourage you to take a look at the examples for a better understanding.

## docker images
You can create images for x86 and RaspberryPi going into `docker` folder and run
`make`command (you need to have `cpp`command installed as it's used for `Dockerfile`
pre-processing.

