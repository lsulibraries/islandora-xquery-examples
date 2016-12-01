declare namespace mods="http://www.loc.gov/mods/v3";
declare namespace xsi="http://www.w3.org/2001/XMLSchema-instance";
declare namespace xlink="http://www.w3.org/1999/xlink";
declare namespace schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd";
declare default element namespace "http://www.loc.gov/mods/v3";

(: replace an element with particular text value in child node :)
(: <subject authority='lcsh' displayLabel='Geographic Subject'> 
becomes <subject authority='lcsh' displayLabel='Location'> :)

copy $xml := .
modify (

  let $target := $xml/mods:mods/mods:subject/@displayLabel[.='Geographic Subject']
  return replace value of node $target with "Location"
)
return $xml