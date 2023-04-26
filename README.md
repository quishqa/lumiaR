# lumiaR
An R package to read and analyze air quality data from Lumiar mobile station.

## Installation

To install `lumiaR`, you required to first install `devtools`:

```r
install.packages("devtools"
```

Then to install `lumiaR`:

```r
devtools::install_github("quishqa/lumiaR")
```

## How to use

Currently, we have one function to read the NH3 data.

### Loading NH3 data

To load the NH3, we use the function `read_nh3_files`. In this example,
we read the data for December, 2022. It will return a data frame with `date` 
and `NH3` columns.

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


