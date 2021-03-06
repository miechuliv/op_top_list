<?php  
class ControllerModuleTopList extends Controller {
	protected function index($setting) {

		
		$this->load->model('catalog/top_list');
        $this->load->model('catalog/top_list_description');
        $this->load->model('catalog/top_list_product');

        // @todo limit powinien być ustawiany z poziomu modułu w adminia
		$top_lists = $this->model_catalog_top_list->getTopLists(array(
            'limit' => $setting['limit'],
        ));

        $this->data['top_lists'] = array();

        $this->load->model('catalog/product');
        $this->load->model('tool/image');

        foreach($top_lists as $top_list)
        {
            $description = $this->model_catalog_top_list_description->getTopListDescription($top_list['top_list_id'],$this->config->get('config_language_id'));
            $products = $this->model_catalog_top_list_product->getTopListProducts($top_list['top_list_id'],$top_list['limit']);

            $p = array();

            foreach($products as $product)
            {
                $data = array();
                $product = $this->model_catalog_product->getProduct($product['product_id']);
                if($product['image'])
                {
                    $data['image'] = $this->model_tool_image->resize($product['image'], 150, 150);
                }
                else
                {
                    $data['image'] = false;
                }

                $data['name'] = $product['name'];
                $data['price'] = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
                $data['href'] = $this->url->link('product/product' , '&product_id='.$product['product_id']);

                $p[] = $data;
            }

            $this->data['top_lists'][] = array(
              'top_list_id' => $top_list['top_list_id'],
              'name' => $description['name'],
              'products' => $p,
            );
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/top_list.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/top_list.tpl';
        } else {
            $this->template = 'default/template/module/top_list.tpl';
        }

        $this->render();
  	}
}
?>