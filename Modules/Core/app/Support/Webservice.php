<?php

namespace Modules\Core\Support;

use Illuminate\Http\Client\RequestException;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Http;

class Webservice
{
    public static function make(): Webservice
    {
        return new self();
    }

    /**
     * @throws RequestException
     */
    public function fetchStudent(string|int $studentNo): Collection
    {
        return Http::withoutVerifying()->asJson()->acceptJson()->get(Ws::settings()->getStudentUrl($studentNo))->throw()->collect();
    }

    public function fetchStaffByNumber(string $staff_number): Collection
    {
        return Http::withoutVerifying()->asJson()->acceptJson()->get(Ws::settings()->getStaffByNumberUrl($staff_number))->throw()->collect();
    }

    /**
     * @deprecated Use fetchStaffByUsername instead.
     *
     * @throws RequestException
     */
    public function fetchStaff(string $username): Collection
    {
        return $this->fetchStaffByUsername($username);
    }

    /**
     * @throws RequestException
     */
    public function fetchAllStaff(): Collection
    {
        return Http::withoutVerifying()->asJson()->acceptJson()->get(Ws::settings()->getAllStaffUrl())->throw()->collect();
    }

    /**
     * @throws RequestException
     */
    public function fetchStaffByUsername(string $username): Collection
    {
        return Http::withoutVerifying()->asJson()->acceptJson()->get(Ws::settings()->getStaffByUsernameUrl($username))->throw()->collect();
    }

    /**
     * @throws RequestException
     */
    public function fetchDepartments(): Collection
    {
        return Http::withoutVerifying()->asJson()->acceptJson()->get(Ws::settings()->getAllDepartmentsUrl())->throw()->collect();
    }
}
