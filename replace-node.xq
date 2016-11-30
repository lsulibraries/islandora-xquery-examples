declare namespace mods="http://www.loc.gov/mods/v3";
declare namespace xsi="http://www.w3.org/2001/XMLSchema-instance";
declare namespace xlink="http://www.w3.org/1999/xlink";
declare namespace schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd";
declare default element namespace "http://www.loc.gov/mods/v3";

(: replace an element with particular text value in child node :)

copy $xml := .
modify (

  let $target := $xml/mods:mods/mods:name[mods:namePart[.='Liuzza, Lucia;Liuzza, Philip']]
  return replace node $target with 
      (<name displayLabel="Creator">
        <namePart>Liuzza, Lucia</namePart>
        <role>
           <roleTerm type="code" authority="marcrelator">cre</roleTerm>
           <roleTerm type="text" authority="marcrelator">Creator</roleTerm>
        </role>
      </name>,
      <name displayLabel="Creator">
        <namePart>Liuzza, Philip</namePart>
        <role>
           <roleTerm type="code" authority="marcrelator">cre</roleTerm>
           <roleTerm type="text" authority="marcrelator">Creator</roleTerm>
        </role>
      </name>)
)
return $xml