# A COVID-19, TABLEAU VISUALISATION

<br>

Hello!

In this project, I created a COVID19 Dashboard, using Tableau, Microsoft SQL Server, Microsoft SMSS, and a COVID19 dataset, provided by Our World In Data.

<br>
<br>
<br>
<br>

## Walkthrough

First, I planned out the dashboard. I came up with a goal for it, then figured out what the dashboards elements should be, and what kind of data each element 
would require, in order to achieve that goal.

Then, I realised that A LOT of the data, in the large dataset, wouldn't be used. So, instead of bringing the ENTIRE dataset into Tableau, I decided to extract/slice out only the bits of data that I needed, and bring those much smaller slices, into Tableau, instead. (This means Tableau won't slow down, and the UI won't be cluttered).

To perform the extracting/slicing, I went with SQL. So I uploaded the dataset to my Microsoft SQL Server, then queried the server, using Microsoft SMSS.

I took the result of each query, and imported it into Tableau via an excel file, then built the corresponding element. (The free version of Tableau, doesn't allow 
for a direct connection to a MS SQL server, hence the excel files as an intermediate step).

Once all the elements were built, I combined them, and made the dashboard, which is visible below (:


<br>
<br>
<br>


## Dashboard

A snapshot of the interactive dashboard is here, for convenience: <br><br>
![Image Of Interactive Dashboard](https://github.com/peterw-github/COVID19_SQL/blob/main/Images/COVID19-Viz.JPG)

<br>

The interactive dashboard, is available here: <br>
https://public.tableau.com/app/profile/peter.wotherspoon/viz/Covid19-Viz_16775565390780/Dashboard1



<br>
<br>
<br>


## SQL Code

The 4 queries written in SQL, that provide the data for the 4 dashboard elements, are available here: <br>
https://github.com/peterw-github/COVID19_SQL/blob/main/Queries.sql



<br>
<br>
<br>
<br>

### Data Source

The dataset provided by Our World In Data, is available here: <br>
https://ourworldindata.org/covid-deaths
