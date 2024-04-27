<?php

namespace Modules\Inventory\Observers;

use Modules\Inventory\Models\StockMutation;

class StockMutationObserver
{
    public function creating(StockMutation $stockMutation): void
    {
        $stockMutation->is_immutable = true;
    }
    /**
     * Handle the StockMutation "created" event.
     */
    public function created(StockMutation $stockmutation): void
    {
        // adjust the associated batch's remaining stock
        $dQ = $stockmutation->new_quantity - $stockmutation->prev_quantity;
        $stockmutation->batch->update(['current_quantity' => $stockmutation->batch->current_quantity + $dQ]);
    }

    /**
     * Handle the StockMutation "updated" event.
     */
    public function updated(StockMutation $stockmutation): void
    {
        //
    }

    /**
     * Handle the StockMutation "deleted" event.
     */
    public function deleted(StockMutation $stockmutation): void
    {
        //
    }

    /**
     * Handle the StockMutation "restored" event.
     */
    public function restored(StockMutation $stockmutation): void
    {
        //
    }

    /**
     * Handle the StockMutation "force deleted" event.
     */
    public function forceDeleted(StockMutation $stockmutation): void
    {
        //
    }
}
