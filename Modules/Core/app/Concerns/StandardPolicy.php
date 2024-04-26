<?php

namespace Modules\Core\Concerns;

use App\Models\User;
use BezhanSalleh\FilamentShield\Facades\FilamentShield;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

use function Modules\Core\Support\utils;

trait StandardPolicy
{
    abstract public function getResourceClass(): string;

    public function getSuffix(): string
    {
        return FilamentShield::getPermissionIdentifier($this->getResourceClass());
    }

    public function makeSuffixFromModel(Model|string $model): string
    {
        if (is_string($model)) {
            $class = $model::getModel()->getMorphClass();
        } else {
            $class = $model->getMorphClass();
        }

        return Str::of(Str::of($class)->explode('\\')->last() ?? '')
            ->snake('::')->toString();
    }

    public function viewAny(User $user): bool
    {
        return $user->can($this->perm('view_any'));
    }

    public function view(User $user, Model $model): bool
    {
        return $user->can($this->perm('view'));
    }

    public function create(User $user): bool
    {
        return $user->can($this->perm('create'));
    }

    public function update(User $user, Model $model): bool
    {
        return ! $this->isImmutable($model) && (! utils()->model_has_record_status($model) || $model->isDraft()) && $user->can($this->perm('update'));
    }

    public function deleteAny(User $user): bool
    {
        return $user->can($this->perm('delete_any'));
    }

    public function delete(User $user, Model $model): bool
    {
        return ! $this->isImmutable($model) && $user->can($this->perm('delete')) && (! utils()->model_has_record_status($model) || $model->isDraft());
    }

    public function submit(User $user, Model $model): bool
    {
        return ! $this->isImmutable($model) && $user->can($this->perm('submit')) && utils()->model_has_record_status($model) && $model->isDraft();
    }

    public function cancel(User $user, Model $model): bool
    {
        return ! $this->isImmutable($model) && $user->can($this->perm('cancel')) && utils()->model_has_record_status($model) && $model->isSubmitted();
    }

    public function reverse(User $user, Model $model): bool
    {
        return $user->can($this->perm('reverse')) && utils()->model_has_record_status($model) && $model->isSubmitted();
    }

    public function return(User $user, Model $model): bool
    {
        return $user->can($this->perm('return')) && utils()->model_has_record_status($model) && $model->isSubmitted();
    }

    public function restoreAny(User $user): bool
    {
        return false;
    }

    public function restore(User $user, Model $model): bool
    {
        return false;
    }

    public function forceDeleteAny(User $user): bool
    {
        return false;
    }

    public function forceDelete(User $user, Model $model): bool
    {
        return $this->delete($user, $model);
    }

    public function isImmutable(Model $record): bool
    {
        return $record->getAttribute('is_immutable') ?? false;
    }

    public function perm(string $prefix): string
    {
        return "{$prefix}_{$this->getSuffix()}";
    }
}
