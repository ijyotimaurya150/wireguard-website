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
                $command = 'bash /var/www/html/client_generate.sh '.$email.'';
                $output = shell_exec($command);?>
                <a href="<?php echo $output;?>">Download config</a>
                <br>
                Right click on "Download Config" and select SaveAs to download the configuration file.
                For further instructions <a href="wiki.html"> Click here </a>
</body>
</html>