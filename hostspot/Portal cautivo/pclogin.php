//------1-----
Login by "Facebook":
<a href="#" style="text-decoration:none; font-family: verdana; color: #FF0000" onclick="select();return false;" title="Facebook."> Click here</a>
</p>
//-----1 end---
//-----2----
// and function select() - redirect non hotspot user ( external ) to another page insted facebook login
<script type="text/javascript">
<!--
function select()
{
var link = "<?php echo $_POST['link-login-only'] ?>";
if(link !== "")
{
document.redirect.submit();
} else {
window.open('/facebook.html','','width=500,height=350,scrollbars=yes');
}
}
//-->
</script>
//----2 end---
//----3-------
// and hidden form which call facebook login.php  page in directory apy
<form name="redirect" action="../api/login.php" method="post">
<input type="hidden" name="mac" value="<?php echo $_POST['mac']; ?>">
<input type="hidden" name="ip" value="<?php echo $_POST['ip']; ?>">
<input type="hidden" name="username" value="<?php echo $_POST['username']; ?>">
<input type="hidden" name="link-login" value="<?php echo $_POST['link-login']; ?>">
<input type="hidden" name="link-orig" value="<?php echo $_POST['link-orig']; ?>">
<input type="hidden" name="error" value="<?php echo $_POST['error']; ?>">
<input type="hidden" name="chap-id" value="<?php echo $_POST['chap-id']; ?>">
<input type="hidden" name="chap-challenge" value="<?php echo $_POST['chap-challenge']; ?>">
<input type="hidden" name="link-login-only" value="<?php echo $_POST['link-login-only']; ?>">
<input type="hidden" name="link-orig-esc" value="<?php echo $_POST['link-orig-esc']; ?>">
<input type="hidden" name="mac-esc" value="<?php echo $_POST['mac-esc']; ?>">
//------3 end---------
//------4------------
//this path open popup window if error occured and show useful links: create, activate and check permanent user. - see abow in my post.
<script type="text/javascript">
<!--
var a = "<?php echo $_POST['error'] ?>";
if(a !== "")
{
window.open('http://YOUR HOST NAME/errors/error.php?mac=<?php echo $mac; ?>&link=<?php echo $linkloginonly; ?>&user=<?php echo $username; ?>&error=<?php echo $error; ?>','','width=500,height=350,scrollbars=yes');
}
//-->
</script>
//-------4 end-------