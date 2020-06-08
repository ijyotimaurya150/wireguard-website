# wireguard-website
Website and database setup component of client management for "https://www.github.com/jyotirmoy1904/vpnserver-setup.git"

Copy the components of website/ to /var/www/html/
Setup database using database_setup.sh script from 
<a href="https://github.com/jyotirmoy1904/vpnserver-setup/blob/master/database_setup.sh"> here.
 
<b>
  Changes to make in the script:
        <ul>
         <l1>Copy the contents of vpnserver_wireguard in the server to the same folder here.
         <l2>Edit the ssh details in Approve/approve.sh of the VPNServer in Approve/approve.sh script. (if using different server for website. Else comment out the line).
         <l3>Place theApprove_server.sh in the home directory of the VPNServer.
