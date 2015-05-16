<?php

$url[0]="http://173.194.113.159";
$url[1]="http://173.194.113.152";

for($i=0;$i<count($url);$i++)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url[$i]);
    curl_setopt($ch, CURLOPT_HEADER, TRUE);
    curl_setopt($ch, CURLOPT_NOBODY, TRUE); // remove body
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
    $head = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);    
    if($httpCode=="0"){ $state[$i]['status'] = "OFF"; }else{ $state[$i]['status'] = "ON"; }
    $uri = explode("//", $url[$i]);
    $state[$i]['ip'] = $uri[1];
    curl_close($ch);
}
echo json_encode($state);
?>