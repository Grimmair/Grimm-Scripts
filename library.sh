#!/bin/bash

#funktio yksi
#koneiden lisäys /etc/hosts

fun01()
{
	echo "Checking hosts file"
	cat /etc/hosts
	read -p "Do you want to make changes to hosts file? yes/no: " vas1
	case $vas1 in

	"yes") 	read -p "Give me your ip-address: " osoite1
		read -p "Give me your hostname: " hosti1
			sudo sed -i '2 i\$osoite1 $hosti1' /etc/hosts

		;;
	*)	echo "Returning to menu."
		;;

	esac
}

#funktio kaksi
#Puppetmasterin asennus

fun02()
{
sudo apt-get update
sudo apt-get install puppetmaster
}

#funktio kolme
#Asennuksen tarkistus

fun03()
{
sudo apt-get update
sudo puppet resource package puppetmaster ensure=latest
}

#funktio neljä
#backuppien otto

fun04()
{
sudo cp /etc/puppet/puppet.conf $HOME/puppetbkup
sudo cp /etc/hosts $HOME/hostsbkup
sudo cp /etc/ntp.conf $HOME/ntpbackup
}

#funktio viisi
#Staattisen IP osoitteen laitto

fun05()
{
echo "Checking your IP configuration"
ifconfig
read -p "Do you want to change your IP configuration? yes/no: " vas2
	case $vas2 in

		"yes")	read -p "Give me your IP-address: " iposoite
			read -p "Give me your netmask: " maski
			read -p "Give me your gateway: " gate
			read -p "Give me dns-server: " deens

			sudo sed -i '10 c/iface eth0 inet static' /etc/network/interfaces
			sudo sed -i '12 c/address ${iposoite}' /etc/network/interfaces
			sudo sed -i '13 c/netmask ${maski}' /etc/network/interfaces
			sudo sed -i '14 c/gateway ${gate}' /etc/network/interfaces
			sudo sed -i '15 c/dns-nameservers ${deens}' /etc/network/interfaces

			;;

		*)	echo "Returning to menu."
			;;
	esac
}

#funktio 7
#Install NTP
fun07()
{
        sudo apt-get update
        sudo apt-get install ntp
}

#funktio 8
#Configure /etc/ntp.conf
fun08()
{
        echo "Checking ntp.conf"
        cat /etc/ntp.conf | less
        echo ""
        read -p "Do you wish to make changes to the file? yes/no: " vas8

                case $vas8 in
                        "yes")
                                sudo sed -i '19 c\server 0.fi.pool.ntp.org' /etc/ntp.conf
                                sudo sed -i '20 c\server 1.fi.pool.ntp.org' /etc/ntp.conf
                                sudo sed -i '21 c\server 2.fi.pool.ntp.org' /etc/ntp.conf
                                sudo sed -i '22 c\server 3.fi.pool.ntp.org' /etc/ntp.conf
                                ;;

                        *)
                                echo "Returning to menu."
                                ;;
                esac
}

#funktio 6
#Configure /etc/puppet/puppet.conf
fun06()
{
        echo "Checking /etc/puppet/puppet.conf"
        cat /etc/puppet/puppet.conf
        read -p "Do you wish to make changes to the file? yes/no: " vas3
        case $vas3 in

        "yes")  sudo sed -i '10 i\dns_alt_names = puppet, puppetmaster' /etc/puppet/puppet.conf
                sudo sed -i '11 i\certname = puppet' /etc/puppet/puppet.conf
                        ;;
        *) echo "Returning to menu"
                        ;;
	esac

}

fun10()
{
        sudo service puppet restart
}

#funktio 9
#Resetting puppet-ssl
fun09()
{
        read -p "Do this only once. input y to continue: " valintatalo

        case $valintatalo in

                "y")
                        sudo rm -rf /var/lib/puppet/ssl
                        sudo puppet master --verbose -no-daemonize
                ;;

                *) echo "Returning to menu."
                ;;
	esac
}

