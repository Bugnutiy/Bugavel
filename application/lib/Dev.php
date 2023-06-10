<?php

//namespace application\lib;

function dd($str)
{
  echo '<pre>';
  var_dump($str);
  echo '</pre>';
  //exit;
}
function debug($str)
{
  echo '<pre>';
  var_dump($str);
  echo '</pre>';
  exit;
}
