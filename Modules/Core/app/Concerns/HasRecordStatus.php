<?php

namespace Modules\Core\Concerns;

use Illuminate\Database\Eloquent\Model;

/**
 * @mixin Model
 */
trait HasRecordStatus
{
    public function isDraft(): bool
    {
        return $this->getAttribute('record_status') === 'draft';
    }

    public function isProcessing(): bool
    {
        return $this->getAttribute('record_status') === 'processing';
    }

    public function isSubmitted(): bool
    {
        return $this->getAttribute('record_status') === 'submitted';
    }

    public function isFinal(): bool
    {
        return $this->getAttribute('record_status') === 'final';
    }

    public function isCancelled(): bool
    {
        return $this->getAttribute('record_status') === 'cancelled';
    }

    public function submit(): static
    {
        $record = $this->beforeSubmit();
        $record->setAttribute('record_status', 'submitted');
        $record->save();

        return $record->afterSubmit();
    }

    public function beforeSubmit(): static
    {
        // Override this method to implement your own logic
        return $this;
    }

    public function afterSubmit(): static
    {
        // after submit
        return $this;
    }
}
