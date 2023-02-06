<?php 

$form=$_REQUEST['form'];
$to=$_REQUEST['to'];
$amount=$_REQUEST['amount'];

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "https://api.apilayer.com/currency_data/convert?to=$to&from=$form&amount=$amount",
  CURLOPT_HTTPHEADER => array(
    "Content-Type: text/plain",
    "apikey: T62FdsvokfcVVJMZQOUJY2SutyzAIbxa"
  ),
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET"
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;

 ?>