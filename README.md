[![Gem Version](https://badge.fury.io/rb/respanol.svg)](https://badge.fury.io/rb/respanol)
[![Test Coverage](https://codeclimate.com/github/tiev/respanol/badges/coverage.svg)](https://codeclimate.com/github/tiev/respanol/coverage)
[![Code Climate](https://codeclimate.com/github/tiev/respanol/badges/gpa.svg)](https://codeclimate.com/github/tiev/respanol)

# Respanol
Some ruby scripts to help learning Espanol.
These scripts are developed while I started studying Spanish.

**IN PROGRESS**: some might not be correct for whole situations but so far it's coped with what I've learnt about Español

# What's included?
These scripts test your Espanol knownledge in many aspects:

* Get word definition
* Number
* Days of the week
* Months of the year
* Verb Conjugations

# Installation
You should have installed Ruby.

Install respanol gem: `gem install respanol`

Require: `require 'respanol'`

Then, enjoy studying!

# Features & Exams

## Test your number reading and writing

Using `Respanol::Examen::NumeroExamen`

Test reading a random number in a range

`Respanol::Examen::NumeroExamen.new.leer(<rango>)`

  * **rango**: ruby range or maximum (excluded) number. Default: `(1...100)`

  Examples:
  ```
  > Respanol::Examen::NumeroExamen.new.leer
  > cincuenta y tres = 53
   => Muy bien!
  > Respanol::Examen::NumeroExamen.new.leer(10)
  > cinco = 3
   => No!
  cinco = 5
   => Muy bien!
  ```

Test writing a random number in a range

`Respanol::Examen::NumeroExamen.new.escribir(<rango>)`

  * **rango**: ruby range or maximum (excluded) number. Default: `(1...100)`

  Examples:
  ```
  > Respanol::Examen::NumeroExamen.new.escribir
  > 64 = sesenta y cuatro
   => Muy bien!
  ```

You can configure the test to use feminine number or default maximum

  ```
  > Respanol::Examen::NumeroExamen.new.tap { |e| e.feminino!.maximo = 50 }.leer
  ```
  is the same as:
  ```
  > e = Respanol::Examen::NumeroExamen.new.feminino
  > e.leer(50)
  > e.escribir(50)
  ```

## Verbs Conjugations
In this version, these exams support present tense only.

All verbs implemented is in namespace `Respanol::Verbo`.

Test verbs conjugations:

`Respanol::Examen::ConjugacionExamen.new.conjugado(<verbos>)`

  * **verbos**: accept a single verb class or an array of verb classes to be tested

```
> Respanol::Examen::ConjugacionExamen.new.conjugado(Respanol::Verbo::Poder)
Poder:: > Tu puedes
 => Muy bien!
```

You can configure a default list of verbs:

```
Respanol::Examen::ConjugacionExamen.new([Respanol::Verbo::Poder, Respanol::Verbo::Tener]).conjugado
Poder:: > Yo puedo
 => Muy bien!
Tener:: > Nosotros tenemos
 => Muy bien!
```

## Repeat a test many times

You can repeat a test many times to practice more:

`Respanol::Examen::ConjugacionExamen.gaza(<conde>, [<test instance>])`

Method `.gaza` works with all `Respanol::Examen` classes.

  Example: 3 following snippets have the same effect - test conjugation for Poder 5 times
  ```
  Respanol::Examen::ConjugacionExamen.gaza(5) do |t|
    t.conjugado(Respanol::Verbo::Poder)
  end
  ```

  ```
  t = Respanol::Examen::ConjugacionExamen.new(Respanol::Verbo::Poder)
  Respanol::Examen::ConjugacionExamen.gaza(5, t)
  ```

  ```
  Respanol::Examen::ConjugacionExamen.new(Respanol::Verbo::Poder).gaza(5)
  ```

If no repeat count given to `gaza()`, the default is `50`
