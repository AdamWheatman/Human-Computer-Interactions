<?php 
    if (session_status() === PHP_SESSION_NONE) {session_start();};
    require_once("required/connections.php");
    require_once("required/functions.php");
    set_session();
    //If the submit button has been pressed
    if(isset($_POST["submit_button"])){
        //Connectiung user to the database
        $conn = mysqli_connect(DB_HOST, DB_SELECT, DB_SEL_PASS, DB_NAME);
        //Collecting user inputted data from previous page
        $email = $_POST ["login_email"];
        $pass = $_POST ["login_password"];
        //Checking to see if the input fields are empty
        if(empty($email) || empty($pass)){
            //If either email or password are empty display this message
            echo "<br> <br> <h2>Email Address and Password Cannot Be Empty  <br> <br>" ;
            echo "Please Try Again ";               
        }else{
            $all_good = check_password($email, $pass, $conn);
            //If the results come back empty then an error message will show
            if(!$all_good){
                //error
                echo "<br> <br> <h2>You Have Cause An Unknown Error <br> <br>";
                echo "Please Try Again ";
            }else{ 
                //Checking how many results the executed query retrieved from the database, the answer should be one
                $num_rows = mysqli_num_rows($all_good);
                if($num_rows <= 0){
                    // If the result is not one then the wrond username or password was entered
                    printf("<br> <br> <h2>The Username And Password Combination Does Not Match <br> <br>") ;
                    echo "Please Try Again ";
                }else{
                    //correct username and password combination
                    $sql = "SELECT * FROM users WHERE email = '$email' AND pass = '$pass' ";
                    $result = $conn->query($sql);
                    $data = $result->fetch_object();
                    $_SESSION['loggedin'] = 1;
                    $_SESSION['name'] = $data->first_name;
                    $_SESSION['email'] = $data->email;
                    $_SESSION['password'] = $data->pass;
                    $_SESSION['account_type'] = $data->staff;
                    if($data->staff == 1){
                        echo "<br>Logged In Successfully as Staff";
                    }else{
                        echo "<br>Logged In Successfully as Customer";
                    }
                }
            }
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/base.css">
    <link rel="stylesheet" href="CSS/index.css">
    <title>92 Donner Kings</title>
</head>
<body>
    <?php 
        require_once("required/header.php");
        if ( isset($_GET['error']) && $_GET['error'] == 1 ){ echo "Login as a staff member to view this page <br><br>";}
    ?>
    <form action = " " method = "post" class = "form">

        <label for = "login_email">
            Email Address: 
        </label>
        <input type = "email" class = "input" name = "login_email" id = "login_email" placeholder = "Email Address " required> 

        <br><br>

        <label for = "login_password">
            Password:
        </label>
        <input type = "password" class = "input" name = "login_password" id = "login_password" placeholder = "Password " required>
        
        <br><br>

        <button type = "submit" class = "submit" name = "submit_button" id = "submit_button" >
            Log In
        </button>
        
    </form>

</body>
</html>

