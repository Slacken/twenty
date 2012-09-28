<!DOCTYPE html>
<html>
<head>
    <?php $this->load->view( 'head');?>
    <title>Setting Project Twenty</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
</head>
<body>
    <div id="wrapper" class="clearfix">
        <?php $this->load->view( 'header');?>
        <div id="main">
            <article class="proper-size">
                <h2>用户设置</h2>
                <section style="margin-top:20px;">
                	<p>昵&nbsp;称:&nbsp;<input type="text" name="name" id="name" class="hidden" value="xinkiang" /><span id="name-area">xinkiang</span></p>
                    <p><a href="#">设置登录邮箱和密码</a>&nbsp;&raquo;</p>
                    <div id="sync">
                        <p><i class="weibo"></i>将以后喜欢的文章同步到新浪微博<span class="unsync"><a href="#">设置</a></span></p>
                        <p><i class="qzone"></i>将以后喜欢的文章同步到QQ空间<span class="unsync"><a href="#">设置</a></span></p>
                        <p><i class="renren"></i>将以后喜欢的文章同步到人人网<span><a href="#">取消</a></span></p>
                        <p><i class="douban"></i>将以后喜欢的文章同步到豆瓣<span><a href="#">取消</a></span></p>
                    </div>
                </section>
                <section style="margin-top:20px;padding-top:10px;border-top:1px dashed #888;">
                	<p><label for="url">提交优质内容网站的网址或者RSS</label><br/><input type="url" name="url" id="url" placeholder="http://" />&nbsp;<button type="submit">提交</button><span class="small" style="color:#f00;">已成功提交！</span></p>
                    <p><a href="#">申请成为优质内容审核志愿者</a>&nbsp;&raquo;</p>
                </section>
            </article>
        </div>
        <?php $this->load->view( 'footer');?>
        <script>
        	$("#name-area").click(function(){
				$(this).hide();
				$("#name").show().focus();
			});
			$("#name").blur(function(){
				if($(this).val()){
					$(this).hide();
					$("#name-area").text($(this).val()).show();
				}
			});
        </script>
    </div>
    
</body>
</html>