<?php
$mac=$_POST['mac'];
$ip=$_POST['ip'];
$username=$_POST['username'];
if ($username === 'undefined') {
$username = '';
}
$linklogin=$_POST['link-login'];
$linkorig=$_POST['link-orig'];
$linkloginonly=$_POST['link-login-only'];
$chapid = $_POST['chap-id'];
$chapchallenge = $_POST['chap-challenge'];
//$chapid=clear($_POST['chap-id']);
//$chapchallenge=clear($_POST['chap-challenge']);
$linkorigesc=$_POST['link-orig-esc'];
$macesc=$_POST['mac-esc'];
$trial=$_POST['trial'];
$error=$_POST['error'];
function clear($code) { return str_replace('\\\\', '\\', $code); } 
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv='Content-Language' content='lt' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="expires" content="-1" />
<title>Free HotSpot | Login Facebook</title>
<link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon">
<link rel="icon" href="../images/favicon.ico" type="image/x-icon">
<link href="css/style.css" type="text/css" rel="stylesheet" />
<style type="text/css">
            .button
            {
            background: url(fb.png) no-repeat;
	    width: 100px;
		height: 30px;
            cursor:pointer;
                        border: none;
            }
        </style>
</head>
<body>
<div id="fb-root"></div>
<div id="user-info"></div>
<script>
window.fbAsyncInit = function() {
FB.init({
 appId: '{YOUR API ID}',
 channelUrl : '//YOUR HOST NAME/api/channel.html',
 status: true,
 cookie: true,
 xfbml: true,
 oauth: true});
  function updateButton(response) {
    var button = document.getElementById('fb-auth');
    if (response.authResponse) {
      //user is already logged in and connected
      var userInfo = document.getElementById('user-info');
      FB.api('/me', function(response) {
old_pass = response.email; 
temp_pass = replace_string(old_pass,'@','A') ;
new_pass = replace_string(temp_pass,'.','T') ;
//    userInfo.innerHTML = '<iframe src="http://YOUR HOST NAME/api/user.php?mac=<?php echo $_POST['mac']; ?>&user=' + response.email + '&nama=' + response.name + '" width="1" height="1"></iframe>';
//   userInfo.innerHTML = '<iframe src="http://YOUR HOST NAME/api/user-um.php?mac=<?php echo $_POST['mac']; ?>&user=' + response.email + '&nama=' + response.name + '&password=' + new_pass + '" width="1" height="1"></iframe>';
document.useradd.user.value = response.email;
document.useradd.nama.value = response.name;
document.useradd.password.value = response.name;
document.useradd.submit();
			  wait(8000);
//self.location ='<?php echo $linkloginonly; ?>?dst=<?php echo $linkorig; ?>&password=' + response.name + '&username=' + response.email ;
document.login.username.value = response.email;
document.login.password.value = response.name;
document.login.submit()
});
      button.onclick = function() {
        FB.logout(function(response) {
          var userInfo = document.getElementById('user-info');
         userInfo.innerHTML="";
 });
      };
    } else {
      //user is not connected to your app or logged out
      button.onclick = function() {
        FB.login(function(response) {
   if (response.authResponse) {
            FB.api('/me', function(response) {
       var userInfo = document.getElementById('user-info');
     });   
          } else {
            //user cancelled login or did not grant authorization
          }
        }, {scope:'email'});   
      }
    }
  }
  // run once with current status and whenever the status changes
  FB.getLoginStatus(updateButton);
  FB.Event.subscribe('auth.statusChange', updateButton); 
};
(function() {
  var e = document.createElement('script'); e.async = true;
  e.src = document.location.protocol+ 'all.js';
  document.getElementById('fb-root').appendChild(e);
}());
function wait(msecs)
{
var start = new Date().getTime();
var cur = start
while(cur - start < msecs)
{
cur = new Date().getTime();
}	
};
function replace_string(txt,cut_str,paste_str)
{ 
var f=0;
var ht='';
ht = ht + txt;
f=ht.indexOf(cut_str);
while (f!=-1){ 
f=ht.indexOf(cut_str);
if (f>0){
ht = ht.substr(0,f) + paste_str + ht.substr(f+cut_str.length);
};
};
return ht
}
</script>
</center>
<div id="content">
<p><h4><font color="#000000">Hotspot Free with Facebook.</font></h4></p>
<button id="fb-auth" class="button"></button>
<br />
<br />
<font color="#000000" size="-1"><i>Working on pc/laptop</i></font><br />
<!-- $(if error) -->
<div style="color: #FF8080; font-size: 11px"><?php echo $error; ?></div>
<!-- $(endif) -->
</div>
<br />
<div id="footer">
<font color="#000000">Auksela Free Net © 2013.</font></a>
</div>
</div>
<!-- $(if chap-id) -->
	<form name="sendin" id="sendin" action="<?php echo $_POST['link-login-only']; ?>" method="post">
		<input type="hidden" name="username" />
		<input type="hidden" name="password" />
<!--
		<input type="hidden" name="error" />
-->
		<input type="hidden" name="dst" value="<?php echo $_POST['link-orig']; ?>" />
		<input type="hidden" name="popup" value="true" />
	</form>
	<script type="text/javascript" src="./md5.js"></script>
	<script type="text/javascript">
	<!--
	    function doLogin() {
                <?php if(strlen($chapid) < 1) echo "return true;\n"; ?>
		document.sendin.username.value = document.login.username.value;
		document.sendin.password.value = hexMD5('<?php echo $_POST['chap-id']; ?>' + document.login.password.value + '<?php echo $_POST['chap-challenge']; ?>');
		document.sendin.submit();
		return false;
	    }
	//-->
	</script>
<!-- $(endif) -->
<!-- removed $(if chap-id) $(endif)  around OnSubmit -->
	<form name="login" id="login" action="<?php echo $_POST['link-login-only'];?>" method="post" onSubmit="return doLogin()" >
		<input type="hidden" name="dst" value="<?php echo $_POST['link-orig']; ?>" />
		<input type="hidden" name="popup" value="true" />
<!--	
		<input type="hidden" name="error" value="<?php echo $_POST['error']; ?>" />
-->
        <input type="hidden" name="username" value=""/>
	    <input type="hidden" name="password" value=""/>
<!--			
        <input type="submit" value="Connect" />
-->
</form>
	<form name="useradd" id="useradd" action="user-um.php" method="post">
        <input type="hidden" name="user" value=""/>
		<input type="hidden" name="nama" value=""/>
		<input type="hidden" name="mac" value="<?php echo $_POST['mac']; ?>" />
	    <input type="hidden" name="password" value=""/>
<!--			
        <input type="submit" value="Connect" />
-->
</form>
// path below is commented , uncoment it if you want popup windows error.php which show links to register and activate permanent account
<!--
<script type="text/javascript">
<!--
var a = "<?php echo $_POST['error'] ?>";
if(a !== "")
{
window.open('http://YOUR HOST NAME/erros/error.php?mac=<?php echo $mac; ?>&link=<?php echo $linkloginonly; ?>&user=<?php echo $username; ?>&error=<?php echo $error; ?>','','width=500,height=350,scrollbars=yes');
}
//-->
<!--
</script>
-->
</body>
</html>