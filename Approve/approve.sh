#!/bin/bash
echo "Unapproved Client requests:"
mysql -uroot -p -e"SELECT * FROM vpn.clients WHERE Approved=0"
echo ""
echo ""
echo "Select the Client to approve/delete"
read client
mysql -uroot -p  -e "SELECT * FROM vpn.clients WHERE Approved=0 AND client_id= $client "
echo "To Approve, enter y; To Delete, enter n"
read inp
if [[ $inp == "y" ]];
        then
                echo "APPROVING..."
                key=$(mysql -uroot -p -D vpn -Ns -e"SELECT client_key FROM clients WHERE Approved=0 AND client_id=$client")
                ssh <user_name>@<VPN_SERVER_IP> /home/<user_name>/approve.sh $key $client
                echo "Approved $key"
                mysql -uroot -p -e "UPDATE vpn.clients SET Approved=1 WHERE client_id=$client"
        elif [[ $inp == "n" ]];
        then
                echo "DELETING.."
                mysql -uroot -p -e "DELETE FROM vpn.clients WHERE client_id=$client"
fi
