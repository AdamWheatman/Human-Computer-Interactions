

<header>
    <div class= "google_translate_element" id="google_translate_element"></div>
    <nav class="nav">
        <div class="container">
            <div class="nav_left">
                <a href="#" class="nav_link menu">Menu</a>
                <a href="#" class="nav_link about_us">About Us</a>
            </div>
        </div>

        <div class="container">
            <div class="nav_middle">
                <a href="/" class="nav_link logo_img"><img class ="logo_img" src="../images/logo.png" alt="92 Donner Kings Logo"></a>
            </div>
        </div>

        <div class="container">
            
            <div class="nav_right">
                <?php 
                    if($_SESSION['loggedin'] == 1){
                        echo "<a href='../admin/admin_home.php' class='nav_link Admin'>Admin</a>";
                        echo "<a href='/logout.php' class='nav_link logout'>LogOut</a>";
                    }else{
                        echo"<a href='/create_account.php' class='nav_link create_account'>Create Account</a>";
                        echo "<a href='/login.php'class='nav_link login'>Login</a>";
                    }
                ?>
            </div>
            
        </div>
    </nav>
</header>
    

<!-- Google Translate Element From: https://wcmshelp.ucsc.edu/advanced/google-translate.html -->
<script type="text/javascript">
    // <![CDATA[
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
        }
    // ]]>
</script>

<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit" type="text/javascript"></script>