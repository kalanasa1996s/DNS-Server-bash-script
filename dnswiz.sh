#!/bin/bash

RED="\e[41m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

clear

if (whiptail --title "DNS SERVER SETUP WIZARD for (UBUNTU) Dabin family" --yesno "Do you want to continue  yes/no " 8 78); then

   echo "-----------------------System Update---------------------------------"

      apt-get update

    echo "-----------------------Install Bind 9---------------------------------"

     apt-get install bind9 bind9utils bind9-doc -y

    echo "-----------------------Bind9 Restart---------------------------------- "

    systemctl restart bind9

    echo "-------------------------Edit bind9-----------------------------------"

    nano /etc/default/bind9


     echo "-----------------------Config local server -> local DNS--------------"


     nano /etc/resolv.conf

     echo "

-------------------------Clone DNS Zone Config-------------------------------

  "
    echo "------------------------INSTALL GIT ------------------------------ "
     apt install git -y

     git clone https://github.com/kalanasa1996s/forword-lookup.git

     echo "---Moving for and rev to etc/bind--"
     mv forword-lookup/for.home.local /etc/bind/    
     mv forword-lookup/rev.home.local /etc/bind/


     echo "--Config forword lookup--"
     nano /etc/bind/for.home.local
     echo "Config reverse Lookup"
     nano /etc/bind/rev.home.local


     echo "Rename forword lookup "

     dirname=$(whiptail --inputbox "Rename forword lookup ?" 8 39 for.example.local --title "DNS Zoone" 3>&1 1>&2 2>&3)

     exitstatus=$?
     if [ $exitstatus = 0 ]; then
     mv /etc/bind/for.home.local /etc/bind/$dirname

     else
     echo "User selected Cancel."
     fi


     echo "rename revers lookup"

     dirname=$(whiptail --inputbox "Rename reverse lookup ?" 8 39 rev.example.local --title "DNS Zoone" 3>&1 1>&2 2>&3)

     exitstatus=$?
     if [ $exitstatus = 0 ]; then
     mv /etc/bind/rev.home.local  /etc/bind/$dirname

     else
     echo "User selected Cancel."
     fi


     echo "Clone git - named.conf.local file"
     git clone https://github.com/kalanasa1996s/named.git

     echo "rename defalt file named.conf.local"
     mv /etc/bind/named.conf.local /etc/bind/named.conf.local.back

     echo "edit name.conf.local"
     mv named/named.conf.local /etc/bind     
     nano /etc/bind/named.conf.local
    
    echo "Remove clone Files in /root"
    rm -r forword-lookup/
    rm -r named/

     echo "Restart Bind 9"
     systemctl restart bind9
     
    
    

     echo -e  "${RED}
           1.Check Bind9 Status
           2.Checking the zone files that we created

           *Forward Lookup Zone :named-checkzone (yourdomian and forward lookup file name)  
            example.local /etc/bind/for.example.local

           *Reverse Lookup Zone :named-checkzone (your ip and revserse lookup file name  )
              1.168.192.in-addr.arpa /etc/bind/rev.example.local


          ${ENDCOLOR} "

      echo -e " ${RED} THANK YOU FOR USING MY SCRIPT
               git:https://github.com/kalanasa1996s
               web:www.sasankageek.tk | mail:kalana@sasankageek.tk

              ${ENDCOLOR} "


else
    echo "BYE........................................................................"
fi

