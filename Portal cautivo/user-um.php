<?php
namespace PEAR2\Net\RouterOS;
include_once '../src/php/PEAR2/Autoload.php';
include 'param.common.php';
//../include_once 'PEAR2_Net_RouterOS-1.0.0b3.phar';
?>
 <?php
$user=$_POST['user'];
$mac=$_POST['mac'];
$nama=$_POST['nama'];
//$password=md5(md5($_POST['user']));
//$password=$_POST['user'];
$password=$_POST['password'];
//$password=$_POST['nama'];
$txt1 = ' ';
$profile = 'Trial';
$location = 'Your location';
$location = $location.$txt1.$mac;
$customer = 'facebook';
$comment = $nama.$txt1.$mac;
$comment1 = 'Added by Facebook';
$client = new Client($host,$admin,$pass);
//------------------
 try {$printRequest = new Request('/system clock print');
//------
	$array=$client->sendSync($printRequest)->getAllArguments(array(
	'date' => 'date',
	'time'=> 'time'));
//------
$comment1 = $array['date'].$txt1.$array['time'].$txt1.$comment1;
$comment = $array['date'].$txt1.$array['time'].$txt1.$comment;
$printRequest = new Request('/tool user-manager user print');
	$printRequest->setQuery(Query::where('name',$user));
	$array=$client->sendSync($printRequest)->getAllArguments(array('.id' => '.id',
	'actual-profile' => 'actual-profile',
	'last-seen' => 'last-seen',
	'uptime-used' =>'uptime-used',
	'download-used' => 'download-used',
	'upload-used' => 'upload-used',
	'comment' => 'comment'));
//----
if (null !== $array['.id'] ) {
echo "User {$user} already registered in system!<br>";
if (null !== $array['actual-profile'] ) {
echo "User {$user} reached time limit!<br>";
} else {
//--- Reset counters
$setRequest = new Request('/tool user-manager user reset-counters');
$setRequest->setArgument('numbers',$array['.id']);
$client->sendSync($setRequest);
echo "All counters for {$user} Id {$array['.id']}successfully reseted!!!<br>";
//--- Create and activate profile
$addRequest = new Request('/tool user-manager user create-and-activate-profile');
$addRequest->setArgument('customer',$customer);
$addRequest->setArgument('numbers',$array['.id'] );
$addRequest->setArgument('profile',$profile);
$client->sendSync($addRequest);
//---add comment
$setRequest = new Request('/tool user-manager user comment');
$setRequest->setArgument('numbers',$array['.id']);
$setRequest->setArgument('comment',$comment1);
if ($client->sendSync($setRequest)->getType() !== Response::TYPE_FINAL) {
echo "Error when aactivated  '{$user}'.<br>";
} else {
echo "User {$user} successfully activated!!!<br>";
}
}
} else {
//--- Add user
$addRequest = new Request('/tool user-manager user add');
$addRequest->setArgument('customer', $customer);
$addRequest->setArgument('name', $user);
$addRequest->setArgument('first-name', $nama);
$addRequest->setArgument('last-name', $nama);
$addRequest->setArgument('location', $location);
$addRequest->setArgument('email', $user);
$addRequest->setArgument('password', $password);
$addRequest->setArgument('phone','370');
$addRequest->setArgument('disabled', no);
$addRequest->setArgument('comment', $comment);
$addRequest->setArgument('shared-users', 1);
if ($client->sendSync($addRequest)->getType() !== Response::TYPE_FINAL) {
echo "Error when added user for '{$nama}'.<br>";
} else {
echo "Comment: '{$comment}'. User'{$user}' successfully added!.";
}
//--- Create and activate profile
$printRequest = new Request('/tool user-manager user print');
$printRequest->setArgument('.proplist', '.id');
$printRequest->setQuery(Query::where('name', $user));
$userId = $client->sendSync($printRequest)->getArgument('.id');
$addRequest = new Request('/tool user-manager user create-and-activate-profile');
$addRequest->setArgument('customer', $customer);
$addRequest->setArgument('numbers', $userId );
$addRequest->setArgument('profile', $profile);
$client->sendSync($addRequest);
$setRequest = new Request('/tool user-manager user comment');
$setRequest->setArgument('numbers',  $userId );
$setRequest->setArgument('comment', $comment1);
if ($client->sendSync($setRequest)->getType() !== Response::TYPE_FINAL) {
echo "Error when aactivated  '{$user}'.<br>";
} else {
echo "Comment: '{$comment}'. User'{$user}' successfully added!!.";
echo "User {$user} successfully activated!!!<br>";
}
}
} catch(Exception $e) {
echo $e;
}
?>