# GiftHealth Engineering Project


## Install, run and testing

### Pre-run steps:

```
$ cd gifthealth2/
```

### Requirements:

- rvm or rbenv
- ruby 3.0.3
- bundler version 2.2.32

### Grant permissions:

```
$ chmod +x bin/gifthealth
```

### Running the tests:

```
$ rspec
```

### Running the script:

```
$ bin/gifthealth public/pharmacy_system.txt
```


## Folders

### Bin Folder:

1. gifthealth - a written script for calling a class, to which I will pass the necessary classes as parameters. ARGV - array of arguments that we pass when running the script on the command line.

### Lib Folder:

1. reader.rb - check if the file exists, and if so, read it.
2. data_collector.rb - read each line of the file and group it in the following form: PatientName => { DrugName => EventName }.
3. counter_by_drug.rb - count the total values of filled prescriptions and income for each DrugName.
4. total_income.rb - count the total values of filled prescriptions and income for each PatientName.
5. printer.rb - output the received data in accordance with the requirements.
6. performance.rb - a perform method, that will use all classes and methods in the required order.

### Public:

1. pharmacy_system.txt - the file with the input data.

### Spec Folder

#### Bin Folder

1. Integration test for my script.

#### Lib Folder

1. Unit tests for my classes.

#### Fixtures Folder

1. test.txt - the file with test data.