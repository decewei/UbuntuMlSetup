#!/bin/bash

USER=`sh get_current_user.sh`
sudo apt-get install -y imwheel

# default setup
rm ~/.imwheelrc
touch ~/.imwheelrc
sudo chown $USER:$USER ~/.imwheelrc

echo "\".*\"
None,      Up,   Button4, 3
None,      Down, Button5, 3
Control_L, Up,   Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L,   Up,   Shift_L|Button4
Shift_L,   Down, Shift_L|Button5" >> ~/.imwheelrc

mkdir ~/.startup
sudo chown -R $USER:$USER ~/.startup
cd ~/.startup
rm chwheelspeed
touch chwheelspeed

# manual script
echo "
#!/bin/bash
killall imwheel

speed=\$1
rm ~/.imwheelrc
touch ~/.imwheelrc

echo \"\\\".*\\\"
None,      Up,   Button4, \$speed
None,      Down, Button5, \$speed
Control_L, Up,   Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L,   Up,   Shift_L|Button4
Shift_L,   Down, Shift_L|Button5\" >> ~/.imwheelrc

imwheel
" >> chwheelspeed

# alias setup
echo "
function chwheelspeed_(){
    sh ~/.startup/chwheelspeed \$*
}
alias chwheelspeed='chwheelspeed_'" >> ~/.bash_profile
. ~/.bash_profile
