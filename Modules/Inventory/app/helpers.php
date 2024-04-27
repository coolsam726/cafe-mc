<?php
namespace Modules\Inventory;

use Modules\Inventory\Support\Stock;

if (!function_exists('stock')) {
    function stock(): Stock
    {
        return app(Stock::class);
    }
}