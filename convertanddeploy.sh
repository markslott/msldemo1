#!/bin/sh

mkdir -p ./mdapi_output_dir
sfdx force:source:convert -d ./mdapi_output_dir/ --packagename StericycleDemo	
sfdx force:mdapi:deploy -d ./mdapi_output_dir/ -u "mlott@msl.stericycle.demo.uat" -l RunSpecifiedTests -r RecallFormSimpleControllerTest

