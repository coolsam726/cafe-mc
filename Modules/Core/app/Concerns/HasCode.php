<?php

namespace Modules\Core\Concerns;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;
use Modules\Core\Support\Core;
use function Modules\Core\Support\core;

/**
 * @mixin Model
 */
trait HasCode
{
    public static function initHasCode()
    {

    }

    public static function bootHasCode(): void
    {
        static::creating(function (Model $model) {
            if ($model->hasAttribute('code') && !$model->getAttribute('code')) {
                Log::debug('Creating code for ' . $model->getTable());
                $model->generateCode();
                Log::debug('Created code ' . $model->code);
            }
        });
        self::saving(function (Model $model) {
            if ($model->hasAttribute('code') && !$model->getAttribute('code')) {
                $model->generateCode(useId: true);
            }
        });
        static::updating(function (Model $model) {
            if ($model->hasAttribute('code') && !$model->getAttribute('code')) {
                $model->generateCode(useId: true);
            }
        });
    }

    public function getPrefix(): string
    {
        return core()->generatePrefix($this->getTable());
    }

    public function generateCode(int $increment = 1, bool $useId = false): string
    {
        // use current count but ensure a unique code
        $prefix = $this->getPrefix();
        if ($useId && $id = $this->getAttribute('id')) {
            return str($id)->padLeft(4, '0')->prepend($prefix)->toString();
        }
        $team = $this->getAttribute(Core::TEAM_COLUMN);
        if ($prefix) {
            $query = $this->newQuery()->where('code', 'like', $prefix . '%');
            if ($this->hasAttribute(Core::TEAM_COLUMN) && $team) {
                $query->where(Core::TEAM_COLUMN,'=', $team);
            }
            $count = $query->count();
        }
        else {
            $query = $this->newQuery();
            if ($this->hasAttribute(Core::TEAM_COLUMN) && $team) {
                $query->where(Core::TEAM_COLUMN,'=', $team);
            }
            $count = $query->count();
        }
        if ($increment > 10) {
            // to avoid infinite loop generate a unique code
            $code =  str(uniqid())->upper()->toString();
            $this->code = $code;
            return $code;
        }
        $code = str($count + $increment)->padLeft(4, '0')->prepend($prefix)->toString();
        $q = $this->newQuery()->where('code', $code);
        if ($this->hasAttribute(Core::TEAM_COLUMN) && $team) {
            $q->where(Core::TEAM_COLUMN, '=', $team);
        }
        if ($q->exists()) {
            return $this->generateCode(increment: $increment + 1);
        }
        $this->code = $code;
        return $code;
    }
}