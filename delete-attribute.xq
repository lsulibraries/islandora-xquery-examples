xquery version "3.0" encoding "UTF-8";
declare namespace mods="http://www.loc.gov/mods/v3";

(: delete an attribute with a particular value :)

copy $xml := .
modify (
  
  let $delete := $xml/mods:mods/mods:subject/@displayLabel[.='Geographic Subject']
  return delete node $delete
)
return $xml