$hash = {
  'key1'     => {
    'value11' => '11',
    'value12' => '12',
  },
  'key2'      => {
    'value21' => '21',
    'value22' => '22',
  },
  'key3'      => {
    'value31' => '31',
    'value32' => '32',
  },
  'key4'      => {
    'value41' => '41',
    'value42' => '42',
  },
}

$hash.slice(2) | $hslice | {
  notify { "HSlice: ${hslice}": }
}
