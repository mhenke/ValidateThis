<!---
				
	// **************************************** LICENSE INFO **************************************** \\
	
	Copyright 2008, Bob Silverberg
	
	Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in 
	compliance with the License.  You may obtain a copy of the License at 
	
		http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software distributed under the License is 
	distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or 
	implied.  See the License for the specific language governing permissions and limitations under the 
	License.
	
--->
<cfcomponent output="false">
	
	
	<cffunction name="init" access="public" returntype="any">
		<cfargument name="FirstName" required="false" default="Bob" />
		<cfargument name="LastName" required="false" default="Silverberg" />
		<cfset variables.FirstName = arguments.FirstName />
		<cfset variables.LastName = arguments.LastName />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="onMissingMethod">
		<cfargument name="missingMethodName" type="string">
		<cfargument name="missingMethodArgs" type="any">
		<cfscript>
			if (left(arguments.missingMethodName,3) eq "get"){
				return variables[right(arguments.missingMethodName,len(arguments.missingMethodName)-3)];
			}
		</cfscript>
	</cffunction>
	
</cfcomponent>


