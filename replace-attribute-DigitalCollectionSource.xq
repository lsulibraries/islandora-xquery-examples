declare namespace mods="http://www.loc.gov/mods/v3";
declare namespace xsi="http://www.w3.org/2001/XMLSchema-instance";
declare namespace xlink="http://www.w3.org/1999/xlink";
declare namespace schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd";
declare default element namespace "http://www.loc.gov/mods/v3";

(: replace an attribute with a particular value with another value :)

copy $xml := .
modify (

  let $target := $xml/mods:mods/mods:relatedItem/mods:note/@displayLabel[.='Digital Collection Source']
  return replace value of node $target with "Source Notes"
)
return $xml