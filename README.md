# A COVID-19, TABLEAU VISUALISATION

<br>

Hello!

In this project, I created a COVID19 Dashboard, using Tableau, Microsoft SQL Server, Microsoft SMSS, and a COVID19 dataset, provided by Our World In Data.

<br>
<br>
<br>

## Walkthrough

First, I planned out the dashboard. I came up with a goal for it, then figured out what the dashboards elements should be, and what data each specfic element 
would require, in order to achieve that goal.

Then, I realised that A LOT of the data, in the large dataset, wouldn't be used. Thus, instead bringing the ENTIRE dataset into Tableau, I decided to 
extract/slice out the bits of data that I needed, and bring those much smaller slices, into Tableau instead. (This means Tableau won't slow down, and the UI
won't be cluttered).

To perform the extracting/slicing, I went with SQL. So I created a Microsoft SQL Server, then queried the server, using Microsoft SMSS.

I took the result of each query, and imported it into Tableau via an excel file, then built the corresponding element. (The free version of Tableau, doesn't allow 
for a direct connection to a MS SQL server, hence the excel files as an intermediate step).

Once all the elements were built, I combined them, and made the dashboard, which is visible below (:


<br>
<br>
<Br>


## Dashboard

insert link to dashboard image here:


The interactive dashboard, is available here: <br>
https://public.tableau.com/app/profile/peter.wotherspoon/viz/Covid19-Viz_16775565390780/Dashboard1



<br>
<br>
<br>


## SQL Code

The queries written in SQL, are available here: <br>
https://github.com/peterw-github/COVID19_SQL/blob/main/Queries.sql



<br>
<br>
<br>


### Data Source

The dataset provided by Our World In Data, is available here: <br>
https://ourworldindata.org/covid-deaths
