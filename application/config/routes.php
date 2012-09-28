<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


$route['default_controller'] = "post";
$route['404_override'] = '';

$route['signin'] = 'account/signin';
$route['signup'] = 'account/signup';
$route['logout'] = 'account/logout';
$route['setting'] = 'account/setting';

$route['user/(:num)'] = 'account/show/$1';
$route['post/(:num)'] = 'post/show/$1';
$route['blog/(:num)'] = 'blog/show/$1';

//覆盖了除以上的所有控制器
//$route['(:any)'] = 'account/show/$1';
