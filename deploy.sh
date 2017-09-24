#!/bin/sh

sfdx force:mdapi:deploy -d ./mdapi_output_dir/ -u "mlott@msl.stericycle.demo.uat" -l RunSpecifiedTests -r RecallFormSimpleControllerTest

