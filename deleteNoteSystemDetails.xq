xquery version "3.0" encoding "UTF-8";
declare namespace mods="http://www.loc.gov/mods/v3";

(: delete a node with a particular attribute value :)

copy $xml := .
modify (

  let $delete := $xml/mods:mods/mods:note[@type='system details']
  return delete node $delete
)
return $xml