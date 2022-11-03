<?php
   $link=$_GET['link'];
   $error=$_GET['error'];
 ?>
<head>
<meta name="verify-webtopay" content="{Your pass in payment system}">
<meta http-equiv='Content-Language' content='lt' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<link rel="stylesheet" type="text/css" href="css.css">
<font color=red size="5" ><b><?php echo $error; ?>!</b></font>
<br />
<font color=red><b>For permanent use online,</b></font>
<br> 
<font color=red><b>*1.</b></font>You must to create user, see link below,<br>
complete form and click "Add user".<br>
<font color=red><b>*2.</b></font>After user creation it must be activated: link<br>
"User activation", read all instruction and follow it.<br>
<font color=red><b>*3.</b></font>If If Your user already exist and you have no credits,<br>
follow link "Buy credits",<br>
read all instruction and follow it..<br />
<!--
<font color=red><b>Important!</b></font> If you do not use a long time, it is necessary to check <br>
account via a link on the bottom, <br>
as subscribers inactive over 60 days are removed from the system <br>
automatically. <br />
-->
<?php 

include "links.php";

?>
<body>
<script type="text/javascript" charset="utf-8">
                        	    var wtpQualitySign_projectId  = {YOUR ID IN PAYMENT SYSTEM};
                        	    var wtpQualitySign_language   = "lt";
                            	</script>
                            	<script src="https://www.webtopay.com/new/js/project/wtpQualitySigns.js" type="text/javascript" charset="utf-8"></script>
</body>