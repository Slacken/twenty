<!DOCTYPE html>
<html>
<head>
    <?php $this->load->view( 'head');?>
    <title>Login Project Twenty</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
</head>
<body>
    <div id="wrapper" class="clearfix">
        <?php $this->load->view( 'header');?>
        <div id="main">
            <article>
                <header><h2>登录Twenty</h2></header>
                <div id="sign" class="clearfix">
                    <article>
                    	<!--<div style="margin-right:30px;border-right:1px solid #999;">-->
                        <header><h3>使用社交账号登录</h3></header>
                        <ul>
                        	<li><a href="#" rel="nofollow"><img src="/assets/img/renren-login.png" /></a></li>
                            <li><a href="#" rel="nofollow"><img src="/assets/img/weibo-login.png" width="234" alt="使用新浪微博账号登录" /></a></li>
                            <li><a href="#" rel="nofollow"><img src="/assets/img/renren-login.png" alt="使用人人网账号登录" /></a></li>                         
                        </ul>
                        <!--</div>-->
                    </article>
                    <article>
                        <header><h3>或直接登录</h3></header>
                        <div class="semiform">
                        	<form action="" method="post">
                            	<p class="form-line"><label for="email">电子邮箱&nbsp;</label><input type="email" id="email" name="email" /></p>
                                <p class="form-line"><label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;</label><input type="password" id="password" name="password" /></p>
                                <p class="form-line"><button type="submit" name="submitted" value="1">确&nbsp;定</button></p>
                            </form>
                        </div>
                    </article>
                </div>
            </article>
        </div>
        <?php $this->load->view( 'footer');?>
    </div>
    <!--<div style="width:1023px;margin:0 auto;"><img src="assets/img/login.png" /></div>-->
</body>
</html>