<?php

namespace Modules\Inventory\Support;

use Modules\Inventory\Models\DerivedUnit;

class Inventory
{
    public function convertUnits(int $from_id, int $to_id, float $qty = 1.0): float
    {
        $from = DerivedUnit::findOrFail($from_id);
        $to = DerivedUnit::findOrFail($to_id);
        if ($from->basic_unit_id !== $to->basic_unit_id) {
            throw new \RuntimeException("The two units are not compatible");
        }
        return floatval($from->quantity/($to->quantity ?: 1.0)) * $qty;
    }
}