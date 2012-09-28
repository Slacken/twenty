<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Account extends CI_Controller{
	public function index(){
		$this->setting();
	}
	
	public function signin(){
		$this->load->view('account/signin');
	}
	
	public function signup(){
		$this->load->view('account/signup');
	}
	
	public function logout(){
		
	}
	
	public function setting(){
		$this->load->view('account/setting');
	}
	
	public function show($id){
		$this->load->view('account/show');
	}
}
