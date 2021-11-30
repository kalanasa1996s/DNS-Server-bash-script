# DNS-Server-bash-script
Easy to install DNS server using bash script for ubuntu (Debian) distribution

# Run the script file as root

To use this script follow the instruction

1.Clone git file in your pc

     git clone https://github.com/kalanasa1996s/DNS-Server-bash-script.git
     
2.Chage File Permission - execute
      
       cd DNS-Server-bash-script   
       sudo chmod a+x dnswiz.sh
       
3.Run bash file

        ./dnswiz.sh
        

** Script File Include Featues
    
     *.update newest versions of packages and their dependencies
     *.Install Git 
     *.Install Baind 9 (bind9 , bind9utils, bind9-doc-y)
     ------------------------------------------------------
     *.Config Config bind9 file for IPV4
     *.Config local server to use the local DNS service
     *.Create DNS Zone Files (forword lookup,revers lookup)
     *Authorizing the zone file for our domain
 ------------------------------------------------------------------------             
     *After Installing you can Check -

     Checking the zone files that we created

     Forward Lookup Zone :

          sudo named-checkzone example.local /etc/bind/for.example.local
          
     Reverse Lookup Zone :

          sudo named-checkzone 1.168.192.in-addr.arpa /etc/bind/rev.example.local
          
------------------------------------------------------------------------          
Checking DNS name resolution

     nslookup www.example.local
     nslookup 192.168.1.100
     dig www.example.local
     dig -x 192.168.1.100
------------------------------------------------------------------------
if you can add ip and name hosts file

     sudo nano /etc/hosts
     192.168.1.19    name    
