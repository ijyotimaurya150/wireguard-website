//This script is a modified version of the client_generate script in https://www.github.com/jyotirmoy1904/vpnserver-setup.git

date=$(date +%F)
##Generating client keys
email=$1
workdir="vpnserver-wireguard"
check2=$(ls | grep "flag")
while  [[ ! -z $check2  ]]
  do
    sleep 0.5
  done
touch flag
client=$(cat $workdir/client_qty)
peer=$((client+1))
echo $peer > $workdir/client_qty
rm -f flag
client_private_key=$(wg genkey)
client_public_key=$(echo $client_private_key | wg pubkey)
peer=$((client+1))
server_public_key=$(cat $workdir/server_public_key)
server_ip=$(cat $workdir/server_ip)
file_name=$(echo $client_public_key | cut -c1-15 | tr -d /)
##Generating client configs
touch $file_name.conf
echo "[Interface]
Address = 10.200.200.$peer/24
PrivateKey = $client_private_key
DNS = 8.8.8.8" > $file_name.conf
echo "
[Peer]
PublicKey = $server_public_key
Endpoint = $server_ip:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 21" >> $file_name.conf
mysql --defaults-extra-file=.my.cnf -D vpn  -e "INSERT INTO clients VALUES($client, '$email', '$client_public_key', '0.0.0.0', '$file_name.conf', '$date', 0);"
echo "$file_name.conf"
