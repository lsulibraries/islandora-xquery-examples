(: this xquery turns
<relatedItem type='host'>
    <titleInfo type='alternative' displayLabel='Repository Collection'>
        <title>Special Collections Folios (QK45 .M34)</title>
    </titleInfo>
    </relatedItem>

split into:

<location>
    <holdingSimple>
        <copyInformation>
            <shelfLocator>Special Collections Folios</shelfLocator>
        </copyInformation>
    </holdingSimple>
</location>
<classification authority='lcc'>QK45 .M34</classification> 

it is a good example of splitting a field and putting the two pieces in two different nodes anywhere in the tree :)

declare namespace mods="http://www.loc.gov/mods/v3";
declare namespace xsi="http://www.w3.org/2001/XMLSchema-instance";
declare namespace xlink="http://www.w3.org/1999/xlink";
declare namespace schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd";
declare default element namespace "http://www.loc.gov/mods/v3";
 
 
copy $xml := .
modify (
  let $target := $xml/mods/relatedItem[@type='host']/titleInfo[@displayLabel='Repository Collection']
  let $firstPart := substring-before($target, ' (')
  let $secondPart := substring-before(substring-after($target, ' ('),')')
  return (
    delete node $target,
    insert node <shelfLocator>{ $firstPart }</shelfLocator>
        into $xml/mods/location/holdingSimple/copyInformation,
    insert node <classification authority="lcc">{ $secondPart }</classification>
        after $xml/mods/location
    )
)
return $xml