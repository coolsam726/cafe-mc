<?php

namespace Modules\Core\Concerns;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

use function Modules\Core\Support\core;
use function Modules\Core\Support\utils;

/**
 * @mixin Model
 */
trait HasAudit
{
    use LogsActivity;

    public function creator(): BelongsTo
    {
        return $this->belongsTo(config('auth.providers.users.model'), 'creator_id');
    }

    public function updater(): BelongsTo
    {
        return $this->belongsTo(config('auth.providers.users.model'), 'updater_id');
    }

    public static function booted(): void
    {
        static::creating(function (Model $model) {
            $model->updater_id = $model->creator_id = auth()->check() ? auth()->id() : null;
            $model->ip_address = utils()->getCurrentIp();
        });

        static::updating(function (Model $model) {
            $model->updater_id = auth()->check() ? auth()->id() : null;
            $model->ip_address = utils()->getCurrentIp();
        });
    }

    public function getActivitylogOptions(): LogOptions
    {
        $auth = core()->sysbot();
        if (auth()->check()) {
            $auth = auth()->user();
        }

        return LogOptions::defaults()
            ->logAll()->logOnlyDirty()
            ->logExcept(['created_at', 'updated_at'])
            ->useLogName($this->getTable())
            ->setDescriptionForEvent(fn (string $eventName) => "{$auth?->username} {$eventName} "
                .str($this->getTable())->singular()->toString().' #'.$this->getKey());
        // Chain fluent methods for configuration options
    }
}
