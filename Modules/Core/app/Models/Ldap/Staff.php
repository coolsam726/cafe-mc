<?php

namespace Modules\Core\Models\Ldap;

use LdapRecord\Models\ActiveDirectory\User;

class Staff extends User
{
    protected ?string $connection = 'staff';
}
