# lumiaR
<!-- badges: start -->
[![R-CMD-check](https://github.com/quishqa/lumiaR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/quishqa/lumiaR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->
An R package to read and analyze air quality data from Lumiar mobile station.

## Installation

To install `lumiaR`, you required to first install `devtools`:

```r
install.packages("devtools")
```

To install it in Windows, you first need to install `Rtools` 
and then `devtools`. Further information in 
[this link](https://www.r-project.org/nosvn/pandoc/devtools.html).
Install the version of `Rtools` depending on your R version.

Then to install `lumiaR`:

```r
devtools::install_github("quishqa/lumiaR")
```

## How to use

All the functions return a data frame ready to be used with 
[`openair`](https://github.com/davidcarslaw/openair).
Because the main input is the **complete directory path**
where the file is located, It is important to doblecheck this path.


### Loading NH3 data

To load and merge the NH3 `.dat` files, we use the function `read_nh3_files`.
In this example, we read the data for December, 2022. 
It will return a data frame with `date` and `NH3` columns.

```r
library(lumiaR)

nh3_dic_path <- "/home/myUser/Data/NH3/2022/12/"

nh3_dic <- read_nh3_files(nh3_dic_path)
```
By default, this function will transform
the data frame date column into local time ("America/Sao_Paulo"). To change it 
to local time, just add the argument `to_local = FALSE` inside the function.

Also, if you want other information from the NH3 files, just add the argument 
`col_names` and put the column names in a vector to retrive.

You can also add `hour = TRUE` to return hourly averages:

```r
nh3_dic_hour <- read_nh3_files(nh3_dic_path, hour = TRUE)
```

### Loading BC data

To load the BC `.dat` files, we used the function `read_bc_files`. The process is the 
same as `read_nh3_files`. You just need the folder with the data:

```r
library(lumiaR)
bc_dir_path <- "/home/myUser/Data/BC/2022/"

bc_2022 <- read_bc_files(bc_dir_path)
```

It returns a data frame with a `date` column as `POSIXct` and the BC columns 
in **ug/m3**, BB colum in **(%)**. If you want all the metadata,
just add the argument `bc_columns=FALSE`.

You can also add `hour = TRUE` to return hourly averages.

```r
bc_2022_hour <- read_bc_files(bc_dir_path, hour = TRUE)
```


### Loading Lumasense data

To load the Lumasense `.csv` files, we used the function `read_lumasense_files`. 
It has the same philosophy of previos functions.

```r
library(lumiaR)
lumiar_dir_path <- "/home/myUser/Data/Lumasense"
lumiar_data <- read_lumasense_files(luma_dir_path)
```

By default, it returns `date`, `co`, `co2`, and `ethanol` columns. If you want
all the metadata, add `pol_columns=FALSE` argument.

You can also add `hour = TRUE` to return hourly averages.

### Loading gases data

The gases data is in `xlsx` format. To load this data, 
we use `read_gases_files`.

```r
library(lumiaR)
gases_folder_path <- "/home/myUser/Data/gases/march"
gases_hour <- read_gases_files(gases_folder_path)
```

Data is available in different temporal resolution. We used the argument
`pattern`. `pattern` accepts `"Hour", "15 Minutes", and "Minute"`. By default
`pattern = "Hour"`.
