<?php

return [
    'name' => 'Inventory',
    'articles' => [
        'valuation_rate_column' => env('ARTICLE_VALUATION_RATE_COL','last_receiving_price'),
    ]
];
