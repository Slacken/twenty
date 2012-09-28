<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Post extends CI_Controller{
	public function index(){
		$this->show(1);
	}
	
	public function show($id){
		$this->load->view('post/show');
	}
}
