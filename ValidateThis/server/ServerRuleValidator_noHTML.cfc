<!---
	
	Copyright 2010, Adam Drew
	
	Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in 
	compliance with the License.  You may obtain a copy of the License at 
	
		http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software distributed under the License is 
	distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or 
	implied.  See the License for the specific language governing permissions and limitations under the 
	License.
	
--->
<cfcomponent output="false" name="ServerRuleValidator_noHTML" extends="AbstractServerRuleValidator" hint="I am responsible for performing the noHTML validation.">

	<cffunction name="validate" returntype="any" access="public" output="false" hint="I perform the validation returning info in the validation object.">
		<cfargument name="validation" type="any" required="yes" hint="The validation object created by the business object being validated." />
		<cfset var Parameters = arguments.validation.getParameters() />
		<!--- <cfparam name="Parameters.allowedTags" default=""/> --->
		<cfif shouldTest(arguments.validation) and reFindNoCase("</?\w+((\s+\w+(\s*=\s*(?:"".*?""|'.*?'|[^'"">\s]+))?)+\s*|\s*)/?>",arguments.validation.getObjectValue(),1,false)>
			<cfset fail(arguments.validation,createDefaultFailureMessage("#arguments.validation.getPropertyDesc()# cannot contain HTML tags.")) />
		</cfif>
	</cffunction>
	
</cfcomponent>