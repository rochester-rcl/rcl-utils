#!/bin/sh
for x in *.xml; do
    echo '<?xml version="1.0" encoding="UTF-8"?>
          <?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
          <?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
          <?xml-model href="http://humanities.lib.rochester.edu/ns/mbragdon.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>' | cat - $x > temp && mv temp $x;
done

