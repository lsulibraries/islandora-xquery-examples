(: deletes a node and inserts it's child's text into a different node :)

declare namespace mods="http://www.loc.gov/mods/v3";
declare namespace xsi="http://www.w3.org/2001/XMLSchema-instance";
declare namespace xlink="http://www.w3.org/1999/xlink";
declare namespace schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd";
declare default element namespace "http://www.loc.gov/mods/v3";
 
 
copy $xml := .
modify (
  let $target := $xml/mods/relatedItem[@type='host']/titleInfo[@displayLabel='Repository Collection']
  return (
    delete node $target,
    insert node <shelfLocator>{ $target/title/text() }</shelfLocator>
        into $xml/mods/location/holdingSimple/copyInformation
    )
)
return $xml