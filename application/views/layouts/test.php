<?php
$arr = [
    12 => [
        'test' => 4,
        'test2' => 5
    ],
    13 => [
        'test' => 4,
        'test2' => 5
    ],
    18 => [
        'test' => 4,
        'test2' => 5
    ],
];
$a = in_array(['test' => 4], $arr);
dd($a);
