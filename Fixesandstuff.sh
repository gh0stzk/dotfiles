# Made by AzhamMakesTrash in order to help with permissions errors on the rice

# Chmod the scripts in the config/bspwm/scripts folder to aloow them to run as programs

if [ -d ~/.config/bspwm/scripts ]; then
    printf "Fixing permissions error...\n"
    chmod +x ~/.config/bspwm/scripts/*
    printf "Done!\n"
fi

