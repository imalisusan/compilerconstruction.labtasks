/** This lexical analyzer carries out an ATS compliance test on a CV for a particular job advertisement **/
/** It then recommends the person's CV for a junior or experienced role **/
/** If the person doesnt match with the skillset, it rejects the resume **/

/*** Job Descrition: Web Developer
/*** Skills set:
/*** 1. PHP Laravel 
/*** 2. MVC Architecture
/*** 3. Database(s) migrations - MySQL, MongoDB, postGres
/*** 4. Unit Testing
/*** 5. Relationships
/*** 6. Queues
/*** 7. Use of JavaScript frameworks - Vue/React
/*** 8. Webserver management (Apache/TomCat)
/*** Added Advantage Skills:
/*** - BootStrap
/*** - HTML & CSS
/*** - JavaScript
/*** - Mobile App Dev (Android/iOS) ***/


%{
int count_skills = 0;
int count_courses = 0;
%}

%%
"PHP"               count_skills++;
"Laravel"               count_skills++;
"MVC"               count_skills++;
"MySQL"               count_skills++;
"MongoDB"               count_skills++;
"Postgres"               count_skills++;
"Unit Testing"               count_skills++;
"Relationships"               count_skills++;
"Queues"               count_skills++;
"JavaScript"               count_skills++;
"Vue"               count_skills++;
"React"               count_skills++;
"Webserver"         count_skills++;
"Apache"         count_skills++;
"TomCat"         count_skills++;
"Bootstrap"         count_skills++;
"HTML"         count_skills++;
"CSS"         count_skills++;
"Android"         count_skills++;
"iOS"         count_skills++;
"Computer Science"         count_courses++;
"Information Technology"         count_courses++;
"Business Information Technology"         count_courses++;
"Web Development"         count_courses++;
"Computer Engineering"         count_courses++;
"Computer Programming"         count_courses++;
"Android Development"         count_courses++;
"Database Management"         count_courses++;

\n                   /* Ignore. */

%%
 
int yywrap(){}
int main(){ 

    //Take input
    FILE *fp;
    char filename[50];
    printf("Enter the filename: \n");
    scanf("%s",filename);
    fp = fopen(filename,"r");
    yyin = fp;
    
    yylex();
    printf("\nNumber of matched skills in the given input file: %d\n", count_skills);
    printf("\nNumber of matched courses in the given input file: %d\n", count_courses);

    //Compare skills
    if (count_skills >= 7 && count_courses >2)
    {
        printf("\nYou have been recommended for a senior role in web development %d");
    }
    else if (count_skills >= 4 && count_courses >=1)
    {
        printf("\nYou have been recommended for a junior role in web development %d");
    }
    else
    {
        printf("\n Application Rejected %d\n");
    }
    
    return 0;
}
