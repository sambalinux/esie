<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\assets;

use yii\web\AssetBundle;

/**
 * Main application asset bundle.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        //'css/site.css',
       'https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800%7CShadows+Into+Light&display=swap',
        'vendor/bootstrap/css/bootstrap.min.css',
        'vendor/fontawesome-free/css/all.min.css',
        //borrar
        'vendor/animate/animate.compat.css',
        'vendor/simple-line-icons/css/simple-line-icons.min.css',
        "vendor/owl.carousel/assets/owl.carousel.min.css",
        "vendor/owl.carousel/assets/owl.theme.default.min.css",
        'vendor/magnific-popup/magnific-popup.min.css',

        'css/theme.css',
        'css/theme-elements.css',
        
        
        //borrar
        'css/theme-blog.css',
        'css/theme-shop.css',
        'css/skins/default.css',
        'css/custom.css',
    ];
    public $js = [
        "vendor/modernizr/modernizr.min.js", //borr
        'vendor/jquery/jquery.min.js',
//borrar
        "vendor/jquery.appear/jquery.appear.min.js",
        "vendor/jquery.easing/jquery.easing.min.js",
        "vendor/jquery.cookie/jquery.cookie.min.js",

        'vendor/bootstrap/js/bootstrap.bundle.min.js',
//borrar
        "vendor/jquery.validation/jquery.validate.min.js",
        'vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js',
        "vendor/jquery.gmap/jquery.gmap.min.js",
        "vendor/lazysizes/lazysizes.min.js",
        "vendor/isotope/jquery.isotope.min.js",
        "vendor/owl.carousel/owl.carousel.min.js",
        "vendor/magnific-popup/jquery.magnific-popup.min.js",
        "vendor/vide/jquery.vide.min.js",
        "vendor/vivus/vivus.min.js",
        "js/theme.js",
        "js/custom.js",

        //animation
        "js/theme.init.js"
  
        
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap4\BootstrapAsset',
        //'yii\bootstrap\BootstrapAsset',
    ];
}
