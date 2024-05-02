<?php

return [
    'name' => 'Production',
    'percentage_profit_margin' => env('PRODUCTION_PERCENTAGE_PROFIT_MARGIN',25),
    'percentage_overhead_costs' => env('PRODUCTION_PERCENTAGE_OVERHEAD_COSTS',40)
];
