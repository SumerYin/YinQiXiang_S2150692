*------------------------------------------------------------*;
* EM Version: 15.2;
* SAS Release: 9.04.01M7P080620;
* Host: odaws02-apse1.oda.sas.com;
* Project Path: ~;
* Project Name: AA_s2150692;
* Diagram Id: EMWS1;
* Diagram Name: AA_s2150692;
* Generated by: S2150692;
* Date: 07JAN2024:11:50:28;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Macro Variables;
*------------------------------------------------------------*;
%let EM_PROJECT =;
%let EM_PROJECTNAME =;
%let EM_WSNAME =;
%let EM_WSDESCRIPTION =AA_s2150692;
%let EM_SUMMARY =WORK.SUMMARY;
%let EM_NUMTASKS =SINGLE;
%let EM_EDITMODE =R;
%let EM_DEBUGVAL =;
%let EM_ACTION =run;
*------------------------------------------------------------*;
%macro em_usedatatable;
%if ^%symexist(EM_USEDATATABLE) %then %do;
%let EM_USEDATATABLE = Y;
%end;
%if "&EM_USEDATATABLE" ne "N" %then %do;
*------------------------------------------------------------*;
* Data Tables;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
%end;
%mend em_usedatatable;
%em_usedatatable;
*------------------------------------------------------------*;
* Create workspace data set;
*------------------------------------------------------------*;
data workspace;
length property $64 value $200;
property= 'PROJECTLOCATION';
value= "&EM_PROJECT";
output;
property= 'PROJECTNAME';
value= "&EM_PROJECTNAME";
output;
property= 'WORKSPACENAME';
value= "&EM_WSNAME";
output;
property= 'WORKSPACEDESCRIPTION';
value= "&EM_WSDESCRIPTION";
output;
property= 'SUMMARYDATASET';
value= "&EM_SUMMARY";
output;
property= 'NUMTASKS';
value= "&EM_NUMTASKS";
output;
property= 'EDITMODE';
value= "&EM_EDITMODE";
output;
property= 'DEBUG';
value= "&EM_DEBUGVAL";
output;
run;
*------------------------------------------------------------*;
* Create nodes data set;
*------------------------------------------------------------*;
data nodes;
length id $12 component $32 description $64 X 8 Y 8 diagramID $32 parentID $32;
id= "Tree4";
component="DecisionTree";
description= "Decision Tree";
diagramID="_ROOT_";
parentID="";
X=469;
Y=92;
output;
id= "Impt";
component="Impute";
description= "Impute";
diagramID="_ROOT_";
parentID="";
X=170;
Y=219;
output;
id= "FIMPORT";
component="FileImport";
description= "File Import";
diagramID="_ROOT_";
parentID="";
X=15;
Y=219;
output;
run;
*------------------------------------------------------------*;
* Variable Attributes for Tree4;
*------------------------------------------------------------*;
data WORK.Tree4_VariableAttribute;
length Variable $64 AttributeName $32 AttributeValue $64;
Variable='Date';
AttributeName="USE";
AttributeValue='D';
Output;
run;
*------------------------------------------------------------*;
* USERTRAINCODE File for Tree4;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Tree4_USERTRAINCODE.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
run;
*------------------------------------------------------------*;
* EMNOTES File for Tree4;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Tree4_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Variable Attributes for Impt;
*------------------------------------------------------------*;
data WORK.Impt_VariableAttribute;
length Variable $64 AttributeName $32 AttributeValue $64;
Variable='Average_Rating';
AttributeName="METHOD";
AttributeValue='MEDIAN';
Output;
Variable='Churn';
AttributeName="METHOD";
AttributeValue='MEDIAN';
Output;
Variable='Total_Spend';
AttributeName="METHOD";
AttributeValue='MEDIAN';
Output;
run;
*------------------------------------------------------------*;
* EMNOTES File for Impt;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"Impt_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Variable Attributes for FIMPORT;
*------------------------------------------------------------*;
data WORK.FIMPORT_VariableAttribute;
length Variable $64 AttributeName $32 AttributeValue $64;
Variable='Churn';
AttributeName="ROLE";
AttributeValue='TARGET';
Output;
run;
*------------------------------------------------------------*;
* USERTRAINCODE File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_USERTRAINCODE.sas";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
run;
*------------------------------------------------------------*;
* VARIABLESETDELTA File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_VARIABLESETDELTA.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
put 'if NAME="Churn" then do;';
put 'ROLE="TARGET";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'DROP="N";';
put 'end;';
run;
*------------------------------------------------------------*;
* DELTACODE File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_DELTACODE.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath";
file dspath;
put 'if NAME="Churn" then do;';
put 'ROLE="TARGET";';
put 'LEVEL="INTERVAL";';
put 'ORDER="";';
put 'end;';
put 'drop DROP;';
run;
*------------------------------------------------------------*;
* EMNOTES File for FIMPORT;
*------------------------------------------------------------*;
data _null_;
if symget('sysscp')=:'WIN' then dsep='\';
else if symget('sysscp')=:'DNT' then dsep='\';
else dsep = '/';
filepath = pathname('work')!!dsep!!"FIMPORT_EMNOTES.txt";
call symput('DSPATH', filepath);
run;
data _null_;
filename dspath "&dspath" encoding="utf-8" NOBOM;
file dspath;
run;
*------------------------------------------------------------*;
* Create node properties data set;
*------------------------------------------------------------*;
data nodeprops;
length id $12 property $64 value $400;
id= "Tree4";
property="Location";
value= "CATALOG";
output;
id= "Tree4";
property="Catalog";
value= "SASHELP.EMMODL.TREE.SOURCE";
output;
id= "Tree4";
property="ToolType";
value= "MODEL";
output;
id= "Tree4";
property="TrainMode";
value= "BATCH";
output;
id= "Tree4";
property="ImportModel";
value= "N";
output;
id= "Tree4";
property="Freeze";
value= "N";
output;
id= "Tree4";
property="UseMultipleTarget";
value= "N";
output;
id= "Tree4";
property="Precision";
value= "4";
output;
id= "Tree4";
property="IntervalCriterion";
value= "PROBF";
output;
id= "Tree4";
property="NominalCriterion";
value= "PROBCHISQ";
output;
id= "Tree4";
property="OrdinalCriterion";
value= "ENTROPY";
output;
id= "Tree4";
property="SigLevel";
value= "0.2";
output;
id= "Tree4";
property="Splitsize";
value= ".";
output;
id= "Tree4";
property="LeafSize";
value= "5";
output;
id= "Tree4";
property="MinCatSize";
value= "5";
output;
id= "Tree4";
property="Maxbranch";
value= "2";
output;
id= "Tree4";
property="Maxdepth";
value= "6";
output;
id= "Tree4";
property="Nrules";
value= "5";
output;
id= "Tree4";
property="Nsurrs";
value= "0";
output;
id= "Tree4";
property="MissingValue";
value= "USEINSEARCH";
output;
id= "Tree4";
property="UseVarOnce";
value= "N";
output;
id= "Tree4";
property="SplitPrecision";
value= "4";
output;
id= "Tree4";
property="Subtree";
value= "ASSESSMENT";
output;
id= "Tree4";
property="NSubtree";
value= "1";
output;
id= "Tree4";
property="AssessMeasure";
value= "PROFIT/LOSS";
output;
id= "Tree4";
property="AssessPercentage";
value= "0.25";
output;
id= "Tree4";
property="NodeSample";
value= "20000";
output;
id= "Tree4";
property="Exhaustive";
value= "5000";
output;
id= "Tree4";
property="Kass";
value= "Y";
output;
id= "Tree4";
property="KassApply";
value= "BEFORE";
output;
id= "Tree4";
property="Depth";
value= "Y";
output;
id= "Tree4";
property="Inputs";
value= "N";
output;
id= "Tree4";
property="NumInputs";
value= "1";
output;
id= "Tree4";
property="VarSelection";
value= "Y";
output;
id= "Tree4";
property="Leafid";
value= "Y";
output;
id= "Tree4";
property="NodeRole";
value= "SEGMENT";
output;
id= "Tree4";
property="Performance";
value= "DISK";
output;
id= "Tree4";
property="CV";
value= "N";
output;
id= "Tree4";
property="CVNIter";
value= "10";
output;
id= "Tree4";
property="CVRepeat";
value= "1";
output;
id= "Tree4";
property="CVSeed";
value= "12345";
output;
id= "Tree4";
property="ObsImportance";
value= "N";
output;
id= "Tree4";
property="NumSingleImp";
value= "5";
output;
id= "Tree4";
property="UseDecision";
value= "N";
output;
id= "Tree4";
property="UsePriors";
value= "N";
output;
id= "Tree4";
property="ClassColorBy";
value= "PERCENTCORRECT";
output;
id= "Tree4";
property="IntColorBy";
value= "AVG";
output;
id= "Tree4";
property="ShowNodeId";
value= "Y";
output;
id= "Tree4";
property="ShowValid";
value= "Y";
output;
id= "Tree4";
property="Pred";
value= "N";
output;
id= "Tree4";
property="Target";
value= "ALL";
output;
id= "Tree4";
property="Count";
value= "Y";
output;
id= "Tree4";
property="ProfitLoss";
value= "NONE";
output;
id= "Tree4";
property="PercentCorrect";
value= "N";
output;
id= "Tree4";
property="AVG";
value= "Y";
output;
id= "Tree4";
property="RASE";
value= "N";
output;
id= "Tree4";
property="CreateSample";
value= "DEFAULT";
output;
id= "Tree4";
property="SampleMethod";
value= "RANDOM";
output;
id= "Tree4";
property="SampleSize";
value= "10000";
output;
id= "Tree4";
property="SampleSeed";
value= "12345";
output;
id= "Tree4";
property="ForceRun";
value= "N";
output;
id= "Tree4";
property="RunAction";
value= "Train";
output;
id= "Tree4";
property="Component";
value= "DecisionTree";
output;
id= "Tree4";
property="Criterion";
value= "DEFAULT";
output;
id= "Tree4";
property="Dummy";
value= "N";
output;
id= "Tree4";
property="Predict";
value= "Y";
output;
id= "Tree4";
property="ImportedTreeData";
value= "";
output;
id= "Tree4";
property="ToolPrefix";
value= "Tree";
output;
id= "Tree4";
property="EM_VARIABLEATTRIBUTES";
value= "WORK.Tree4_VariableAttribute";
output;
id= "Tree4";
property="EM_FILE_USERTRAINCODE";
value= "Tree4_USERTRAINCODE.sas";
output;
id= "Tree4";
property="EM_FILE_EMNOTES";
value= "Tree4_EMNOTES.txt";
output;
id= "Impt";
property="MethodInterval";
value= "MEAN";
output;
id= "Impt";
property="MethodClass";
value= "COUNT";
output;
id= "Impt";
property="MethodTargetInterval";
value= "NONE";
output;
id= "Impt";
property="MethodTargetClass";
value= "NONE";
output;
id= "Impt";
property="ABWTuning";
value= "9";
output;
id= "Impt";
property="AHUBERTuning";
value= "1.5";
output;
id= "Impt";
property="AWAVETuning";
value= "6.2831853072";
output;
id= "Impt";
property="SpacingProportion";
value= "90";
output;
id= "Impt";
property="DefaultChar";
value= "";
output;
id= "Impt";
property="DefaultNum";
value= ".";
output;
id= "Impt";
property="RandomSeed";
value= "12345";
output;
id= "Impt";
property="Normalize";
value= "Y";
output;
id= "Impt";
property="ImputeNoMissing";
value= "N";
output;
id= "Impt";
property="MaxPctMissing";
value= "50";
output;
id= "Impt";
property="ValidateTestMissing";
value= "N";
output;
id= "Impt";
property="DistributionMissing";
value= "N";
output;
id= "Impt";
property="LeafSize";
value= "5";
output;
id= "Impt";
property="Maxbranch";
value= "2";
output;
id= "Impt";
property="Maxdepth";
value= "6";
output;
id= "Impt";
property="MinCatSize";
value= "5";
output;
id= "Impt";
property="Nrules";
value= "5";
output;
id= "Impt";
property="Nsurrs";
value= "2";
output;
id= "Impt";
property="Splitsize";
value= ".";
output;
id= "Impt";
property="Indicator";
value= "NONE";
output;
id= "Impt";
property="IndicatorRole";
value= "REJECTED";
output;
id= "Impt";
property="ReplaceVariable";
value= "N";
output;
id= "Impt";
property="HideVariable";
value= "Y";
output;
id= "Impt";
property="IndicatorSource";
value= "IMPUTED";
output;
id= "Impt";
property="ForceRun";
value= "N";
output;
id= "Impt";
property="RunAction";
value= "Train";
output;
id= "Impt";
property="Component";
value= "Impute";
output;
id= "Impt";
property="EM_VARIABLEATTRIBUTES";
value= "WORK.Impt_VariableAttribute";
output;
id= "Impt";
property="EM_FILE_EMNOTES";
value= "Impt_EMNOTES.txt";
output;
id= "FIMPORT";
property="Location";
value= "CATALOG";
output;
id= "FIMPORT";
property="Catalog";
value= "SASHELP.EMSAMP.Fimport.SOURCE";
output;
id= "FIMPORT";
property="ImportType";
value= "Local";
output;
id= "FIMPORT";
property="GuessRows";
value= "500";
output;
id= "FIMPORT";
property="Delimiter";
value= ",";
output;
id= "FIMPORT";
property="NameRow";
value= "Y";
output;
id= "FIMPORT";
property="SkipRows";
value= "0";
output;
id= "FIMPORT";
property="MaxRows";
value= "1000000";
output;
id= "FIMPORT";
property="MaxCols";
value= "10000";
output;
id= "FIMPORT";
property="FileType";
value= "csv";
output;
id= "FIMPORT";
property="Role";
value= "TRAIN";
output;
id= "FIMPORT";
property="ForceRun";
value= "N";
output;
id= "FIMPORT";
property="Summarize";
value= "N";
output;
id= "FIMPORT";
property="AdvancedAdvisor";
value= "N";
output;
id= "FIMPORT";
property="RunAction";
value= "Train";
output;
id= "FIMPORT";
property="Component";
value= "FileImport";
output;
id= "FIMPORT";
property="IFileName";
value= "C:\Users\lenovo\Desktop\customer_behaviors_combined.csv";
output;
id= "FIMPORT";
property="AccessTable";
value= "NoTableName";
output;
id= "FIMPORT";
property="UserID";
value= "NoUserID";
output;
id= "FIMPORT";
property="Password";
value= "NoPassword";
output;
id= "FIMPORT";
property="ToolType";
value= "SAMPLE";
output;
id= "FIMPORT";
property="ToolPrefix";
value= "FIMPORT";
output;
id= "FIMPORT";
property="EM_VARIABLEATTRIBUTES";
value= "WORK.FIMPORT_VariableAttribute";
output;
id= "FIMPORT";
property="EM_FILE_USERTRAINCODE";
value= "FIMPORT_USERTRAINCODE.sas";
output;
id= "FIMPORT";
property="EM_FILE_VARIABLESETDELTA";
value= "FIMPORT_VARIABLESETDELTA.txt";
output;
id= "FIMPORT";
property="EM_FILE_DELTACODE";
value= "FIMPORT_DELTACODE.txt";
output;
id= "FIMPORT";
property="EM_FILE_EMNOTES";
value= "FIMPORT_EMNOTES.txt";
output;
run;
*------------------------------------------------------------*;
* Create connections data set;
*------------------------------------------------------------*;
data connect;
length from to $12;
from="Impt";
to="Tree4";
output;
from="FIMPORT";
to="Impt";
output;
run;
*------------------------------------------------------------*;
* Create actions to run data set;
*------------------------------------------------------------*;
%macro emaction;
%let actionstring = %upcase(&EM_ACTION);
%if %index(&actionstring, RUN) or %index(&actionstring, REPORT) %then %do;
data actions;
length id $12 action $40;
id="Tree4";
%if %index(&actionstring, RUN) %then %do;
action='run';
output;
%end;
%if %index(&actionstring, REPORT) %then %do;
action='report';
output;
%end;
run;
%end;
%mend;
%emaction;
*------------------------------------------------------------*;
* Execute the actions;
*------------------------------------------------------------*;
%em5batch(execute, workspace=workspace, nodes=nodes, connect=connect, datasources=datasources, nodeprops=nodeprops, action=actions);
