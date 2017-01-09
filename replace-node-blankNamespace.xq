declare namespace mods="http://www.loc.gov/mods/v3";
declare namespace xsi="http://www.w3.org/2001/XMLSchema-instance";
declare namespace xlink="http://www.w3.org/1999/xlink";
declare namespace schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd";
declare default element namespace "http://www.loc.gov/mods/v3";

(: replace name elements that have a blank namespace, replace the first node, delete the second :)

copy $xml := .
modify (

  let $target := $xml/mods:mods/*[local-name()='name'][1]
  let $delete := $xml/mods:mods/*[local-name()='name'][2]
  return (
    replace node $target with 
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
      </name>),
      delete node $delete
      )
)
return $xml