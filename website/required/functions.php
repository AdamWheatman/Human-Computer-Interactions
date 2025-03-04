<?php 
    if (session_status() === PHP_SESSION_NONE) {session_start();};
    require_once("connections.php");
    $conn = mysqli_connect(DB_HOST, DB_SELECT, DB_SEL_PASS, DB_NAME);


    function prepare($sql_query, $conn, $email, $pass){
        //Preparing an SQL statement for execution
        $sql = $conn->prepare($sql_query); 
        //Within SQL statement that are multiple question marks, "?", which will be replaced with the parameters given
        //In this case the users email address, and password
        $sql->bind_param("ss", $email, $pass); 
        //Executes the query against the connected database
        $sql->execute();
        $result = $sql->get_result();
        //Sends results back to the "check_password()" function
        return $result ;
    }

    function check_password($email, $pass, $conn){
        // Checks to see if account exists within the database
        $sql = "SELECT email, pass FROM users WHERE email = ? AND pass =  ? ";
        $result = prepare($sql, $conn, $email, $pass);
        //Sends results back to the "login()" function
        return $result;
    }; 
    
    function staff_table($conn){
        // Creating the Header For The Table
       print(" <h1>All Staff</h1> 
        <table> <thead> <tr class = 'table_header'>
        <th>User ID</th> <th>Email </th> <th>First Name </th> <th>Last Name </th>
        <th>Admin </th> </tr> </thead> <tbody>");
        
        $sql = "SELECT * FROM users WHERE staff = '1'";
        $result = $conn->query($sql);
        $numrows = mysqli_num_rows($result);
        while($numrows > 0){
            while ($data = $result->fetch_object()) {
                
                // Outputting Data To The Screen, In The Form Of A Table
                printf("  <tr> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> </tr> ", 
                $data->user_id, 
                $data->email, 
                $data->first_name, 
                $data->last_name,
                $data->staff);
                $numrows -= 1;
            }
            print("</tbody></table>"); 
        }
    }

    function customer_table($conn){
        // Creating the Header For The Table
       print(" <h1>All Customers</h1> 
        <table> <thead> <tr class = 'table_header'>
        <th>User ID</th> <th>Email </th> <th>First Name </th> <th>Last Name </th>
        <th>Admin </th> </tr> </thead> <tbody>");
        
        $sql = "SELECT * FROM users WHERE staff = '0'";
        $result = $conn->query($sql);
        $numrows = mysqli_num_rows($result);
        while($numrows > 0){
            while ($data = $result->fetch_object()) {
                
                // Outputting Data To The Screen, In The Form Of A Table
                printf("  <tr> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> </tr> ", 
                $data->user_id, 
                $data->email, 
                $data->first_name, 
                $data->last_name,
                $data->staff);
                $numrows -= 1;
            }
            print("</tbody></table>"); 
        }
    }

    function login_checker(){
        if(!isset($_SESSION['account_type'])){
            header('Location:../login.php?error=1');
            exit;
        }elseif($_SESSION['account_type'] != 1){
            header('Location:../index.php?error=1');
            exit;
        }
    }

    function set_session() {
        if (!isset($_SESSION['loggedin'])) {
            $_SESSION['loggedin'] = 0;
        }
    }

    function test(){
        echo "login.php";
        echo "hello";
    }