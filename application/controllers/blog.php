<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Blog extends CI_Controller{
	public function index(){
		$this->load->view('blog/index');
	}
	
	public function show($id){
		$this->load->view('blog/show');
	}
}
