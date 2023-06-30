## My Hacky Instructions ##
1) Download Miniconda. once it's downloaded...
2) Run Miniconda Command Prompt.
3) Type the word 'code' to open vscode. Make sure to open vscode -> "run as administrator"
4) Create a folder in your drive to store your environment. Go to that folder. example. C:\Users\Julius.Ongteco\Projects\snowpark\
5) In VS Code terminal, create a yaml file similar to jupyter_env.yml or edit it to your liking based on your dependencies.
6) Once done, run this in vs code terminal. conda env create --prefix ./snowpark -f jupyter_env.yml --> this should create an additional snowpark folder inside your snowpark folder.
7) Create an sql file to setup a table (setup.sql) then create a notebook (ab_test.ipynb)! 
8) Ensure that you download the Snowflake Extension (in Extensions) order to utilize the single sign on and for us to use the connector.