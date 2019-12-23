<?php


namespace ishop\base;

class View
{
    public $route;
    public $controller;
    public $model;
    public $view;
    public $prefix;
    public $template;
    public $data = [];
    public $meta= [];

    public function __construct($route, $template = '', $view = '', $meta)
    {
        $this->route = $route;
        $this->controller = $route['controller'];
        $this->view = $view;
        $this->model = $route['controller'];
        $this->prefix = $route['prefix'];
        $this->meta = $meta;
        if($template === false)
        {
            $this->template = false;
        } else {
            $this->template = $template ?: TEMPLATE;
        }
    }

    public function render($data)
    {
        if(is_array($data)) extract($data);
        $viewFile = APP . "/views/{$this->prefix}{$this->controller}/{$this->view}.php";
        if(is_file($viewFile))
        {
            ob_start();
            require_once $viewFile;
            $content = ob_get_clean();
        } else {
            throw new \Exception("Не найден вид {$viewFile} !", 500);
        }

        if(false === !$this->template)
        {
            $templateFile = APP . "/views/templates/{$this->template}.php";
            if(is_file($templateFile))
            {
                require_once $templateFile;
            } else {
                throw new \Exception("Не найден шаблон {$templateFile} !", 500);
            }
        }
    }

    public function getMeta()
    {
        $output = '<title>' . $this->meta['title'] . '</title>' . PHP_EOL;
        $output .= '<meta name="description" content="'. $this->meta['desc'] .'">' . PHP_EOL;
        $output .= '<meta name="keywords" content="'. $this->meta['keywords'] .'">' . PHP_EOL;
        return $output;
    }

}