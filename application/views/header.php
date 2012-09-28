		<header id="head">
        	<h1><a href="/"><img alt="Project Twenty" title="Project Twenty" src="/assets/img/logo.png" style="width:150px;" /></a></h1>
            <nav class="top small">
            	<ul class="clearfix">
                	<?php if(rand(1,2)%2 == 0):?>
                	<li><a href="/signin">登陆</a></li>
                    <li class="pipe">|</li>
                    <li><a href="/signup">注册</a></li>
                    <?php else:?>
                    <li><a href="/user/1" title="收藏夹">用户名</a></li>
                    <li class="pipe">|</li>
                    <li><a href="/setting">设置</a></li>
                    <li class="pipe">|</li>
                    <li><a href="/logout">退出</a></li>
                    <?php endif;?>
                </ul>
            </nav>
        </header>