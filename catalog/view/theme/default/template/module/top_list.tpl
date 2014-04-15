<div class="box">
    <?php if($top_lists){ ?>
        <?php foreach($top_lists as $top_list){ ?>
            <div style="float:left;text-align: center;">
                <h3><?php echo $top_list['name']; ?></h3>
                <div>
                    <?php foreach($top_list['products'] as $product){ ?>
                        <div style="height: 200px;width: 200px;">

                            <div style="height: 80%;">
                                <a href="<?php echo $product['href']; ?>" >

                                    <img src="<?php echo $product['image']; ?>" />
                                </a>
                            </div>
                            <div style="height: 20%;">
                                <a href="<?php echo $product['href']; ?>" >

                                    <span>
                                    <?php echo $product['name']; ?>
                                </span>
                                </a>

                            </div>
                        </div>

                    <?php } ?>
                </div>


            </div>
        <?php } ?>
    <?php } ?>
</div>
