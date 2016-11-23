xquery version "3.0" encoding "UTF-8";
declare namespace mods="http://www.loc.gov/mods/v3";

copy $xml := .
modify (
    for $abstract in $xml/mods:mods/mods:abstract
    return insert node (attribute displayLabel {'Description'}) into $abstract 
)
return  $xml