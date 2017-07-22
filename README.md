# DAL - Data Assertion Language

## DRAFT - WORK IN PROGRESS - DRAFT

## Purpose

This library aims to define a short yet powerfull syntax that describes the expected format of a dataset. The package then provides functionality to check and see if a given set of data meets this specification. A programming langauge agnostic format (YAML) was chosen such than parsers can be written for desired langauges whilst the core DAL syntax remain the same.

The primary use case is for functions that take datasets as inputs such that they can use DAL to validate said inputs.


The following is the R implementation of DAL

## Documentation

### General Usage

The core functionality of DAL within R can be used by calling the `assert_spec()` function which takes a data source and check whether it meets your required specification. Their are three main inputs to the functionality:

* `dat` - the data you which to validate
* `spec` - outlines how the data is expected to look.
* `file`- Can be used instead of `spec` to import the specification from a file

e.g.

```{r}
spec <- "
  <yaml spec>
"

assert_spec( data , spec)
```

or

```{r}
assert_spec( data , file = "./path_to_spec/spec.yml")
```

The rest of this documentation will outline the DAL syntax.

### Basic syntax

The most basic usage is to check for variable existance which can be done by simply listing variables underneath the `vars` keyword e.g.

```{yaml}
vars:
    - lglvar1
    - numvar1
```

In addition we can check for variable type by using the `type` option for each variable e.g.

```{yaml}
vars:
    - lglvar1:
        type: logical
    - numvar1:
        type: numeric
```

It is appreciated that writing `type` each time can get repetative especially if you have a lot of variables of the same type. To make life easier you can use the additional top level keywords of the form `vars_<type>` i.e. `vars_logical` or `vars_numeric`. For example:

```{yaml}
vars_numeric:
    - numvar1
    - numvar2
    - numvar3

vars_logical:
    - lglvar1
    - lglvar2
```

Currently supported data types include `numeric`, `logical` , `character`, `date` and `datetime`. Additional options available for each type are detailed below.

### Global options

The following options are supported by all types

|Option| Purpose|
|---|---|
| allow_na | Specify whether missing values should be accepted |
| class    | Specify whether a variable is a member of a specific class|

e.g.

```{yaml}
vars:
    numvar1:
        allow_na: False
        class: integer
```

### Numeric

Additional options -

|Option| Purpose|
|---|---|
| lower | Sets lower limit |
| upper | Sets upper limit |

e.g.

```{yaml}
vars_numeric:
    numvar1:
        lower: 3
        upper: 20
```

### Character

|Option| Purpose|
|---|---|
| format_re | A regular expression pattern that each value must match on |
| values   | A list of strings that each value must be a member of |

```{yaml}
vars_character:
    charvar1:
        format_re: "^\\w+$"
        values: ["yes" , "no"]
```


### Logical

Currently there are no additional options for logicals

### Date

Currently there are no additional options for dates

### Datetime

Currently there are no additional options for datetimes
