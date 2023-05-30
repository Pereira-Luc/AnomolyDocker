# Script to preapre the build environment for the projec

# Check if the user is root
if [ "$EUID" -ne 0 ]
  then printf "Please run as root\n"
  exit
fi

printf "Importent notice be sure to change the required configuration files"
printf "before running the build script\n\n"

printf "More information about config files can be found in the readme\n"



# Check if docker is installed
if ! [ -x "$(command -v docker)" ]; then
  printf "Docker is not installed\n"
  exit
fi

# Check if docker-compose is installed
if ! [ -x "$(command -v docker-compose)" ]; then
  if ! [ -x "$(command -v docker compose)" ]; then
    printf "Docker-compose is not installed\n"
    exit
  fi
fi

# Check if git is installed
if ! [ -x "$(command -v git)" ]; then
  printf "Git is not installed\n"
  exit
fi

## Ask the user if he wants to continue
read -p "Do you want to continue? [y/n]" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit
fi

printf "Preparing the build environment for the project\n"


# Clone the required repositories for the project
git clone https://github.com/Pereira-Luc/AnomolyServer

# Run docker-compose to build the project
docker-compose up -d --build
