<!DOCTYPE html>
<html>
<head>
    <?php $this->load->view( 'head');?>
    <title>Like Project Twenty</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
</head>
<body>
    <div id="wrapper" class="clearfix">
        <?php $this->load->view( 'header');?>
        <div id="main">
            <article class="proper-size">
            <h2>用户名喜欢的文章</h2>
                <nav id="article-list">
                    <ul>
                    	<!-- 待增加文章摘要 -->
                    	<?php for($i=0;$i<3;$i++):?>
                        <li><a href="#">宇宙尽头的餐馆</a><span class="tags hidden"><a href="#">小说</a><a href="#">科幻</a></span></li>
                        <li><a href="#">宇宙尽头的餐馆的标题不止这么长的哟！宇宙尽头的餐馆的标题很长能</a></li>
                        <?php endfor;?>
                        <li><a href="#">宇宙尽头的餐馆的标题不止这么长的哟！宇宙尽头的餐馆的标题很长能</a></li>
                        <li><a href="#">宇宙尽头的餐馆</a></li>
                    </ul>
                </nav>
                <nav class="pagination">这里是分页</nav>
            </article>
            <section class="small">
                <nav id="neibors">
                    <ul class="clearfix">
                    	<li style="font-weight:bold;">[用户名的邻居]</li>
                        <li><a href="#">宇宙尽头的餐馆</a></li>
                        <li><a href="#">xinkiang</a></li>
                        <li><a href="#">城主</a></li>
                    </ul>
                </nav>
            </section>
        </div>
        <?php $this->load->view( 'footer');?>
        
    </div>
    
</body>
</html>