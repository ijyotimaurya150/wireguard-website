<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <table cellpadding="10">
      <tr>
          <th><b>inryo </b></th>
      </tr>
    </table>
    <br>
    <br>
        <?php
                $email = $_POST['email'];
                $servername = "localhost";
                $username = "client_gen";
                $password = "password";
                $dbname = "vpn";

                $conn = mysqli_connect($servername, $username, $password, $dbname);
                if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
                     }
                $sql = "SELECT config_file_name FROM clients WHERE client_email='$email'";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
            ?>
            <a href="<?php echo $row["config_file_name"];?>">Retrieve config</a>
                    <?php }
                  } else {
                    echo "0 results";
                  }
                  $conn->close();
                  ?>
                    

    
                <br>
</body>
</html>