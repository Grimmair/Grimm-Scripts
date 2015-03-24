#!/bin/bash

#menu
#works
menu()

{
op=0
while [ $op -le 1 ]
        do
clear
echo "Welcome to installing puppet through scripts"
echo "Following this menu on descending order will"
echo "have you install and configure puppet in very"
echo "basic way."
echo ""
echo "1. Configuring hosts file."
echo "2. Installing Puppet."
echo "3. Version checking Puppet."
echo "4. Taking backups of current configurations."
echo "5. Exit menu."
echo ""
                read -p "Choose between 1-4: " choice
                case $choice in

                        1) fun01
                        ;;

                        2) fun02
                        ;;

                        3) fun03
                        ;;

                        4) fun04
                        ;;

                        5)
                                echo "thank you for using this script."
                                exit 0
                        ;;
                esac
        done
}

#fun01
#koneiden lisäys /etc/hosts
fun01()
{
  echo "Checking hosts file"
        cat /etc/hosts
        read -p "Do you want to make changes to hosts file? yes/no: " vas1
        case $vas1 in

        "yes")  read -p "Give me your ip-address: " osoite1
                read -p "Give me your hostname: " hosti1
                        sudo sed -i '2 i\$osoite1 $hosti1' /etc/hosts

                read -p "Give me puppetmaster ip-address: " osoite2
                read -p "Give me puppetmaster hostname: " hosti2
                        sudo sed -i '3 i\$osoite2 $hosti2' /etc/hosts
                ;;
        *)      echo "Returning to menu"
                ;;
        esac
}

#fun02
#Puppetin asennus

fun02()
{
sudo apt-get update
sudo apt-get install puppet
}

#fun03
#Asennuksen tarkistus

fun03()
{
sudo apt-get update
sudo puppet resource package puppet ensure=latest
}

#fun04
#backuppien otto

fun04()
{
sudo cp /etc/puppet/puppet.conf $HOME/puppetbkup
sudo cp /etc/hosts $HOME/hostsbkup
}
